package com.sargeraswang.csmframework.common.filter;

import com.sargeraswang.csmframework.common.Constants;
import org.apache.log4j.MDC;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by SagerasWang on 15/4/20.
 */
public class Log4jMDCPropertyAdapter extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object uid = request.getSession().getAttribute(Constants.SESSION_KEY_UID);

        MDC.put("ip", request.getRemoteAddr());
        MDC.put("user", uid == null ? "Non-logged-in user" : "logeed-uid:" + uid);
        return true;
    }
}
