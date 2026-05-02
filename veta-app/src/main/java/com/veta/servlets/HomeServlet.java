package com.veta.servlets;

import com.veta.dao.*;
import com.veta.models.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private final StaffDAO staffDAO = new StaffDAO();
    private final CourseDAO courseDAO = new CourseDAO();
    private final NewsDAO newsDAO = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            req.setAttribute("principal",   staffDAO.findPrincipal());
            req.setAttribute("staffList",   staffDAO.findNonPrincipal());
            req.setAttribute("longCourses", courseDAO.findByType("LONG"));
            req.setAttribute("newsList",    newsDAO.findPublished(3));
        } catch (Exception e) {
            req.setAttribute("dbError", e.getMessage());
        }
        req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, res);
    }
}
