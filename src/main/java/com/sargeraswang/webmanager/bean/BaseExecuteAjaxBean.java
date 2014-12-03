package com.sargeraswang.webmanager.bean;

/**
 * Created by SagerasWang on 14/12/3.
 */
public class BaseExecuteAjaxBean {
    private Integer status;
    private String message;

    public interface Status{
        Integer SUCCESS=1;
        Integer FAILURE=0;
        Integer ERROR=-1;
    }
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
