package com.sargeraswang.csmframework.common.util;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by SagerasWang on 14/11/25.
 */
public class StringUtil extends StringUtils {

    public static final Logger LG = Logger.getLogger(StringUtil.class);

    /**
     * 防止SQL注入,去掉特殊字符
     *
     * @param str
     * @return
     */
    public static String transactSQLInjection(String str) {
        return str.replaceAll(".*([';]+|(--)+).*", "");
    }

    /**
     * 智能去空格,重复空格/换行 都替换为一个空格
     *
     * @param str
     * @return
     */
    public static String smartTrim(String str) {
        return str.trim().replaceAll("\n", StringUtils.SPACE).replaceAll(" +", StringUtils.SPACE);
    }

    public static String getMD5(String str) {
       return getMD5(str.getBytes());
    }

    public static String getMD5(byte[] bytes) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(bytes);
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static String getFileSuffix(String fileName){
        return fileName.substring(fileName.lastIndexOf(".")+1);
    }
}
