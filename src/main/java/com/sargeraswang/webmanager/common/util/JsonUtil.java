package com.sargeraswang.webmanager.common.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Created by SagerasWang on 14/11/24.
 */
public class JsonUtil {
    private static Gson gson=new GsonBuilder().serializeNulls().create();

    public static String toJson(Object obj){
        return gson.toJson(obj);
    }

    public static <T>T fromJson(String json,Class<T> c){ return gson.fromJson(json,c);}
}
