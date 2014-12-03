package com.sargeraswang.webmanager.common.util;

import com.google.gson.Gson;

/**
 * Created by SagerasWang on 14/11/24.
 */
public class JsonUtil {
    private static Gson gson=new Gson();

    public static String toJson(Object obj){
        return gson.toJson(obj);
    }
}
