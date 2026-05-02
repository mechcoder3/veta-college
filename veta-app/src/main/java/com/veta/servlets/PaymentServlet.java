package com.veta.servlets;

import com.veta.dao.PaymentDAO;
import com.veta.models.Payment;
import com.veta.utils.RefGenerator;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@WebServlet({"/payment", "/payments"})
public class PaymentServlet extends HttpServlet {

    private final PaymentDAO paymentDAO = new PaymentDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("check".equals(action)) {
            // Check status of a control number
            String ctrl = req.getParameter("ctrl");
            if (ctrl != null && !ctrl.trim().isEmpty()) {
                try {
                    Payment p = paymentDAO.findByControlNumber(ctrl.trim());
                    req.setAttribute("payment", p);
                } catch (Exception e) {
                    req.setAttribute("error", e.getMessage());
                }
            }
        }

        req.getRequestDispatcher("/WEB-INF/views/payments.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("generate".equals(action)) {
            generateControlNumber(req, res);
        } else if ("verify".equals(action)) {
            verifyPayment(req, res);
        } else {
            res.sendRedirect(req.getContextPath() + "/payments");
        }
    }

    private void generateControlNumber(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        Payment p = new Payment();
        p.setPayerName(req.getParameter("payerName"));
        p.setPayerPhone(req.getParameter("payerPhone"));
        p.setReferenceId(req.getParameter("referenceId"));
        p.setPaymentType(req.getParameter("paymentType"));
        p.setAcademicYear(req.getParameter("academicYear"));
        p.setDescription(req.getParameter("description"));

        String amountStr = req.getParameter("amount");
        try {
            p.setAmount(new BigDecimal(amountStr));
        } catch (Exception e) {
            req.setAttribute("error", "Invalid amount.");
            req.getRequestDispatcher("/WEB-INF/views/payments.jsp").forward(req, res);
            return;
        }

        // Parse student/application IDs if provided
        try {
            String sid = req.getParameter("studentId");
            if (sid != null && !sid.isEmpty()) p.setStudentId(Integer.parseInt(sid));
            String aid = req.getParameter("applicationId");
            if (aid != null && !aid.isEmpty()) p.setApplicationId(Integer.parseInt(aid));
        } catch (NumberFormatException ignored) {}

        try {
            String ctrl = paymentDAO.createControlNumber(p);
            Payment saved = paymentDAO.findByControlNumber(ctrl);
            req.setAttribute("generatedPayment", saved);
            req.setAttribute("controlNumber", ctrl);
            // Expiry: 7 days from now
            LocalDateTime exp = LocalDateTime.now().plusDays(7);
            req.setAttribute("expiryDate", exp.toString().replace("T", " ").substring(0, 16));
        } catch (Exception e) {
            req.setAttribute("error", "Could not generate control number: " + e.getMessage());
        }

        req.getRequestDispatcher("/WEB-INF/views/payments.jsp").forward(req, res);
    }

    private void verifyPayment(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Admin verifies a payment
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("adminUser") == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String ctrl    = req.getParameter("ctrl");
        String bankRef = req.getParameter("bankRef");
        int userId     = (int) session.getAttribute("adminUserId");

        try {
            boolean ok = paymentDAO.markPaid(ctrl, bankRef, userId);
            req.setAttribute("verifySuccess", ok);
            if (ok) req.setAttribute("verifiedCtrl", ctrl);
        } catch (Exception e) {
            req.setAttribute("error", "Verification failed: " + e.getMessage());
        }

        res.sendRedirect(req.getContextPath() + "/admin?tab=payments");
    }
}
