package com.sargeraswang.webmanager.dao.mapper;

import com.sargeraswang.webmanager.bean.sys.SystemMenu;
import com.sargeraswang.webmanager.bean.sys.SystemUser;

import java.util.List;
import java.util.Map;

public interface LoginMapper {

    List<SystemUser> selectUserByLogin(Map<String,Object> params);
    List<SystemMenu> selectAllMenus();
}