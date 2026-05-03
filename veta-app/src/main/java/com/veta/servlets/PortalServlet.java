package com.veta.servlets;

import com.veta.dao.*;
import com.veta.models.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/portal")
public class PortalServlet extends HttpServlet {
    private final UserDAO        userDAO    = new UserDAO();
    private final StudentDAO     studentDAO = new StudentDAO();
    private final PaymentDAO     paymentDAO = new PaymentDAO();
    private final ApplicationDAO appDAO     = new ApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // ✅ Tengeneza user accounts kwa students wote bila accounts
        try {
            userDAO.createStudentUsers();
        } catch (Exception ignored) {}

        HttpSession session = req.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("portalUser") != null);

        if (!loggedIn) {
            req.getRequestDispatcher("/WEB-INF/views/portal_login.jsp").forward(req, res);
            return;
        }

        // Load dashboard data
        User u = (User) session.getAttribute("portalUser");
        try {
            Student student = studentDAO.findByUserId(u.getId());
            if (student != null) {
                req.setAttribute("student", student);
                List<Payment> payments = paymentDAO.findByStudentId(student.getId());
                req.setAttribute("payments", payments);
            } else {
                String ref = req.getParameter("ref");
                if (ref != null) {
                    req.setAttribute("application", appDAO.findByRef(ref));
                }
            }
        } catch (Exception e) {
            req.setAttribute("portalError", e.getMessage());
        }
        req.getRequestDispatcher("/WEB-INF/views/portal_dashboard.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("login".equals(action)) {
            String studentNum = req.getParameter("studentNumber");
            String password   = req.getParameter("password");

            try {
                // ✅ Tengeneza accounts kwanza kabla ya login
                try {
                    userDAO.createStudentUsers();
                } catch (Exception ignored) {}

                // Try admin-style login first, then student-style
                User user = userDAO.authenticate(studentNum, password);
                if (user == null) {
                    user = userDAO.authenticateStudent(studentNum, password);
                }
                if (user != null) {
                    HttpSession session = req.getSession(true);
                    session.setAttribute("portalUser", user);
                    res.sendRedirect(req.getContextPath() + "/portal");
                } else {
                    req.setAttribute("loginError", "Invalid credentials. Check your student number and password.");
                    req.getRequestDispatcher("/WEB-INF/views/portal_login.jsp").forward(req, res);
                }
            } catch (Exception e) {
                req.setAttribute("loginError", "Login error: " + e.getMessage());
                req.getRequestDispatcher("/WEB-INF/views/portal_login.jsp").forward(req, res);
            }
        } else if ("logout".equals(action)) {
            HttpSession session = req.getSession(false);
            if (session != null) session.invalidate();
            res.sendRedirect(req.getContextPath() + "/portal");
        }
    }
}