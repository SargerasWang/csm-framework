package com.sargeraswang.csmframework.controller;

import com.sargeraswang.csmframework.bean.sys.SystemMenu;
import com.sargeraswang.csmframework.bean.sys.SystemUser;
import com.sargeraswang.csmframework.common.Constants;
import com.sargeraswang.csmframework.common.ControllerPermissionType;
import com.sargeraswang.csmframework.common.annotation.ControllerPermission;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by SagerasWang on 15/3/2.
 */
@Controller
public class ViewController {

    private static final Logger LG = Logger.getLogger(ViewController.class);

    @RequestMapping("/view/{filename}")
    @ControllerPermission(ControllerPermissionType.AFTER_LOGIN)
    public String toPage(@PathVariable("filename") String filename,HttpServletRequest request,HttpServletResponse response) {
        String targetUrl = "/jsp/" + filename.replaceAll("\\.","/");
        HttpSession session = request.getSession();
        SystemUser currentUser = (SystemUser)session.getAttribute(Constants.SESSION_KEY_UINFO);
        //管理员不控管权限
        if(Constants.SYSTEM_ROLE_ADMIN_TYPE.equals(currentUser.getRole().getType())){
            return targetUrl;
        }
        List<String> menuList = convertToStringList((List<SystemMenu>) session.getAttribute(Constants.SESSION_KEY_MENULIST));
        List<String> allList = convertToStringList((List<SystemMenu>) session.getAttribute(Constants.SESSION_KEY_MENULIST_ALL));
        String url = "/view/"+filename+".do";
        if(!menuList.contains(url) && allList.contains(url)){
            LG.warn("用户访问页面无权限,被拒绝.user_id="+ session.getAttribute(Constants.SESSION_KEY_UID)+",url="+url);
            response.setStatus(HttpServletResponse.SC_PAYMENT_REQUIRED);
            return null;
        }
        return targetUrl;
    }

    private List<String> convertToStringList(List<SystemMenu> list ){
        List<String> sl = new ArrayList<>(list.size());
        for(SystemMenu sm : list){
            sl.add(sm.getUrl());
        }
        return sl;
    }
}
