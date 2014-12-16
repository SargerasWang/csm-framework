package com.sargeraswang.webmanager.service;

import com.sargeraswang.webmanager.bean.BaseExecuteAjaxBean;
import com.sargeraswang.webmanager.bean.BaseExecuteParamater;
import com.sargeraswang.webmanager.bean.BaseQueryParamater;
import com.sargeraswang.webmanager.common.util.JsonUtil;
import com.sargeraswang.webmanager.common.util.StatusUtil;
import com.sargeraswang.webmanager.dao.BaseDao;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by SagerasWang on 14/11/24.
 */
@Service
public class BaseService {

    @Resource
    BaseDao baseDao;
    public static final Logger LG = Logger.getLogger(BaseService.class);

    public List<Object> queryForList(String index,Map<String,Object> paramater) {

        return baseDao.queryForList(index,paramater);
    }

    public List<Object> queryForList(BaseQueryParamater paramater) {

        return baseDao.queryForList(paramater);
    }

    public Integer queryCount(BaseQueryParamater paramater) {

        return baseDao.queryCount(paramater);
    }

    public String[][] assembleTableData(String statusColumn, List datalist, String columns){
        //处理需要翻译字段
        List statList = JsonUtil.fromJson(statusColumn, List.class);
        //用来翻译的字典集合
        Map<String, Map<String, String>> dictMap = new HashMap<>();
        for (Object o : statList) {
            Map<String, String> map = (Map<String, String>) o;
            String c = map.get("column");
            String a = map.get("statusArr");
            Map<String, String> s = StatusUtil.getStatus(a);
            if (s == null) {
                LG.warn("导出数据时,在status.XML中找不到名为[" + a + "]的翻译字段");
                continue;
            }
            dictMap.put(c, s);//c字段用s翻译
        }
        if (dictMap.size() > 0) {
            for (Object od : datalist) {
                Map<String, Object> map = (Map<String, Object>) od;
                for (String key : dictMap.keySet()) {
                    String value = String.valueOf(map.get(key));
                    String realValue = dictMap.get(key).get(value);
                    map.put(key, realValue);
                }
            }
        }
        //翻译结束

        //将标题+数据处理成二维数组
        List colList = JsonUtil.fromJson(columns, List.class);
        String[][] dataArray = new String[datalist.size() + 1][colList.size()];
        String[] titleRow = dataArray[0];
        for (int i = 0; i < colList.size(); i++) {
            Object ot = colList.get(i);
            Map<String, Object> map = (Map<String, Object>) ot;
            titleRow[i] = String.valueOf(map.get("title"));
        }
        for (int i = 0; i < datalist.size(); i++) {
            Object od = datalist.get(i);
            Map<String, Object> map = (Map<String, Object>) od;
            String[] dataRow = dataArray[i + 1];
            for (int j = 0; j < colList.size(); j++) {
                Object key = ((Map<String, Object>) colList.get(j)).get("data");
                dataRow[j] = String.valueOf(map.get(key));
            }
        }
        return dataArray;
    }

    public Integer execute(BaseExecuteParamater paramater){
        return baseDao.execute(paramater);
    }
}
