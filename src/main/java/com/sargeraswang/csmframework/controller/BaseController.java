package com.sargeraswang.csmframework.controller;

import com.csvreader.CsvWriter;
import com.sargeraswang.csmframework.bean.*;
import com.sargeraswang.csmframework.bean.sys.SystemUser;
import com.sargeraswang.csmframework.common.Constants;
import com.sargeraswang.csmframework.common.ControllerPermissionType;
import com.sargeraswang.csmframework.common.SessionContext;
import com.sargeraswang.csmframework.common.annotation.ControllerPermission;
import com.sargeraswang.csmframework.common.exception.BaseUpdateException;
import com.sargeraswang.csmframework.common.util.JsonUtil;
import com.sargeraswang.csmframework.common.util.SpringBeanFactoryUtils;
import com.sargeraswang.csmframework.common.util.StatusUtil;
import com.sargeraswang.csmframework.common.util.StringUtil;
import com.sargeraswang.csmframework.service.BaseService;
import com.sargeraswang.excelutil.ExcelUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by SagerasWang on 14/11/24.
 */
@Controller
@RequestMapping("/base")
public class BaseController {

    private static Logger LG = Logger.getLogger(BaseController.class);

    @Resource
    BaseService service;

    @ResponseBody
    @RequestMapping("/query")
    @ControllerPermission(ControllerPermissionType.AFTER_LOGIN)
    public String query(@RequestParam Map<String, String> allRequestParams) {
        String echo = allRequestParams.get("draw");
        BaseQueryParamater bp = new BaseQueryParamater(allRequestParams);
        List<Object> list = service.queryForList(bp);
        if (StringUtils.isNotBlank(echo)) {
            Integer allCount = service.queryCount(bp);
            BaseQueryAjaxBean bean = new BaseQueryAjaxBean();
            bean.setData(list);
            bean.setRecordsTotal(allCount);
            bean.setRecordsFiltered(allCount);
            bean.setDraw(Integer.valueOf(echo));
            return JsonUtil.toJson(bean);
        }
        return JsonUtil.toJson(list);

    }

    @ResponseBody
    @RequestMapping("/execute")
    @ControllerPermission(ControllerPermissionType.AFTER_LOGIN)
    public String execute(@RequestParam Map<String, String> allRequestParams) {
        BaseExecuteAjaxBean bean = new BaseExecuteAjaxBean();
        try {
            BaseExecuteParamater bp = new BaseExecuteParamater(allRequestParams);
            Integer r = service.execute(bp);
            if (r > 0) {
                bean.setStatus(BaseExecuteAjaxBean.Status.SUCCESS);
            } else {
                bean.setStatus(BaseExecuteAjaxBean.Status.FAILURE);
            }
        } catch (Exception e) {
            throw new BaseUpdateException(e);
        }
        return JsonUtil.toJson(bean);

    }

    @ResponseBody
    @RequestMapping("/executeBatch")
    @ControllerPermission(ControllerPermissionType.AFTER_LOGIN)
    public String executeBatch(@RequestParam Map<String, String> allRequestParams) {
        BaseExecuteAjaxBean bean = new BaseExecuteAjaxBean();
        try {
            BaseExecuteBatchParamater bp = new BaseExecuteBatchParamater(allRequestParams);
            Integer r = service.execute(bp);
            if (r > 0) {
                bean.setStatus(1);
            } else {
                bean.setStatus(0);
            }
        } catch (Exception e) {
            throw new BaseUpdateException(e);
        }
        return JsonUtil.toJson(bean);

    }

    @ResponseBody
    @RequestMapping("/getStatusJS/{id}")
    @ControllerPermission(ControllerPermissionType.AFTER_LOGIN)
    public BaseJsString getStatusJS(@PathVariable("id") String id, HttpServletResponse response) {
        Map<String, String> status = StatusUtil.getStatus(id);
        if (status != null) {
            response.setContentType("application/javascript;charset=utf-8");
            StringBuilder sb = new StringBuilder();
            sb.append("var ").append(id).append("=");
            sb.append("{");
            for (String k : status.keySet()) {
                sb.append("'").append(k).append("'");
                sb.append(":");
                sb.append("'").append(status.get(k)).append("',");
            }
            sb.append("};");
            BaseJsString js = new BaseJsString();
            js.setContent(sb.toString());
            return js;
        } else {
            LG.warn("getStatusJS找不到对应的status,id=" + id);
            return null;
        }

    }

