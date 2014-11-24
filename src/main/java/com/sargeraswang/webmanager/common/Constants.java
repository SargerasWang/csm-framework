/**
 * 
 */
package com.sargeraswang.webmanager.common;



public class Constants {
    
    /**
     * 执行成功
     */
    public static final int SUCCESS = 1;
    /**
     * 系统错误
     */
    public static final int SYS_ERROR = 0;
    /**
     * 业务错误
     */
    public static final int BUSS_ERROR = 2;
	
	public final static String PARAM_LOGIN_UID = "COOKIE_USER_ID";//当前登录用户ID参数名称
	
	//分页常量
	public static final String PARAM_PAGE_NO = "page_no";
	public static final String PARAM_PAGE_SIZE = "page_size";
	public static final int PAGE_NO = 1;
	public static final int PAGE_SIZE = 10;
	
    /**
     * Session存验证码
     */
    public static final String SESSION_KEY_RANDOM="SESSION_RANDOM";
    /**
     * Session存userid
     */
    public static final String SESSION_KEY_UID="SESSION_KEY_UID";
    /**
     * Session存user 信息
     */
    public static final String SESSION_KEY_UINFO="SESSION_KEY_UINFO";
    /**
     * 是否登陆
     */
    public static final String SESSION_KEY_ISLOGIN="SESSION_KEY_ISLOGIN";
    /**
     * 菜单权限
     */
    public static final String SESSION_KEY_MENULIST="SESSION_KEY_MENULIST";
    /**
     * 默认审核通过文字
     */
    public static final String AUDIT_PASS_DEFAULT_TEXT="默认审核通过";
    /**
     * 审核备注前缀
     */
    public static final String AUDIT_PREV_TEXT="[wap端]";
}
