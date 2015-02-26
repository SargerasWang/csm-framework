package com.sargeraswang.csmframework.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by SagerasWang on 15/2/5.
 */
public class DateUtil {
    public static String getFormatNow(String pattern){
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        return sdf.format(new Date());
    }
}
