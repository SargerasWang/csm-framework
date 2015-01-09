package com.sargeraswang.webmanager.service;

import com.sargeraswang.webmanager.bean.sys.SystemMenu;
import com.sargeraswang.webmanager.bean.sys.SystemUser;
import com.sargeraswang.webmanager.bean.sys.TreeMenu;
import com.sargeraswang.webmanager.dao.mapper.LoginMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
