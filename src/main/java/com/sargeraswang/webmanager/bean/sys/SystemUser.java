package com.sargeraswang.webmanager.bean.sys;

import java.util.Date;

/**
 * Created by SagerasWang on 14/12/30.
 */
public class SystemUser {
    private Integer id;
    private SystemRole role;
    private String login_name;
    private String name;
    private String info;
    private Integer status;
    private String mobile;
    private Integer error_num;
    private Date c_time;
    private Integer c_user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public SystemRole getRole() {
        return role;
    }

    public void setRole(SystemRole role) {
        this.role = role;
    }

    public String getLoginName() {
        return login_name;
    }

    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getError_num() {
        return error_num;
    }

    public void setError_num(Integer error_num) {
        this.error_num = error_num;
    }

    public Date getC_time() {
        return c_time;
    }

    public void setC_time(Date c_time) {
        this.c_time = c_time;
    }

    public Integer getC_user() {
        return c_user;
    }

    public void setC_user(Integer c_user) {
        this.c_user = c_user;
    }
}
