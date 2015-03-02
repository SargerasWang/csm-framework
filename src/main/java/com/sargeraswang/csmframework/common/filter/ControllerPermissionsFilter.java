package com.sargeraswang.csmframework.common.filter;

import com.sargeraswang.csmframework.bean.sys.SystemMenu;
import com.sargeraswang.csmframework.bean.sys.SystemUser;
import com.sargeraswang.csmframework.common.Constants;
import com.sargeraswang.csmframework.common.ControllerPermissionType;
import com.sargeraswang.csmframework.common.annotation.ControllerPermission;
import com.sargeraswang.csmframework.common.util.StringUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.invoke.MethodHandle;
import java.util.List;

/**
 * Created by SagerasWang on 15/2/28.
 */
public class ControllerPermissionsFilter extends HandlerInterceptorAdapter {

    private static final Logger LG = Logger.getLogger(ControllerPermissionsFilter.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        SystemUser currentUser = (SystemUser)session.getAttribute(Constants.SESSION_KEY_UINFO);
        //管理员不控管权限
        boolean isAdmin = currentUser != null && Constants.SYSTEM_ROLE_ADMIN_TYPE.equals(currentUser.getRole().getType());
        if(isAdmin){
            return true;
        }

        if(handler instanceof HandlerMethod){
            HandlerMethod hm = (HandlerMethod)handler;
            ControllerPermission annotation = hm.getMethod().getAnnotation(ControllerPermission.class);
            if(annotation == null){
                return nopass("Controller 方法 ["+hm.toString() +"]没有设置权限!",response);
            }
            ControllerPermissionType type = annotation.value();
            switch (type){
                case PUBLIC:
                    return true;
                case AFTER_LOGIN:
                    if(currentUser == null){
                        return nopass("当前请求用户未登录,无法访问方法"+hm.toString(),response);
                    }
                    return true;
                case ONLY_ADMIN:
                    if(! isAdmin){
                        return nopass("当前请求方法要求只有admin可以访问,用户=["+currentUser.getId()+"],方法="+hm.toString(),response);
                    }
                    return true;
                case CUSTOMER:
                    String[] prefix = annotation.prefix();
                    if(prefix == null || prefix.length ==0 || StringUtil.isBlank(prefix[0])){
                        return nopass("Controller 方法 ["+hm.toString() +"]使用自定义权限却未设置前缀!",response);
                    }
                    List<SystemMenu> sysMenus = (List<SystemMenu>)session.getAttribute(Constants.SESSION_KEY_MENULIST);
                    if(CollectionUtils.isEmpty(sysMenus)){
                        return nopass("当前登陆者session中菜单为空,user_id="+currentUser.getId(),response);
                    }
                    for(SystemMenu menu : sysMenus){
                        if(StringUtil.isNotBlank(menu.getUrl())){
                            for(String p : prefix){
                                if(menu.getUrl().startsWith(p)) {
                                    return true;
                                }
                            }
                        }
                    }
                    return nopass("Controller 权限验证失败,用户["+currentUser.getId()+"]试图访问["+hm.toString()+"].",response);
            }
        }
        return true;
    }

    private boolean nopass(String log,HttpServletResponse response){
        response.setStatus(HttpServletResponse.SC_PAYMENT_REQUIRED);
        LG.warn(log);
        return false;
    }
}
