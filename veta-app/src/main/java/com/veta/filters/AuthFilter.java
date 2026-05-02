package com.veta.filters;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  req = (HttpServletRequest)  request;
        HttpServletResponse res = (HttpServletResponse) response;
        String path = req.getRequestURI().substring(req.getContextPath().length());

        HttpSession session = req.getSession(false);

        boolean isAdminPath  = path.startsWith("/admin");
        boolean isPortalPath = path.startsWith("/portal");

        if (isAdminPath) {
            if (session == null || session.getAttribute("adminUser") == null) {
                res.sendRedirect(req.getContextPath() + "/login?type=admin&next=" + path);
                return;
            }
        }

        if (isPortalPath) {
            if (path.startsWith("/portal/download") &&
                    (session == null || session.getAttribute("portalUser") == null)) {
                res.sendRedirect(req.getContextPath() + "/portal");
                return;
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}