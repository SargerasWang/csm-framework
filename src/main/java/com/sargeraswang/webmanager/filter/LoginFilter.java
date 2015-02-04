/**
 * @author SargerasWang
 */
package com.sargeraswang.webmanager.filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.sargeraswang.webmanager.common.Constants;

/**
 * The <code>LoginFilter</code>
 *
 * @author SargerasWang
 *         Created at 2014年7月2日 上午9:46:28
 */
public class LoginFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        String[] notFilter = new String[]{"login/login.do", "login.jsp", "login/captcha.do"};

        String uri = request.getRequestURI();
        boolean doFilter = true;
        if (!uri.contains("?")) {//有问号担心类似 xxxQuery?id=1&name=login/login.do 攻击
            for (String s : notFilter) {
                if (uri.contains(s)) {
                    doFilter = false;
                    break;
                }
            }
        }
        if (doFilter) {
            Object uid = request.getSession().getAttribute(Constants.SESSION_KEY_UID);
            if (uid == null) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.sendRedirect(request.getContextPath() + "/login.jsp");
//                PrintWriter out = response.getWriter();
//                String loginPage = request.getContextPath() + "/login.jsp";
//                StringBuilder builder = new StringBuilder();
//                builder.append("<script type=\"text/javascript\">");
//                builder.append("window.top.location.href='");
//                builder.append(loginPage);
//                builder.append("';");
//                builder.append("</script>");
//                out.print(builder.toString());
            } else {
                filterChain.doFilter(request, response);
            }
        } else {
            filterChain.doFilter(request, response);
        }
    }

}
