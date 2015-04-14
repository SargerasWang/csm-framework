package com.sargeraswang.csmframework.controller;

import com.sargeraswang.csmframework.bean.BaseExecuteAjaxBean;
import com.sargeraswang.csmframework.common.exception.BaseUpdateException;
import com.sargeraswang.csmframework.common.util.JsonUtil;
import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by SagerasWang on 15/3/30.
 */
@ControllerAdvice
public class GlobalExceptionController {

    private static final Logger LG=Logger.getLogger(GlobalExceptionController.class);

    @ResponseBody
    @ExceptionHandler(BaseUpdateException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public String handleAjaxUpdateException(Exception ex) {
        LG.error(ex.toString(),ex);


        return JsonUtil.toJson(new BaseExecuteAjaxBean(ex));

    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ModelAndView handleAllException(Exception ex) {
        LG.error(ex.toString(),ex);

        ModelAndView model = new ModelAndView("error");
        model.addObject("message",ex.getMessage());
        return model;

    }
}
