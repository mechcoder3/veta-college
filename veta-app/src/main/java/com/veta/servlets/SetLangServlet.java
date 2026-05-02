package com.veta.servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/setlang")
public class SetLangServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // GET inaitwa doPost pia
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String lang = req.getParameter("lang");
        String redirect = req.getParameter("redirect");
        if ("sw".equals(lang) || "en".equals(lang)) {
            req.getSession(true).setAttribute("lang", lang);
        }
        if (redirect != null && !redirect.isEmpty() && redirect.startsWith("/")) {
            res.sendRedirect(req.getContextPath() + redirect);
        } else {
            res.sendRedirect(req.getContextPath() + "/home");
        }
    }
}