    @ResponseBody
    @RequestMapping("/tableDownload")
    @ControllerPermission(value = ControllerPermissionType.AFTER_LOGIN)
    public void tableDownload(@RequestParam Map<String, String> allRequestParams, HttpServletResponse response) throws IOException {
        String type = allRequestParams.get("type");
        String index = allRequestParams.get("index");
        String fileName = URLEncoder.encode(allRequestParams.get("fileName"), "UTF-8");
        String columns = allRequestParams.get("columns");
        String statusColumn = allRequestParams.get("statusColumn");
        String params = allRequestParams.get("params");
        String _order = allRequestParams.get("order");
        //order
        Map<String, Object> paramater = new HashMap<>();
        if (StringUtil.isNotBlank(_order)) {
            String[] or = _order.split(",");
            String o_col = StringUtil.transactSQLInjection(or[0]);
            String o_dir;
            if (or.length == 2 && or[1].equalsIgnoreCase("desc")) {
                o_dir = "desc";
            } else {
                o_dir = "asc";
            }
            paramater.put(Constants.BASEPARAMATER_ORDER, o_col + " " + o_dir);
        } else {
            paramater.put(Constants.BASEPARAMATER_ORDER, "null");
        }
        //queryParams
        Map queryMap = JsonUtil.fromJson(params, Map.class);
        paramater.putAll(queryMap);

        List<Object> datalist = service.queryForList(index, paramater);
        String[][] dataArray = service.assembleTableData(statusColumn, datalist, columns);

        ServletOutputStream outputStream = response.getOutputStream();
        if (type.equalsIgnoreCase("CSV")) {
            response.setContentType("text/csv;charset=utf-8");
            response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".csv");
            CsvWriter wr = new CsvWriter(outputStream, ',', Charset.forName("UTF-8"));
            for (String[] s : dataArray) {
                wr.writeRecord(s);
            }
            wr.close();
        } else {
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".xls");
            ExcelUtil.exportExcel(dataArray, outputStream);
        }
        outputStream.flush();
        outputStream.close();
    }

    @ResponseBody
    @RequestMapping("/getTables")
    @ControllerPermission(value = ControllerPermissionType.CUSTOMER, prefix = "/view/generateCode.do")
    public String getTables() {
        List<String> list = service.getTables();
        return JsonUtil.toJson(list);
    }

    @ResponseBody
    @RequestMapping("/getColumns")
    @ControllerPermission(value = ControllerPermissionType.CUSTOMER, prefix = "/view/generateCode.do")
    public String getColumns(@RequestParam Map<String, String> allRequestParams) {
        String table = allRequestParams.get("table");
        List<BaseTableColumn> list = service.getColumns(table);
        return JsonUtil.toJson(list);
    }

    @ResponseBody
    @RequestMapping("/getAllStatusMap")
    @ControllerPermission(value = ControllerPermissionType.CUSTOMER, prefix = "/view/generateCode.do")
    public String getAllStatusMap() {
        Map<String, Map<String, String>> allStatusMap = StatusUtil.getAllStatusMap();
        List<Map<String, Map<String, String>>> list = new ArrayList<>();
        for (String key : allStatusMap.keySet()) {
            Map<String, Map<String, String>> map = new HashMap<>();
            map.put(key, allStatusMap.get(key));
            list.add(map);
        }
        return JsonUtil.toJson(list);
    }

    @ResponseBody
    @RequestMapping("/getAllSqlIndex")
    @ControllerPermission(ControllerPermissionType.ONLY_ADMIN)
    public String getAllSqlIndex() {
        Map<String, List<String>> map = service.getAllSqlIndex();
        return JsonUtil.toJson(map);
    }

    @ResponseBody
    @RequestMapping("/generateCode")
    @ControllerPermission(value = ControllerPermissionType.CUSTOMER, prefix = "/view/generateCode.do")
    public void generateCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String[] tables = request.getParameterValues("tables");
        String[] types = request.getParameterValues("types");
        //表设置
        Map<String, List<Map<String, String>>> configList = new HashMap<>();
        for (String table : tables) {
            String[] arrConfig = request.getParameterValues(table + "_config");
            if (arrConfig == null) {
                continue;
            }
            String config = arrConfig[0];
            List<Map<String, String>> list = (List<Map<String, String>>) JsonUtil.fromJson(config, List.class);
            configList.put(table, list);
        }

        ByteArrayOutputStream baos = service.generateCode(tables, types, configList);

        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-disposition", "attachment; filename=code.zip");
        IOUtils.write(baos.toByteArray(), response.getOutputStream());
        response.flushBuffer();
    }

    @ResponseBody
    @RequestMapping("/getOnlineUsers")
    @ControllerPermission(ControllerPermissionType.ONLY_ADMIN)
    public String getOnlineUsers() {
        SessionContext sessionContext = SpringBeanFactoryUtils.getBean(SessionContext.class);
        Collection<BaseHttpSession> sessionList = sessionContext.getSessionList();
        List<Map<String, String>> list = new ArrayList<>(sessionList.size());
        if (CollectionUtils.isEmpty(sessionList)) {
            return JsonUtil.toJson(list);
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        for (BaseHttpSession s : sessionList) {
            HttpSession httpSession = s.getSession();
            SystemUser user = (SystemUser) httpSession.getAttribute(Constants.SESSION_KEY_UINFO);
            if (user == null) {
                continue;
            }
            Map<String, String> m = new HashMap<>(5);
            m.put("user_name", user.getName());
            m.put("ip", s.getRemoteIp());
            m.put("start_time", sdf.format(new Date(httpSession.getCreationTime())));
            m.put("session_id", httpSession.getId());
            list.add(m);
        }
        return JsonUtil.toJson(list);
    }

    @ResponseBody
    @RequestMapping("/disconnectSession")
    @ControllerPermission(ControllerPermissionType.ONLY_ADMIN)
    public String disconnectSession(@RequestParam("session_id") String session_id, HttpServletRequest request) {
        Map<String, String> result = new HashMap<>(1);
        SessionContext context = SpringBeanFactoryUtils.getBean(SessionContext.class);
        HttpSession session = context.getSession(session_id);
        if (session == null) {
            result.put("msg", "该用户在操作之前已断开.");
        } else {
            LG.info("用户[" + session.getAttribute(Constants.SESSION_KEY_UID) + "]被管理员[" +
                    request.getSession().getAttribute(Constants.SESSION_KEY_UID) + "]强制下线");
            session.invalidate();
            result.put("msg", "操作成功.");
        }
        return JsonUtil.toJson(result);
    }

    @ResponseBody
    @RequestMapping("/sendTestMail")
    @ControllerPermission(ControllerPermissionType.ONLY_ADMIN)
    public String sendTestMail() {
        LG.error("测试一下发送Error邮件是否可用", new NullPointerException("一个测试异常"));
        Map<String, String> map = new HashMap<>(1);
        map.put("msg", "已抛出异常");
        return JsonUtil.toJson(map);
    }

}
