package com.sargeraswang.csmframework.dao.mapper;

import com.sargeraswang.csmframework.bean.sys.SystemMenu;
import com.sargeraswang.csmframework.bean.sys.SystemUser;

import java.util.List;
import java.util.Map;

public interface LoginMapper {

    List<SystemUser> selectUserByLogin(Map<String,Object> params);
    List<SystemMenu> selectAllMenus();
    List<SystemMenu> selectMenusByRoleId(Integer roleId);
}