package com.veta.dao;

import com.veta.models.*;
import com.veta.utils.DBConnection;
import com.veta.utils.RefGenerator;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public Student findByStudentNumber(String number) throws SQLException {
        String sql = "SELECT s.*, c.name_en AS course_name FROM students s " +
                     "JOIN courses c ON s.course_id = c.id " +
                     "WHERE s.student_number = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, number);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        }
        return null;
    }

    public Student findByUserId(int userId) throws SQLException {
        String sql = "SELECT s.*, c.name_en AS course_name FROM students s " +
                     "JOIN courses c ON s.course_id = c.id WHERE s.user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        }
        return null;
    }

    public List<Student> findAll(String statusFilter) throws SQLException {
        String sql = "SELECT s.*, c.name_en AS course_name FROM students s " +
                     "JOIN courses c ON s.course_id = c.id ";
        if (statusFilter != null && !"all".equalsIgnoreCase(statusFilter)) {
            sql += "WHERE s.status = ? ";
        }
        sql += "ORDER BY s.student_number DESC LIMIT 200";
        List<Student> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            if (statusFilter != null && !"all".equalsIgnoreCase(statusFilter)) {
                ps.setString(1, statusFilter.toUpperCase());
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapRow(rs));
            }
        }
        return list;
    }

    public int countTotal() throws SQLException {
        String sql = "SELECT COUNT(*) FROM students WHERE status='ACTIVE'";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) return rs.getInt(1);
        }
        return 0;
    }

    private Student mapRow(ResultSet rs) throws SQLException {
        Student s = new Student();
        s.setId(rs.getInt("id"));
        s.setStudentNumber(rs.getString("student_number"));
        s.setFullName(rs.getString("full_name"));
        s.setNidaNumber(rs.getString("nida_number"));
        s.setPhone(rs.getString("phone"));
        s.setEmail(rs.getString("email"));
        s.setCourseId(rs.getInt("course_id"));
        s.setCourseName(rs.getString("course_name"));
        s.setYearOfStudy(rs.getInt("year_of_study"));
        s.setSemester(rs.getInt("semester"));
        s.setIntakeYear(rs.getInt("intake_year"));
        s.setEnrollmentDate(rs.getDate("enrollment_date"));
        s.setStatus(rs.getString("status"));
        s.setPhotoPath(rs.getString("photo_path"));
        s.setCreatedAt(rs.getTimestamp("created_at"));
        return s;
    }
}
