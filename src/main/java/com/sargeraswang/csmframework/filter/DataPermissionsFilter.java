package com.sargeraswang.csmframework.filter;

import com.sargeraswang.csmframework.bean.sys.SystemUser;
import com.sargeraswang.csmframework.common.Constants;
import com.sargeraswang.csmframework.common.util.JsonUtil;
import com.sargeraswang.csmframework.common.util.StringUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by SagerasWang on 15/2/28.
 */
public class DataPermissionsFilter extends HandlerInterceptorAdapter {

    private static final Logger LG = Logger.getLogger(DataPermissionsFilter.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String index = request.getParameter("index");

        if (StringUtil.isBlank(index)) {
            LG.info("访问base接口,index不应为空,拒绝请求");
            response.setStatus(HttpServletResponse.SC_PAYMENT_REQUIRED);
            response.flushBuffer();
            return false;
        }
        HttpSession session = request.getSession();
        SystemUser currentUser = (SystemUser)session.getAttribute(Constants.SESSION_KEY_UINFO);
        //管理员不控管权限
        if(Constants.SYSTEM_ROLE_ADMIN_TYPE.equals(currentUser.getRole().getType())){
            return true;
        }
        List<String> indexList = (List<String>)session.getAttribute(Constants.SESSION_KEY_SQLINDEXLIST);
        if(CollectionUtils.isEmpty(indexList)){
            LG.info("用户数据权限为空,拒绝请求");
            response.setStatus(HttpServletResponse.SC_PAYMENT_REQUIRED);
            response.flushBuffer();
            return false;
        }
        if(indexList.contains(index) == false){
            LG.info("当前用户无权限操作SqlIndex["+index+"],拒绝请求");
            response.setStatus(HttpServletResponse.SC_PAYMENT_REQUIRED);
            response.flushBuffer();
            return false;
        }
        return true;
    }
}
