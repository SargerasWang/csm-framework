package com.sargeraswang.webmanager.service;

import com.sargeraswang.webmanager.bean.BaseExecuteAjaxBean;
import com.sargeraswang.webmanager.bean.BaseExecuteParamater;
import com.sargeraswang.webmanager.bean.BaseQueryParamater;
import com.sargeraswang.webmanager.dao.BaseDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by SagerasWang on 14/11/24.
 */
@Service
public class BaseService {

    @Resource
    BaseDao baseDao;

    public List<Object> queryForList(BaseQueryParamater paramater) {

        return baseDao.queryForList(paramater);
    }

    public Integer queryCount(BaseQueryParamater paramater) {

        return baseDao.queryCount(paramater);
    }

    public Integer execute(BaseExecuteParamater paramater){
        return baseDao.execute(paramater);
    }
}
