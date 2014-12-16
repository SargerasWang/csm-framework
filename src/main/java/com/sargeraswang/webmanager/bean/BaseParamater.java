package com.sargeraswang.webmanager.bean;

import com.sargeraswang.webmanager.common.Constants;
import org.springframework.util.Assert;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by SagerasWang on 14/12/5.
 */
public class BaseParamater extends HashMap<String, Object> {

    public BaseParamater(Map<? extends String, ?> m) {
        super(m);
        Assert.notNull(this.get("index"), "index不能为空!");
        this.put(Constants.BASEPARAMATER_JUDGE, true);

        //特殊参数 key 特殊化
        this.put(Constants.BASEPARAMATER_INDEX, this.get("index"));
        this.remove("index");
    }

    public String getIndex() {
        Object o = this.get(Constants.BASEPARAMATER_INDEX);
        return o == null ? null : o.toString();
    }
}
