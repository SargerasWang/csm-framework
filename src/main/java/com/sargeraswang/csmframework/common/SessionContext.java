package com.sargeraswang.csmframework.common;

import com.sargeraswang.csmframework.bean.BaseHttpSession;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by SagerasWang on 15/3/2.
 */
public class SessionContext {
    private Map<String,BaseHttpSession> sessionMap = new HashMap<>();

    public void addSession(HttpSession session,String remoteIp){
        BaseHttpSession bhs = new BaseHttpSession();
        bhs.setSession(session);
        bhs.setRemoteIp(remoteIp);
        sessionMap.put(session.getId(),bhs);
    }

    public HttpSession getSession(String session_id){
        if(sessionMap.containsKey(session_id)){
            return sessionMap.get(session_id).getSession();
        }
        return null;
    }

    public void removeSession(HttpSession session){
        sessionMap.remove(session.getId());
    }

    public Collection<BaseHttpSession> getSessionList(){
        return sessionMap.values();
    }
}
