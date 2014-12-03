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
     * Session存userid
     */
    public static final String SESSION_KEY_UID="SESSION_KEY_UID";
    /**
     * Session存user 信息
     */
    public static final String SESSION_KEY_UINFO="SESSION_KEY_UINFO";
    /**
     * 菜单权限
     */
    public static final String SESSION_KEY_MENULIST="SESSION_KEY_MENULIST";


    /**
     * 是否为BaseParamater的标示
     */
    public static final String BASEPARAMATER_JUDGE="BASEPARAMATER_JUDGE";
    /**
     * BaseParamater的index
     */
    public static final String BASEPARAMATER_INDEX="_index_";
    /**
     * BaseParamater的order
     */
    public static final String BASEPARAMATER_ORDER="_order_";
    /**
     * BaseParamater的iDisplayLength
     */
    public static final String BASEPARAMATER_LENGTH="_length_";
    /**
     * BaseParamater的iDisplayStart
     */
    public static final String BASEPARAMATER_START="_start_";
}
