/**
 * @author SargerasWang
 */
package com.sargeraswang.webmanager.common.util;

/**
 * 短信工具类
 * 
 * @author SargerasWang Created at 2014年7月1日 上午10:58:13
 */
public class SmsUtil {
    
    /**
     * 获取一个随机数字符串
     * @author SargerasWang Created at 2014年7月1日 上午11:02:49
     * @param median 几位数的
     * @return 随机数字字符串
     */
    public static String getRandomNumber(int median) {
        double r=(Math.random() * 9 + 1) * Math.pow(10, median - 1);
        return String.valueOf((int)r);
    }

}
