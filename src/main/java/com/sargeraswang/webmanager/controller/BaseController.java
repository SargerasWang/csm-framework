package com.sargeraswang.webmanager.controller;

import com.csvreader.CsvWriter;
import com.sargeraswang.excelutil.ExcelUtil;
import com.sargeraswang.webmanager.bean.*;
import com.sargeraswang.webmanager.common.Constants;
import com.sargeraswang.webmanager.common.util.JsonUtil;
import com.sargeraswang.webmanager.common.util.StatusUtil;
import com.sargeraswang.webmanager.common.util.StringUtil;
import com.sargeraswang.webmanager.service.BaseService;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonNode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public String query(@RequestParam Map<String, String> allRequestParams) {
        try {
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
        } catch (Exception e) {
            LG.error(e.toString(), e);
            return null;
        }

    }

    @ResponseBody
    @RequestMapping("/execute")
    public String execute(@RequestParam Map<String, String> allRequestParams) {
        BaseExecuteAjaxBean bean = new BaseExecuteAjaxBean();
        try {
            BaseExecuteParamater bp = new BaseExecuteParamater(allRequestParams);
            Integer r = service.execute(bp);
            if (r > 0) {
                bean.setStatus(1);
            } else {
                bean.setStatus(0);
            }
        } catch (Exception e) {
            LG.error(e.toString(), e);
            bean.setStatus(BaseExecuteAjaxBean.Status.ERROR);
            bean.setMessage(e.toString());
        }
        return JsonUtil.toJson(bean);

    }

    @ResponseBody
    @RequestMapping("/executeBatch")
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
            LG.error(e.toString(), e);
            bean.setStatus(BaseExecuteAjaxBean.Status.ERROR);
            bean.setMessage(e.toString());
        }
        return JsonUtil.toJson(bean);

    }

    @ResponseBody
    @RequestMapping("/getStatusJS/{id}")
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
    public void tableDownload(@RequestParam Map<String, String> allRequestParams, HttpServletResponse response) {
        try {
            String type = allRequestParams.get("type");
            String index = allRequestParams.get("index");
            String fileName = URLEncoder.encode(allRequestParams.get("fileName"),"UTF-8");
            String columns = allRequestParams.get("columns");
            String statusColumn = allRequestParams.get("statusColumn");
            String params = allRequestParams.get("params");
            String _order = allRequestParams.get("order");
            //order
            Map<String, Object> paramater = new HashMap<>();
            if(StringUtil.isNotBlank(_order)){
                String[] or = _order.split(",");
                String o_col = StringUtil.transactSQLInjection(or[0]);
                String o_dir;
                if(or.length == 2 && or[1].equalsIgnoreCase("desc")){
                    o_dir = "desc";
                }else{
                    o_dir = "asc";
                }
                paramater.put(Constants.BASEPARAMATER_ORDER,o_col+" "+o_dir);
            }else {
                paramater.put(Constants.BASEPARAMATER_ORDER, "null");
            }
            //queryParams
            Map queryMap = JsonUtil.fromJson(params, Map.class);
            paramater.putAll(queryMap);

            List<Object> datalist = service.queryForList(index, paramater);
            String[][] dataArray = service.assembleTableData(statusColumn, datalist, columns);

            ServletOutputStream outputStream = response.getOutputStream();
            if(type.equalsIgnoreCase("CSV")){
                response.setContentType("text/csv;charset=utf-8");
                response.setHeader("Content-disposition", "attachment; filename="+fileName+".csv");
                CsvWriter wr = new CsvWriter(outputStream,',',Charset.forName("UTF-8"));
                for(String[] s : dataArray){
                    wr.writeRecord(s);
                }
                wr.close();
            }else{
                response.setContentType("application/vnd.ms-excel;charset=utf-8");
                response.setHeader("Content-disposition", "attachment; filename="+fileName+".xls");
                ExcelUtil.exportExcel(dataArray, outputStream);
            }
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            LG.error(e.toString(),e);
        }
    }

    @ResponseBody
    @RequestMapping("/getTables")
    public String getTables() {
        try {
            List<String> list = service.getTables();
            return JsonUtil.toJson(list);
        } catch (Exception e) {
            LG.error(e.toString(), e);
            return null;
        }

    }

    @ResponseBody
    @RequestMapping("/getColumns")
    public String getColumns(@RequestParam Map<String, String> allRequestParams) {
        try {
            String table = allRequestParams.get("table");
            List<BaseTableColumn> list = service.getColumns(table);
            return JsonUtil.toJson(list);
        } catch (Exception e) {
            LG.error(e.toString(), e);
            return null;
        }

    }

    @ResponseBody
    @RequestMapping("/getAllStatusMap")
    public String getAllStatusMap() {
        try {
            Map<String, Map<String, String>> allStatusMap = StatusUtil.getAllStatusMap();
            List<Map<String, Map<String, String>>> list = new ArrayList<>();
            for(String key : allStatusMap.keySet()){
                Map<String, Map<String, String>> map = new HashMap<>();
                map.put(key,allStatusMap.get(key));
                list.add(map);
            }
            return JsonUtil.toJson(list);
        } catch (Exception e) {
            LG.error(e.toString(), e);
            return null;
        }

    }

    @ResponseBody
    @RequestMapping("/generateCode")
    public void generateCode(HttpServletRequest request, HttpServletResponse response) {
        String[] tables = request.getParameterValues("tables");
        String[] types = request.getParameterValues("types");
        //表设置
        Map<String,List<Map<String,String>>> configList = new HashMap<>();
        for(int i = 0;i<tables.length;i++){
            String table = tables[i];
            String[] arrConfig = request.getParameterValues(table + "_config");
            if(arrConfig == null){
                continue;
            }
            String config = arrConfig[0];
            List<Map<String,String>> list = (List<Map<String,String>>)JsonUtil.fromJson(config, List.class);
            configList.put(table,list);
        }

        ByteArrayOutputStream baos = service.generateCode(tables, types,configList);
        try {
            response.setContentType("application/octet-stream;charset=utf-8");
            response.setHeader("Content-disposition", "attachment; filename=code.zip");
            IOUtils.write(baos.toByteArray(), response.getOutputStream());
            response.flushBuffer();
        } catch (IOException e) {
            LG.error(e.toString(),e);
        }
    }

}
