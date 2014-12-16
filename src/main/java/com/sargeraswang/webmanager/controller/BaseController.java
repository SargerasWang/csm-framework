package com.sargeraswang.webmanager.controller;

import com.csvreader.CsvWriter;
import com.sargeraswang.excelutil.ExcelUtil;
import com.sargeraswang.webmanager.bean.BaseExecuteAjaxBean;
import com.sargeraswang.webmanager.bean.BaseExecuteParamater;
import com.sargeraswang.webmanager.bean.BaseQueryAjaxBean;
import com.sargeraswang.webmanager.bean.BaseQueryParamater;
import com.sargeraswang.webmanager.common.Constants;
import com.sargeraswang.webmanager.common.util.JsonUtil;
import com.sargeraswang.webmanager.common.util.StatusUtil;
import com.sargeraswang.webmanager.common.util.StringUtil;
import com.sargeraswang.webmanager.service.BaseService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.Charset;
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
            Integer allCount = service.queryCount(bp);
            BaseQueryAjaxBean bean = new BaseQueryAjaxBean();
            bean.setData(list);
            bean.setRecordsTotal(allCount);
            bean.setRecordsFiltered(allCount);
            if (StringUtils.isNotBlank(echo)) {
                bean.setDraw(Integer.valueOf(echo));
            }
            return JsonUtil.toJson(bean);
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
    @RequestMapping("/getStatusJS/{id}")
    public String getStatusJS(@PathVariable("id") String id) {
        Map<String, String> status = StatusUtil.getStatus(id);
        if (status != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("var ").append(id).append("=");
            sb.append("{");
            for (String k : status.keySet()) {
                sb.append("'").append(k).append("'");
                sb.append(":");
                sb.append("'").append(status.get(k)).append("',");
            }
            sb.append("};");
            return sb.toString();
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

}
