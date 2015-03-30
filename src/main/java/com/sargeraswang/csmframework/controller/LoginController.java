/**
 *
 */
package com.sargeraswang.csmframework.controller;

import com.sargeraswang.csmframework.bean.sys.SystemMenu;
import com.sargeraswang.csmframework.bean.sys.SystemUser;
import com.sargeraswang.csmframework.bean.sys.TreeMenu;
import com.sargeraswang.csmframework.common.Constants;
import com.sargeraswang.csmframework.common.ControllerPermissionType;
import com.sargeraswang.csmframework.common.SessionContext;
import com.sargeraswang.csmframework.common.annotation.ControllerPermission;
import com.sargeraswang.csmframework.common.util.JsonUtil;
import com.sargeraswang.csmframework.common.util.SpringBeanFactoryUtils;
import com.sargeraswang.csmframework.service.UserService;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.text.MessageFormat;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Resource
    UserService loginService;

    private static final transient Logger LOG = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping(value = "/login")
    @ControllerPermission(ControllerPermissionType.PUBLIC)
    public ModelAndView login(@RequestParam Map<String, String> allRequestParams,
                              HttpServletRequest request) {
        String loginname = allRequestParams.get("loginname");
        String password = allRequestParams.get("password");
        String captcha = allRequestParams.get("captcha");
        Assert.notNull(loginname);
        Assert.notNull(password);
        Assert.notNull(captcha);

        ModelAndView loginView = new ModelAndView("/login");

        HttpSession session = request.getSession();
        String ip = request.getRemoteAddr();
        try {
            Object objcaptcha = session.getAttribute(Constants.SESSION_KEY_CAPTCHA);
            if (objcaptcha == null) {
                LOG.info(MessageFormat.format("用户验证码不存在于Session，loginname={0},ip={1}", loginname, ip));
                loginView.addObject("msg", "3");
                return loginView;
            }
            if (!objcaptcha.toString().equalsIgnoreCase(captcha)) {
                LOG.info(MessageFormat.format("用户验证码不正确，loginname={0},ip={1},system={2},customer={3}", loginname, ip, objcaptcha, captcha));
                session.removeAttribute(Constants.SESSION_KEY_CAPTCHA);
                loginView.addObject("msg", "4");
                return loginView;
            }
            session.removeAttribute(Constants.SESSION_KEY_CAPTCHA);

            List<SystemUser> list = loginService.selectUserByLogin(loginname, password);

            if (CollectionUtils.isEmpty(list)) {
                LOG.info(MessageFormat.format("用户登入失败，loginname={0},password={1},ip={2}", loginname, password, ip));
                loginView.addObject("msg", "2");
                return loginView;
            } else {
                LOG.warn("用户登陆成功，user=" + list.get(0) + ",ip=" + ip);
                session.setAttribute(Constants.SESSION_KEY_UID, list.get(0).getId());
                session.setAttribute(Constants.SESSION_KEY_UINFO, list.get(0));

                SessionContext sessionContext = SpringBeanFactoryUtils.getBean(SessionContext.class);
                sessionContext.addSession(session, ip);

                return new ModelAndView("redirect:/");
            }
        } catch (Exception e) {
            LOG.error(e.toString(), e);
            loginView.addObject("msg", "2");
            return loginView;
        }
    }

    @RequestMapping(value = "/logout")
    @ControllerPermission(ControllerPermissionType.PUBLIC)
    public String logout(HttpServletRequest request) {
        LOG.info("用户注销：uid=" + request.getSession().getAttribute(Constants.SESSION_KEY_UID));
        request.getSession().invalidate();
        SessionContext sessionContext = SpringBeanFactoryUtils.getBean(SessionContext.class);
        sessionContext.removeSession(request.getSession());
        return "redirect:/login.jsp";
    }

    @ResponseBody
    @RequestMapping(value = "/getMenu")
    @ControllerPermission(ControllerPermissionType.AFTER_LOGIN)
    public String getMenu(HttpServletRequest request) {
        List<TreeMenu> treeMenus = null;
        List<SystemMenu> sysMenus;
        HttpSession session = request.getSession();
        SystemUser user = (SystemUser) session.getAttribute(Constants.SESSION_KEY_UINFO);
        if (user != null && user.getRole() != null) {
            if (Constants.SYSTEM_ROLE_ADMIN_TYPE.equals(user.getRole().getType())) {
                sysMenus = loginService.getAllSystemMenus();
            } else {
                sysMenus = loginService.getSystemMenusByRoleId(user.getRole().getId());
                //获取数据权限
                List<String> indexList = loginService.selectSqlIndexByRoleId(user.getRole().getId());
                session.setAttribute(Constants.SESSION_KEY_SQLINDEXLIST, indexList);
                session.setAttribute(Constants.SESSION_KEY_MENULIST, sysMenus);
                //存所有菜单是用于判断页面权限 ViewController.toPage()
                session.setAttribute(Constants.SESSION_KEY_MENULIST_ALL, loginService.getAllSystemMenus());
            }
            treeMenus = loginService.generateTreeMenus(sysMenus);
        } else {
            LOG.error("getMenu->sessionUser =null || sessionUser.role ==null", NullPointerException.class);
        }
        return JsonUtil.toJson(treeMenus);
    }

    @ResponseBody
    @RequestMapping(value = "/captcha")
    @ControllerPermission(ControllerPermissionType.PUBLIC)
    public BufferedImage generateCaptcha(HttpServletRequest request) {
        int width = 100;
        int height = 40;
        int charsToPrint = 4;

//        String elegibleChars = "ABCDEFGHJKLMPQRSTUVWXYabcdefhjkmnpqrstuvwxy1234567890";
        String elegibleChars = "1234567890";

        char[] chars = elegibleChars.toCharArray();
        StringBuffer finalString = new StringBuffer();

        for (int i = 0; i < charsToPrint; i++) {
            double randomValue = Math.random();
            int randomIndex = (int) Math.round(randomValue * (chars.length - 1));
            char characterToShow = chars[randomIndex];
            finalString.append(characterToShow);
        }

        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = bufferedImage.createGraphics();
        Font font = new Font("Georgia", Font.BOLD, 24);
        g2d.setFont(font);
        RenderingHints rh = new RenderingHints(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        rh.put(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g2d.setRenderingHints(rh);
        g2d.fillRect(0, 0, width, height);
        g2d.setColor(new Color(158, 72, 70));

        Random r = new Random();
        char[] data = new String(finalString).toCharArray();
        int x = 0;
        int y;
        double ro;
        AffineTransform orig = new AffineTransform();
        for (int i = 0; i < data.length; i++) {
            //位置
//            x += (Math.abs(r.nextInt()) % 15);
            x += 15;
//            y = 10 + Math.abs(r.nextInt(10));
            y = 25;
            //旋转
//            ro = Math.PI/3 -(r.nextDouble() );
//            orig.rotate(ro);
            Font rotatedFont = font.deriveFont(orig);
            g2d.setFont(rotatedFont);

            g2d.drawChars(data, i, 1, x, y);
        }

        g2d.dispose();
        request.getSession().setAttribute(Constants.SESSION_KEY_CAPTCHA, finalString);
        return bufferedImage;
    }

}
