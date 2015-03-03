package com.sargeraswang.csmframework.common.listener;

import com.sargeraswang.csmframework.common.SessionContext;
import com.sargeraswang.csmframework.common.util.SpringBeanFactoryUtils;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Created by SagerasWang on 15/3/2.
 */
public class SessionListener implements HttpSessionListener{

    @Override
    public void sessionCreated(HttpSessionEvent se) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        SessionContext sessionContext = SpringBeanFactoryUtils.getBean(SessionContext.class);
        sessionContext.removeSession(se.getSession());
    }
}
