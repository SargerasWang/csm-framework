package com.sargeraswang.csmframework.bean;

import javax.servlet.http.HttpSession;

/**
 * Created by SagerasWang on 15/3/2.
 */
public class BaseHttpSession {
    private HttpSession session;
    private String remoteIp;

    public HttpSession getSession() {
        return session;
    }

    public void setSession(HttpSession session) {
        this.session = session;
    }

    public String getRemoteIp() {
        return remoteIp;
    }

    public void setRemoteIp(String remoteIp) {
        this.remoteIp = remoteIp;
    }
}
