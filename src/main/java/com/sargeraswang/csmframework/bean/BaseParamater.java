package com.sargeraswang.csmframework.bean;

import com.sargeraswang.csmframework.common.Constants;
import org.springframework.util.Assert;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by SagerasWang on 14/12/5.
 */
public class BaseParamater extends HashMap<String, Object> {

    public BaseParamater(Map<String, ?> m) {
        super(m);
        Assert.notNull(this.get("index"), "index不能为空!");
        this.put(Constants.BASEPARAMATER_JUDGE, true);

        //特殊参数 key 特殊化
        this.put(Constants.BASEPARAMATER_INDEX, this.get("index"));
        this.remove("index");

        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession();
        Object uid = session.getAttribute(Constants.SESSION_KEY_UID);
        this.put(Constants.BASEPARAMATER_CURRENT_USER,uid);
    }

    public String getIndex() {
        Object o = this.get(Constants.BASEPARAMATER_INDEX);
        return o == null ? null : o.toString();
    }
}
