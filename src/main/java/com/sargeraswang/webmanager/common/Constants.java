/**
 *
 */
package com.sargeraswang.webmanager.common;


import com.sargeraswang.webmanager.common.util.SpringBeanFactoryUtils;

import java.util.Properties;

public class Constants {

    /**
     * Session存userid
     */
    public static final String SESSION_KEY_UID = "SESSION_KEY_UID";
    /**
     * Session存user 信息
     */
    public static final String SESSION_KEY_UINFO = "SESSION_KEY_UINFO";

    /**
     * Session存验证码
     */
    public static final String SESSION_KEY_CAPTCHA = "SESSION_KEY_CAPTCHA";
    /**
     * 菜单权限
     */
    public static final String SESSION_KEY_MENULIST = "SESSION_KEY_MENULIST";


    /**
     * 是否为BaseParamater的标示
     */
    public static final String BASEPARAMATER_JUDGE = "BASEPARAMATER_JUDGE";
    /**
     * BaseParamater的index
     */
    public static final String BASEPARAMATER_INDEX = "_index_";
    /**
     * BaseParamater的order
     */
    public static final String BASEPARAMATER_ORDER = "_order_";
    /**
     * BaseParamater的iDisplayLength
     */
    public static final String BASEPARAMATER_LENGTH = "_length_";
    /**
     * BaseParamater的iDisplayStart
     */
    public static final String BASEPARAMATER_START = "_start_";
    /**
     * BaseParamater的_current_user_
     */
    public static final String BASEPARAMATER_CURRENT_USER = "_current_user_";


    public static final Integer ATTACHMENT_FILE_TYPE_DEFAULT = 0;

    /**
     * 系统角色中系统管理员的类型
     */
    public static final Integer SYSTEM_ROLE_ADMIN_TYPE = -1;

    public static String getSystemConfig(SystemConfigKey key) {
        Properties sysProperties = (Properties)SpringBeanFactoryUtils.getBean("sysProperties");
        String s = key.toString();
        if (sysProperties.containsKey(s)) {
            return sysProperties.get(s).toString();
        } else {
            return null;
        }
    }

    public enum SystemConfigKey {
        /**
         * 上传文件存放路径
         */
        FILE_UPLOAD_PATH
    }

}
