package com.sargeraswang.csmframework.service;

import com.sargeraswang.csmframework.bean.sys.SystemMenu;
import com.sargeraswang.csmframework.bean.sys.SystemUser;
import com.sargeraswang.csmframework.bean.sys.TreeMenu;
import com.sargeraswang.csmframework.dao.mapper.LoginMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    LoginMapper loginMapper;

    private static final transient Logger LOG = LoggerFactory.getLogger(UserService.class);

    public List<SystemUser> selectUserByLogin(String loginname , String password){
        Map<String,Object> param= new HashMap<>();
        param.put("loginname",loginname);
        param.put("password",password);
        return loginMapper.selectUserByLogin(param);
    }

    public List<TreeMenu> getAllTreeMenus(){
        List<SystemMenu> systemMenus = loginMapper.selectAllMenus();
        List<TreeMenu> treeMenus = generateTreeMenus(systemMenus);
        return treeMenus;
    }

    public List<TreeMenu> getTreeMenusByRoleId(Integer roleId){
        List<SystemMenu> systemMenus = loginMapper.selectMenusByRoleId(roleId);
        List<TreeMenu> treeMenus = generateTreeMenus(systemMenus);
        return treeMenus;
    }

    public List<String> selectSqlIndexByRoleId(Integer roleId){
        List<String> sqlIndexList = loginMapper.selectSqlIndexByRoleId(roleId);
        return sqlIndexList;
    }

    private List<TreeMenu> generateTreeMenus(List<SystemMenu> systemMenus) {
        List<TreeMenu> treeMenus = new ArrayList<>();
        for(SystemMenu menu : systemMenus){
            if(menu.getLevel() == 1){
                TreeMenu tm = new TreeMenu(menu);
                List<TreeMenu> childrens = new ArrayList<>();
                tm.setChildrens(childrens);
                for(SystemMenu subMenu : systemMenus){
                    if(subMenu.getLevel() ==2 && subMenu.getParent() == tm.getId()){
                        childrens.add(new TreeMenu(subMenu));
                    }
                }
                treeMenus.add(tm);
            }
        }
        return treeMenus;
    }
}
