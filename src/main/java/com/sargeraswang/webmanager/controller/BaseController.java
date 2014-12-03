package com.sargeraswang.webmanager.controller;

import com.sargeraswang.webmanager.bean.BaseExecuteAjaxBean;
import com.sargeraswang.webmanager.bean.BaseExecuteParamater;
import com.sargeraswang.webmanager.bean.BaseQueryAjaxBean;
import com.sargeraswang.webmanager.bean.BaseQueryParamater;
import com.sargeraswang.webmanager.common.util.JsonUtil;
import com.sargeraswang.webmanager.service.BaseService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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
            if(r>0){
                bean.setStatus(1);
            }else{
                bean.setStatus(0);
            }
        } catch (Exception e) {
            LG.error(e.toString(), e);
            bean.setStatus(BaseExecuteAjaxBean.Status.ERROR);
            bean.setMessage(e.toString());
        }
        return JsonUtil.toJson(bean);

    }

}
