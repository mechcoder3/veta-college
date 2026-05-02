package com.veta.dao;

import com.veta.models.*;
import com.veta.utils.DBConnection;
import com.veta.utils.RefGenerator;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {

    public String createControlNumber(Payment p) throws SQLException {
        String ctrl = RefGenerator.controlNumber();
        String sql = "INSERT INTO payments " +
                "(control_number, payer_name, payer_phone, reference_id, student_id, " +
                " application_id, payment_type, amount, academic_year, description, status, expires_at) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?,'PENDING', DATE_ADD(NOW(), INTERVAL 7 DAY))";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, ctrl);
            ps.setString(2, p.getPayerName());
            ps.setString(3, p.getPayerPhone());
            ps.setString(4, p.getReferenceId());
            if (p.getStudentId() != null)     ps.setInt(5, p.getStudentId());     else ps.setNull(5, Types.INTEGER);
            if (p.getApplicationId() != null) ps.setInt(6, p.getApplicationId()); else ps.setNull(6, Types.INTEGER);
            ps.setString(7, p.getPaymentType());
            ps.setBigDecimal(8, p.getAmount());
            ps.setString(9, p.getAcademicYear());
            ps.setString(10, p.getDescription());
            ps.executeUpdate();
        }
        return ctrl;
    }

    public Payment findByControlNumber(String ctrl) throws SQLException {
        String sql = "SELECT * FROM payments WHERE control_number = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, ctrl);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        }
        return null;
    }

    public List<Payment> findByReference(String ref) throws SQLException {
        String sql = "SELECT * FROM payments WHERE reference_id = ? ORDER BY created_at DESC";
        List<Payment> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, ref);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapRow(rs));
            }
        }
        return list;
    }

    public List<Payment> findByStudentId(int studentId) throws SQLException {
        String sql = "SELECT * FROM payments WHERE student_id = ? ORDER BY created_at DESC";
        List<Payment> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapRow(rs));
            }
        }
        return list;
    }

    public List<Payment> findAll(String statusFilter) throws SQLException {
        String sql = "SELECT * FROM payments ";
        if (statusFilter != null && !"all".equalsIgnoreCase(statusFilter)) {
            sql += "WHERE status = ? ";
        }
        sql += "ORDER BY created_at DESC LIMIT 100";
        List<Payment> list = new ArrayList<>();
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

    public int countByStatus(String status) throws SQLException {
        String sql = "SELECT COUNT(*) FROM payments WHERE status = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status.toUpperCase());
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
            }
        }
        return 0;
    }

    /** Admin verifies payment as paid. */
    public boolean markPaid(String ctrl, String bankRef, int verifiedBy) throws SQLException {
        String sql = "UPDATE payments SET status='PAID', bank_ref=?, verified_by=?, paid_at=NOW() " +
                     "WHERE control_number=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, bankRef);
            ps.setInt(2, verifiedBy);
            ps.setString(3, ctrl);
            return ps.executeUpdate() > 0;
        }
    }

    private Payment mapRow(ResultSet rs) throws SQLException {
        Payment p = new Payment();
        p.setId(rs.getInt("id"));
        p.setControlNumber(rs.getString("control_number"));
        p.setPayerName(rs.getString("payer_name"));
        p.setPayerPhone(rs.getString("payer_phone"));
        p.setReferenceId(rs.getString("reference_id"));
        p.setPaymentType(rs.getString("payment_type"));
        p.setAmount(rs.getBigDecimal("amount"));
        p.setAcademicYear(rs.getString("academic_year"));
        p.setDescription(rs.getString("description"));
        p.setBankRef(rs.getString("bank_ref"));
        p.setStatus(rs.getString("status"));
        p.setExpiresAt(rs.getTimestamp("expires_at"));
        p.setPaidAt(rs.getTimestamp("paid_at"));
        p.setCreatedAt(rs.getTimestamp("created_at"));
        int sid = rs.getInt("student_id");     if (!rs.wasNull()) p.setStudentId(sid);
        int aid = rs.getInt("application_id"); if (!rs.wasNull()) p.setApplicationId(aid);
        return p;
    }
}
