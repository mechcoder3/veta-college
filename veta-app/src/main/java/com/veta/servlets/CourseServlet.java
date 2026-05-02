package com.veta.servlets;

import com.veta.dao.*;
import com.veta.models.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/courses")
public class CourseServlet extends HttpServlet {
    private final CourseDAO courseDAO = new CourseDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String type = req.getParameter("type"); // short | long
        try {
            if ("short".equalsIgnoreCase(type)) {
                req.setAttribute("courses", courseDAO.findByType("SHORT"));
                req.setAttribute("pageType", "short");
                req.getRequestDispatcher("/WEB-INF/views/short_courses.jsp").forward(req, res);
            } else {
                req.setAttribute("courses", courseDAO.findByType("LONG"));
                req.setAttribute("pageType", "long");
                req.getRequestDispatcher("/WEB-INF/views/long_courses.jsp").forward(req, res);
            }
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/long_courses.jsp").forward(req, res);
        }
    }
}
