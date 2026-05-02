package com.veta.servlets;

import com.veta.dao.*;
import com.veta.models.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/contact.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name    = req.getParameter("name");
        String email   = req.getParameter("email");
        String phone   = req.getParameter("phone");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");

        // TODO: Send email via JavaMail or save to DB
        // For now just set success flag
        if (name != null && !name.isEmpty() && message != null && !message.isEmpty()) {
            req.setAttribute("contactSuccess", true);
        } else {
            req.setAttribute("contactError", "Please fill all required fields.");
        }
        req.getRequestDispatcher("/WEB-INF/views/contact.jsp").forward(req, res);
    }
}
