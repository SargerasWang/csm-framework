package com.sargeraswang.webmanager.service;

import com.sargeraswang.webmanager.dao.mapper.LoginMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {

    @Resource
    LoginMapper loginMapper;

    private static final transient Logger LOG = LoggerFactory.getLogger(UserService.class);

    public List<Map<String,Object>> selectUserByLogin(String loginname , String password){
        Map<String,Object> param= new HashMap<>();
        param.put("loginname",loginname);
        param.put("password",password);
        return loginMapper.selectUserByLogin(param);
    }
}
