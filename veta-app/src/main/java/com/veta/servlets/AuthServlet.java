package com.veta.servlets;

import com.veta.dao.UserDAO;
import com.veta.models.User;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet({"/auth", "/login"})
public class AuthServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String path = req.getServletPath();
        if ("/logout".equals(path)) {
            HttpSession s = req.getSession(false);
            if (s != null) s.invalidate();
            res.sendRedirect(req.getContextPath() + "/home");
        } else {
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String loginType = req.getParameter("loginType"); // admin | student

        try {
            User user = userDAO.authenticate(username, password);
            if (user != null) {
                HttpSession session = req.getSession(true);
                session.setAttribute("loggedUser", user);
                session.setAttribute("userId", user.getId());
                session.setAttribute("userRole", user.getRole());
                session.setAttribute("userFullName", user.getFullName());

                if ("ADMIN".equals(user.getRole()) || "STAFF".equals(user.getRole())
                        || "REGISTRAR".equals(user.getRole()) || "FINANCE".equals(user.getRole())) {
                    session.setAttribute("adminUser", user);
                    session.setAttribute("adminUserId", user.getId());
                    res.sendRedirect(req.getContextPath() + "/admin");
                } else {
                    session.setAttribute("portalUser", user);
                    res.sendRedirect(req.getContextPath() + "/portal");
                }
            } else {
                req.setAttribute("error", "Invalid username or password.");
                req.setAttribute("loginType", loginType);
                req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, res);
            }
        } catch (Exception e) {
            req.setAttribute("error", "Login error: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, res);
        }
    }
}
