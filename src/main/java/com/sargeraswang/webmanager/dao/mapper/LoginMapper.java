package com.sargeraswang.webmanager.dao.mapper;

import java.util.List;
import java.util.Map;

public interface LoginMapper {

    List<Map<String,Object>> selectUserByLogin(Map<String,Object> params);

}