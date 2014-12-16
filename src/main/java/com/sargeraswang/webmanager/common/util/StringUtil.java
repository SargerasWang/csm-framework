package com.sargeraswang.webmanager.common.util;

import org.apache.commons.lang3.StringUtils;

/**
 * Created by SagerasWang on 14/11/25.
 */
public class StringUtil extends StringUtils {

    /**
     * 防止SQL注入,去掉特殊字符
     * @param str
     * @return
     */
    public static String transactSQLInjection(String str) {
        return str.replaceAll(".*([';]+|(--)+).*", "");
    }

    /**
     * 智能去空格,重复空格/换行 都替换为一个空格
     * @param str
     * @return
     */
    public static String smartTrim(String str){
        return str.trim().replaceAll("\n", StringUtils.SPACE).replaceAll(" +", StringUtils.SPACE);
    }
}
