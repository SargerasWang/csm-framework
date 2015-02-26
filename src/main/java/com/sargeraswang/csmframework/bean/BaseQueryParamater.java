package com.sargeraswang.csmframework.bean;

import com.sargeraswang.csmframework.common.Constants;
import com.sargeraswang.csmframework.common.util.StringUtil;

import java.util.Map;

/**
 * Created by SagerasWang on 14/11/24.
 */
public class BaseQueryParamater extends BaseParamater {

    private static final String ORDER_COLUMN="order[column]";
    private static final String ORDER_DIR="order[dir]";
    private static final String DIR_DESC="desc";
    private static final String DIR_ASC="asc";

    public BaseQueryParamater(Map<String, String> map) {
        super(map);
        //排序
        if (this.containsKey(ORDER_COLUMN)) {
            String sortName = this.get(ORDER_COLUMN).toString();
            String sortDir = this.get(ORDER_DIR).toString();
            sortName = StringUtil.transactSQLInjection(sortName);
            if (sortDir.equalsIgnoreCase(DIR_DESC)) {
                sortDir = DIR_DESC;
            } else {
                sortDir = DIR_ASC;
            }
            this.put(Constants.BASEPARAMATER_ORDER, sortName + " " + sortDir);
        }
        //特殊参数 key 特殊化
        this.put(Constants.BASEPARAMATER_START, this.get("start"));
        this.remove("start");
        this.put(Constants.BASEPARAMATER_LENGTH, this.get("length"));
        this.remove("length");
        //去除无需带入SQL的参数
        this.remove("draw");
        this.remove(ORDER_COLUMN);
        this.remove(ORDER_DIR);
    }

}
