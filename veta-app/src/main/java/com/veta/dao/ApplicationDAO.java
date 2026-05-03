package com.veta.dao;

import com.veta.models.Application;
import com.veta.utils.DBConnection;
import com.veta.utils.RefGenerator;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDAO {

    public String insertApplication(Application app) throws SQLException {
        String ref = RefGenerator.applicationRef();
        String sql = "INSERT INTO applications " +
                "(ref_number, full_name, nida_number, date_of_birth, gender, phone, email, " +
                " region_of_origin, residential_address, education_level, course_id, " +
                " intake_period, document_path, status) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,'PENDING')";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, ref);
            ps.setString(2, app.getFullName());
            ps.setString(3, app.getNidaNumber());
            ps.setString(4, app.getDateOfBirth());
            ps.setString(5, app.getGender());
            ps.setString(6, app.getPhone());
            ps.setString(7, app.getEmail());
            ps.setString(8, app.getRegionOfOrigin());
            ps.setString(9, app.getResidentialAddress());
            ps.setString(10, app.getEducationLevel());
            ps.setInt(11, app.getCourseId());
            ps.setString(12, app.getIntakePeriod());
            ps.setString(13, app.getDocumentPath());
            ps.executeUpdate();
        }
        return ref;
    }

    public Application findByRef(String refNumber) throws SQLException {
        String sql = "SELECT a.*, c.name_en AS course_name " +
                     "FROM applications a " +
                     "JOIN courses c ON a.course_id = c.id " +
                     "WHERE a.ref_number = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, refNumber);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        }
        return null;
    }

    public Application findByNida(String nida) throws SQLException {
        String sql = "SELECT a.*, c.name_en AS course_name FROM applications a " +
                     "JOIN courses c ON a.course_id = c.id WHERE a.nida_number = ? " +
                     "ORDER BY a.submitted_at DESC LIMIT 1";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, nida);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        }
        return null;
    }

    public List<Application> findAll(String statusFilter) throws SQLException {
        String sql = "SELECT a.*, c.name_en AS course_name FROM applications a " +
                     "JOIN courses c ON a.course_id = c.id ";
        if (statusFilter != null && !statusFilter.isEmpty() && !"all".equalsIgnoreCase(statusFilter)) {
            sql += "WHERE a.status = ? ";
        }
        sql += "ORDER BY a.submitted_at DESC";

        List<Application> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            if (statusFilter != null && !statusFilter.isEmpty() && !"all".equalsIgnoreCase(statusFilter)) {
                ps.setString(1, statusFilter.toUpperCase());
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapRow(rs));
            }
        }
        return list;
    }

    public int countByStatus(String status) throws SQLException {
        String sql = "SELECT COUNT(*) FROM applications WHERE status = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status.toUpperCase());
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
            }
        }
        return 0;
    }

    public boolean updateStatus(String refNumber, String newStatus, String notes, int reviewedBy) throws SQLException {
        String sql = "UPDATE applications SET status=?, review_notes=?, reviewed_by=?, reviewed_at=NOW() " +
                     "WHERE ref_number=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newStatus.toUpperCase());
            ps.setString(2, notes);
            ps.setInt(3, reviewedBy);
            ps.setString(4, refNumber);
            boolean updated = ps.executeUpdate() > 0;

            // Kama imeidhinishwa - ongeza kwenye students table
            if (updated && "APPROVED".equalsIgnoreCase(newStatus)) {
                String insertStudent =
                    "INSERT IGNORE INTO students (full_name, nida_number, phone, email, " +
                    "gender, date_of_birth, region_of_origin, residential_address, " +
                    "course_id, intake_period, status) " +
                    "SELECT full_name, nida_number, phone, email, gender, date_of_birth, " +
                    "region_of_origin, residential_address, course_id, intake_period, 'ACTIVE' " +
                    "FROM applications WHERE ref_number=?";
                try (PreparedStatement ps2 = conn.prepareStatement(insertStudent)) {
                    ps2.setString(1, refNumber);
                    ps2.executeUpdate();
                }
            }
            return updated;
        }
    }

    public boolean updateDocumentPath(String refNumber, String path) throws SQLException {
        String sql = "UPDATE applications SET document_path=? WHERE ref_number=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, path);
            ps.setString(2, refNumber);
            return ps.executeUpdate() > 0;
        }
    }

    public List<Application> search(String query) throws SQLException {
        String sql = "SELECT a.*, c.name_en AS course_name FROM applications a " +
                     "JOIN courses c ON a.course_id = c.id " +
                     "WHERE a.full_name LIKE ? OR a.ref_number LIKE ? OR a.nida_number LIKE ? " +
                     "ORDER BY a.submitted_at DESC LIMIT 50";
        String q = "%" + query + "%";
        List<Application> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, q); ps.setString(2, q); ps.setString(3, q);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapRow(rs));
            }
        }
        return list;
    }

    private Application mapRow(ResultSet rs) throws SQLException {
        Application a = new Application();
        a.setId(rs.getInt("id"));
        a.setRefNumber(rs.getString("ref_number"));
        a.setFullName(rs.getString("full_name"));
        a.setNidaNumber(rs.getString("nida_number"));
        a.setDateOfBirth(rs.getString("date_of_birth"));
        a.setGender(rs.getString("gender"));
        a.setPhone(rs.getString("phone"));
        a.setEmail(rs.getString("email"));
        a.setRegionOfOrigin(rs.getString("region_of_origin"));
        a.setResidentialAddress(rs.getString("residential_address"));
        a.setEducationLevel(rs.getString("education_level"));
        a.setCourseId(rs.getInt("course_id"));
        a.setCourseName(rs.getString("course_name"));
        a.setIntakePeriod(rs.getString("intake_period"));
        a.setDocumentPath(rs.getString("document_path"));
        a.setStatus(rs.getString("status"));
        a.setReviewNotes(rs.getString("review_notes"));
        a.setSubmittedAt(rs.getTimestamp("submitted_at"));
        a.setUpdatedAt(rs.getTimestamp("updated_at"));
        return a;
    }
}