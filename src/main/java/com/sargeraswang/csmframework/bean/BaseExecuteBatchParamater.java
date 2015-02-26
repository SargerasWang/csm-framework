package com.sargeraswang.csmframework.bean;

import org.apache.log4j.Logger;

import java.util.Map;

public class BaseExecuteBatchParamater extends BaseExecuteParamater {
    private static final Logger LG = Logger.getLogger(BaseExecuteBatchParamater.class);

    public BaseExecuteBatchParamater(Map<String, String> m) {
        super(m);
        String repeat = m.get("repeat");
        if(repeat != null){
            String[] repeatKey = repeat.split(",");
            for(String key : repeatKey){
                String v = m.get(key);
                if(v==null){
                    LG.warn("repeatKey["+key+"]value is null!");
                    continue;
                }
                this.put(key,v.toString().split(","));
            }
        }
    }
}
