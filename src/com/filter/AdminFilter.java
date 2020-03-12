package com.filter;

import com.entity.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author:zhoufeng
 * @Date:2020/1/4
 */
public class AdminFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        Object u = session.getAttribute("user");
        if (u!=null&&((User)u).getAdmin()==1){
            chain.doFilter(req, resp);
        }else {
            String contextPath = request.getServletContext().getContextPath();
            response.sendRedirect(contextPath+"/index.jsp");
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
