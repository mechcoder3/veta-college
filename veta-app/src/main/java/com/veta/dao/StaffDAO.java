package com.veta.dao;

import com.veta.models.*;
import com.veta.utils.DBConnection;
import com.veta.utils.RefGenerator;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO {

    public Staff findPrincipal() throws SQLException {
        String sql = "SELECT * FROM staff WHERE is_principal=1 AND is_visible=1 LIMIT 1";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) return mapRow(rs);
        }
        return null;
    }

    public List<Staff> findAll(boolean visibleOnly) throws SQLException {
        String sql = "SELECT * FROM staff " +
                (visibleOnly ? "WHERE is_visible=1 " : "") +
                "ORDER BY display_order ASC";
        List<Staff> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) list.add(mapRow(rs));
        }
        return list;
    }

    public List<Staff> findNonPrincipal() throws SQLException {
        String sql = "SELECT * FROM staff WHERE is_principal=0 AND is_visible=1 ORDER BY display_order";
        List<Staff> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) list.add(mapRow(rs));
        }
        return list;
    }

    public boolean updateWelcomeMessage(int staffId, String message) throws SQLException {
        String sql = "UPDATE staff SET welcome_message=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, message);
            ps.setInt(2, staffId);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updatePhotoPath(int staffId, String path) throws SQLException {
        String sql = "UPDATE staff SET photo_path=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, path);
            ps.setInt(2, staffId);
            return ps.executeUpdate() > 0;
        }
    }

    private Staff mapRow(ResultSet rs) throws SQLException {
        Staff s = new Staff();
        s.setId(rs.getInt("id"));
        s.setFullName(rs.getString("full_name"));
        s.setTitle(rs.getString("title"));
        s.setRoleTitle(rs.getString("role_title"));
        s.setDepartment(rs.getString("department"));
        s.setQualifications(rs.getString("qualifications"));
        s.setWelcomeMessage(rs.getString("welcome_message"));
        s.setPhotoPath(rs.getString("photo_path"));
        s.setDisplayOrder(rs.getInt("display_order"));
        s.setPrincipal(rs.getInt("is_principal") == 1);
        s.setVisible(rs.getInt("is_visible") == 1);
        return s;
    }
}
