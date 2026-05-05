package com.veta.dao;

import com.veta.models.*;
import com.veta.utils.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {

    public List<Course> findAll(boolean activeOnly) throws SQLException {
        String sql = "SELECT c.*, " +
                "(SELECT COUNT(*) FROM students s WHERE s.course_id = c.id AND s.status='ACTIVE') AS enrolled_count " +
                "FROM courses c " +
                (activeOnly ? "WHERE c.is_active = 1 " : "") +
                "ORDER BY c.course_type, c.name_en";
        List<Course> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) list.add(mapRow(rs));
        }
        return list;
    }

    public List<Course> findByType(String type) throws SQLException {
        String sql = "SELECT c.*, " +
                "(SELECT COUNT(*) FROM students s WHERE s.course_id=c.id AND s.status='ACTIVE') AS enrolled_count " +
                "FROM courses c WHERE c.course_type=? AND c.is_active=1 ORDER BY c.name_en";
        List<Course> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, type.toUpperCase());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapRow(rs));
            }
        }
        return list;
    }

    public Course findById(int id) throws SQLException {
        String sql = "SELECT c.*, 0 AS enrolled_count FROM courses c WHERE c.id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        }
        return null;
    }

    private Course mapRow(ResultSet rs) throws SQLException {
        Course c = new Course();
        c.setId(rs.getInt("id"));
        c.setCourseCode(rs.getString("course_code"));
        c.setNameEn(rs.getString("name_en"));
        c.setNameSw(rs.getString("name_sw"));
        c.setCourseType(rs.getString("course_type"));
        c.setnvaLevel(rs.getString("nva_level"));
        c.setDurationMonths(rs.getInt("duration_months"));
        c.setAnnualFee(rs.getBigDecimal("annual_fee"));
        c.setRegistrationFee(rs.getBigDecimal("registration_fee"));
        c.setExamFee(rs.getBigDecimal("exam_fee"));
        c.setApplicationFee(rs.getBigDecimal("application_fee"));
        c.setEntryRequirementsEn(rs.getString("entry_requirements_en"));
        c.setEntryRequirementsSw(rs.getString("entry_requirements_sw"));
        c.setDescriptionEn(rs.getString("description_en"));
        c.setDescriptionSw(rs.getString("description_sw"));
        c.setDepartment(rs.getString("department"));
        c.setMaxCapacity(rs.getInt("max_capacity"));
        c.setActive(rs.getInt("is_active") == 1);
        c.setEnrolledCount(rs.getInt("enrolled_count"));
        return c;
    }
}
