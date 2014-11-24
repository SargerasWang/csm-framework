package com.sargeraswang.webmanager.common.util;

import org.springframework.util.Assert;
import org.springframework.web.servlet.ModelAndView;


/**
 * OA公共工具类
 * @author xuqiaohui
 *
 */
public final class OaUtil {
	
	/**
	 * 强化不可实例化
	 */
	private OaUtil() {}
	
	/**
	 * 跳转到异常页面
	 * @param exceptionMsg 异常信息
	 * @return 异常页面视图
	 */
	public static ModelAndView toExceptionPage(String exceptionMsg) {
		Assert.hasText(exceptionMsg, "exceptionMsg 异常信息不能为空！");
		ModelAndView mav = new ModelAndView("/system/exceptionPage.jsp");
		mav.addObject("exceptionMsg", exceptionMsg);
		return mav;
	}
	
}
