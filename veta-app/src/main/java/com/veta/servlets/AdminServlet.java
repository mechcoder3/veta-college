package com.veta.servlets;

import com.veta.dao.*;
import com.veta.models.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.stream.Collectors;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private final ApplicationDAO appDAO    = new ApplicationDAO();
    private final PaymentDAO     payDAO    = new PaymentDAO();
    private final StudentDAO     stuDAO    = new StudentDAO();
    private final CourseDAO      courseDAO = new CourseDAO();
    private final StaffDAO       staffDAO  = new StaffDAO();
    private final NewsDAO        newsDAO   = new NewsDAO();
    private final ProductionDAO  prodDAO   = new ProductionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("adminUser") == null) {
            res.sendRedirect(req.getContextPath() + "/login?type=admin");
            return;
        }

        String tab = req.getParameter("tab");
        if (tab == null) tab = "overview";
        req.setAttribute("activeTab", tab);

        try {
            switch (tab) {
                case "applications":
                    req.setAttribute("applications", appDAO.findAll(req.getParameter("status")));
                    req.setAttribute("statusFilter", req.getParameter("status"));
                    break;
                case "payments":
                    req.setAttribute("payments", payDAO.findAll(req.getParameter("status")));
                    break;
                case "students":
                    req.setAttribute("students", stuDAO.findAll(req.getParameter("status")));
                    break;
                case "courses":
                    req.setAttribute("courses", courseDAO.findAll(false));
                    break;
                case "leadership":
                    req.setAttribute("staffList", staffDAO.findAll(false));
                    break;
                case "news":
                    req.setAttribute("newsList", newsDAO.findAll());
                    break;
                case "production":
                    req.setAttribute("orders", prodDAO.findAll(req.getParameter("status")));
                    break;
                default:
                    loadOverview(req);
                    break;
            }
        } catch (Exception e) {
            req.setAttribute("adminError", e.getMessage());
        }
        req.getRequestDispatcher("/WEB-INF/views/admin.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("adminUser") == null) {
            res.sendRedirect(req.getContextPath() + "/login?type=admin");
            return;
        }
        int adminId = (int) session.getAttribute("adminUserId");
        String action = req.getParameter("action");
        String redirect = req.getContextPath() + "/admin";

        try {
            switch (action != null ? action : "") {
                case "approveApp":
                    appDAO.updateStatus(req.getParameter("ref"), "APPROVED", req.getParameter("notes"), adminId);
                    redirect = req.getContextPath() + "/admin?tab=applications";
                    break;
                case "rejectApp":
                    appDAO.updateStatus(req.getParameter("ref"), "REJECTED", req.getParameter("notes"), adminId);
                    redirect = req.getContextPath() + "/admin?tab=applications";
                    break;
                case "verifyPayment":
                    payDAO.markPaid(req.getParameter("ctrl"), req.getParameter("bankRef"), adminId);
                    redirect = req.getContextPath() + "/admin?tab=payments";
                    break;
                case "updateOrderStatus":
                    prodDAO.updateStatus(req.getParameter("orderNo"), req.getParameter("status"));
                    redirect = req.getContextPath() + "/admin?tab=production";
                    break;
                case "publishNews":
                    newsDAO.publish(Integer.parseInt(req.getParameter("id")));
                    redirect = req.getContextPath() + "/admin?tab=news";
                    break;
                case "deleteNews":
                    newsDAO.delete(Integer.parseInt(req.getParameter("id")));
                    redirect = req.getContextPath() + "/admin?tab=news";
                    break;
                case "addNews":
                    NewsEvent ev = new NewsEvent();
                    ev.setTitleEn(req.getParameter("titleEn"));
                    ev.setTitleSw(req.getParameter("titleSw"));
                    ev.setExcerptEn(req.getParameter("excerptEn"));
                    ev.setExcerptSw(req.getParameter("excerptSw"));
                    ev.setCategory(req.getParameter("category"));
                    ev.setIcon(req.getParameter("icon") != null ? req.getParameter("icon") : "📰");
                    String ds = req.getParameter("eventDate");
                    if (ds != null && !ds.isEmpty()) ev.setEventDate(java.sql.Date.valueOf(ds));
                    ev.setPublished("1".equals(req.getParameter("published")));
                    newsDAO.insert(ev);
                    redirect = req.getContextPath() + "/admin?tab=news";
                    break;
            }
        } catch (Exception ex) {
            req.getSession().setAttribute("flashError", ex.getMessage());
        }
        res.sendRedirect(redirect);
    }

    private void loadOverview(HttpServletRequest req) throws Exception {
        req.setAttribute("totalStudents",   stuDAO.countTotal());
        req.setAttribute("pendingApps",     appDAO.countByStatus("PENDING"));
        req.setAttribute("pendingPayments", payDAO.countByStatus("PENDING"));
        req.setAttribute("activeOrders",    prodDAO.findAll("IN_PROGRESS").size());
        req.setAttribute("recentApps",      appDAO.findAll(null).stream().limit(5).collect(Collectors.toList()));
    }
}