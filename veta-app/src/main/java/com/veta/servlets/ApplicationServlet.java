package com.veta.servlets;

import com.veta.dao.ApplicationDAO;
import com.veta.dao.CourseDAO;
import com.veta.models.Application;
import com.veta.models.Course;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.*;
import java.util.List;

@MultipartConfig(maxFileSize = 10 * 1024 * 1024)
@WebServlet({"/admissions", "/application"})
public class ApplicationServlet extends HttpServlet {

    private final ApplicationDAO appDAO = new ApplicationDAO();
    private final CourseDAO courseDAO = new CourseDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if ("status".equals(action)) {
            String ref = req.getParameter("ref");
            if (ref != null && !ref.trim().isEmpty()) {
                try {
                    Application app = appDAO.findByRef(ref.trim().toUpperCase());
                    req.setAttribute("application", app);
                    req.setAttribute("found", app != null);
                } catch (Exception e) {
                    req.setAttribute("error", "Error retrieving application: " + e.getMessage());
                }
            }
            req.getRequestDispatcher("/WEB-INF/views/admissions.jsp").forward(req, res);
            return;
        }

        try {
            List<Course> courses = courseDAO.findAll(true);
            req.setAttribute("courses", courses);
        } catch (Exception e) {
            req.setAttribute("error", "Could not load courses: " + e.getMessage());
        }
        req.getRequestDispatcher("/WEB-INF/views/admissions.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        Application app = new Application();
        app.setFullName(req.getParameter("fullName"));
        app.setNidaNumber(req.getParameter("nidaNumber"));
        app.setDateOfBirth(req.getParameter("dateOfBirth"));
        app.setGender(req.getParameter("gender"));
        app.setPhone(req.getParameter("phone"));
        app.setEmail(req.getParameter("email"));
        app.setRegionOfOrigin(req.getParameter("regionOfOrigin"));
        app.setResidentialAddress(req.getParameter("residentialAddress"));
        app.setEducationLevel(req.getParameter("educationLevel"));
        app.setIntakePeriod(req.getParameter("intakePeriod"));

        if (app.getFullName() == null || app.getFullName().trim().isEmpty() ||
            app.getNidaNumber() == null || app.getNidaNumber().trim().isEmpty() ||
            app.getPhone() == null || app.getPhone().trim().isEmpty()) {
            req.setAttribute("error", "Please fill all required fields.");
            try { req.setAttribute("courses", courseDAO.findAll(true)); } catch (Exception ignored) {}
            req.getRequestDispatcher("/WEB-INF/views/admissions.jsp").forward(req, res);
            return;
        }

        try {
            int courseId = Integer.parseInt(req.getParameter("courseId"));
            app.setCourseId(courseId);
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Please select a valid course.");
            try { req.setAttribute("courses", courseDAO.findAll(true)); } catch (Exception ignored) {}
            req.getRequestDispatcher("/WEB-INF/views/admissions.jsp").forward(req, res);
            return;
        }

        // Handle file upload
        Part filePart = req.getPart("document");
        if (filePart != null && filePart.getSize() > 0) {
            String uploadDir = System.getProperty("java.io.tmpdir") + File.separator + "veta_uploads";
            Files.createDirectories(Paths.get(uploadDir));
            String fileName = System.currentTimeMillis() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName();
            filePart.write(uploadDir + File.separator + fileName);
            app.setDocumentPath("uploads/" + fileName);
        }

        try {
            String ref = appDAO.insertApplication(app);
            req.setAttribute("refNumber", ref);
            req.setAttribute("success", true);
            req.setAttribute("applicantName", app.getFullName());
        } catch (Exception e) {
            req.setAttribute("error", "Submission failed: " + e.getMessage());
        }

        try { req.setAttribute("courses", courseDAO.findAll(true)); } catch (Exception ignored) {}
        req.getRequestDispatcher("/WEB-INF/views/admissions.jsp").forward(req, res);
    }
}