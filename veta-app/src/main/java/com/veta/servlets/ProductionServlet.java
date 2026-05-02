package com.veta.servlets;

import com.veta.dao.*;
import com.veta.models.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet( "/production")
public class ProductionServlet extends HttpServlet {
    private final ProductionDAO prodDAO = new ProductionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/production.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        ProductionOrder order = new ProductionOrder();
        order.setClientName(req.getParameter("clientName"));
        order.setClientPhone(req.getParameter("clientPhone"));
        order.setClientEmail(req.getParameter("clientEmail"));
        order.setCustomProduct(req.getParameter("productName"));
        order.setSpecifications(req.getParameter("specifications"));
        try { order.setQuantity(Integer.parseInt(req.getParameter("quantity"))); }
        catch (Exception e) { order.setQuantity(1); }
        try {
            String budget = req.getParameter("estimatedBudget");
            if (budget != null && !budget.isEmpty())
                order.setEstimatedBudget(new java.math.BigDecimal(budget));
        } catch (Exception ignored) {}

        if (order.getClientName() == null || order.getClientPhone() == null) {
            req.setAttribute("orderError", "Please fill name and phone.");
            req.getRequestDispatcher("/WEB-INF/views/production.jsp").forward(req, res);
            return;
        }
        try {
            String no = prodDAO.insertOrder(order);
            req.setAttribute("orderNumber", no);
            req.setAttribute("orderSuccess", true);
        } catch (Exception e) {
            req.setAttribute("orderError", "Order failed: " + e.getMessage());
        }
        req.getRequestDispatcher("/WEB-INF/views/production.jsp").forward(req, res);
    }
}
