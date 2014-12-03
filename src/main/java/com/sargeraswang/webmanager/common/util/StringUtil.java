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
    public static String TransactSQLInjection(String str) {
        return str.replaceAll(".*([';]+|(--)+).*", "");
    }
}
