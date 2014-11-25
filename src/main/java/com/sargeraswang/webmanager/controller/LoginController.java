/**
 * 
 */
package com.sargeraswang.webmanager.controller;

import com.sargeraswang.webmanager.common.Constants;
import com.sargeraswang.webmanager.service.UserService;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Resource
	UserService loginService;
	
	private static final transient Logger LOG = LoggerFactory.getLogger(LoginController.class);
	
	@ResponseBody
	@RequestMapping(value="/login")
	public String login(@RequestParam Map<String, String> allRequestParams,
            HttpServletRequest request) throws Exception {
	    String loginname = allRequestParams.get("loginname");
	    String password = allRequestParams.get("password");
		List<Map<String, Object>> list = loginService.selectUserByLogin(loginname, password);

		String ip = request.getRemoteAddr();
		if (CollectionUtils.isEmpty(list)){
	        LOG.info(MessageFormat.format("用户登入失败，loginname={0},password={1},ip={2}", loginname, password,ip));
			return "2";
		}else{
	        LOG.warn("用户登陆成功，user="+list.get(0)+",ip="+ip);
			request.getSession().setAttribute(Constants.SESSION_KEY_UID, list.get(0).get("id"));
			request.getSession().setAttribute(Constants.SESSION_KEY_UINFO,list.get(0));
			return "1";
		}
	}
	
	@RequestMapping(value="/index")
	public ModelAndView index(@RequestParam Map<String, String> allRequestParams,
            HttpServletRequest request,HttpServletResponse response) {
	    ModelAndView mav=new ModelAndView("/index.jsp");

	    return mav;
	}
	
    @RequestMapping(value="/logout")
    public String logout(@RequestParam Map<String, String> allRequestParams,
            HttpServletRequest request,HttpServletResponse response) {
        LOG.info("用户注销：uid="+request.getSession().getAttribute(Constants.SESSION_KEY_UID));
        request.getSession().removeAttribute(Constants.SESSION_KEY_UID);
        request.getSession().removeAttribute(Constants.SESSION_KEY_UINFO);
        return "redirect:/login.jsp";
    }

}
