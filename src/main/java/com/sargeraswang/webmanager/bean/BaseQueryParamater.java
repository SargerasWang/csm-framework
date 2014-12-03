package com.sargeraswang.webmanager.bean;

import com.sargeraswang.webmanager.common.Constants;
import com.sargeraswang.webmanager.common.util.StringUtil;
import org.springframework.util.Assert;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by SagerasWang on 14/11/24.
 */
public class BaseQueryParamater extends HashMap<String, Object> {

    private static final String ORDER_COLUMN="order[column]";
    private static final String ORDER_DIR="order[dir]";
    private static final String DIR_DESC="desc";
    private static final String DIR_ASC="asc";

    public BaseQueryParamater(Map<String, String> map) {
        super(map);
        Assert.notNull(this.get("index"), "index不能为空!");
        this.put(Constants.BASEPARAMATER_JUDGE, true);
        //排序
        if (this.containsKey(ORDER_COLUMN)) {
            String sortName = this.get(ORDER_COLUMN).toString();
            String sortDir = this.get(ORDER_DIR).toString();
            sortName = StringUtil.TransactSQLInjection(sortName);
            if (sortDir.equalsIgnoreCase(DIR_DESC)) {
                sortDir = DIR_DESC;
            } else {
                sortDir = DIR_ASC;
            }
            this.put(Constants.BASEPARAMATER_ORDER, sortName + " " + sortDir);
        }
        //特殊参数 key 特殊化
        this.put(Constants.BASEPARAMATER_INDEX, this.get("index"));
        this.remove("index");
        this.put(Constants.BASEPARAMATER_START, this.get("start"));
        this.remove("start");
        this.put(Constants.BASEPARAMATER_LENGTH, this.get("length"));
        this.remove("length");
        //去除无需带入SQL的参数
        this.remove("draw");
        this.remove(ORDER_COLUMN);
        this.remove(ORDER_DIR);
    }

    public String getIndex() {
        Object o = this.get(Constants.BASEPARAMATER_INDEX);
        return o == null ? null : o.toString();
    }
}
