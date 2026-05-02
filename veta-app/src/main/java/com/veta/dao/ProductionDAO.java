package com.veta.dao;

import com.veta.models.*;
import com.veta.utils.DBConnection;
import com.veta.utils.RefGenerator;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductionDAO {

    public String insertOrder(ProductionOrder o) throws SQLException {
        String no = RefGenerator.orderNumber();
        String sql = "INSERT INTO production_orders " +
                "(order_number, client_name, client_phone, client_email, custom_product, " +
                " specifications, quantity, estimated_budget, status) " +
                "VALUES (?,?,?,?,?,?,?,?,'PENDING')";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, no);
            ps.setString(2, o.getClientName());
            ps.setString(3, o.getClientPhone());
            ps.setString(4, o.getClientEmail());
            ps.setString(5, o.getCustomProduct());
            ps.setString(6, o.getSpecifications());
            ps.setInt(7, o.getQuantity());
            ps.setBigDecimal(8, o.getEstimatedBudget());
            ps.executeUpdate();
        }
        return no;
    }

    public List<ProductionOrder> findAll(String statusFilter) throws SQLException {
        String sql = "SELECT * FROM production_orders ";
        if (statusFilter != null && !"all".equalsIgnoreCase(statusFilter)) {
            sql += "WHERE status = ? ";
        }
        sql += "ORDER BY order_date DESC LIMIT 100";
        List<ProductionOrder> list = new ArrayList<>();
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

    public boolean updateStatus(String orderNo, String status) throws SQLException {
        String sql = "UPDATE production_orders SET status=? WHERE order_number=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status.toUpperCase());
            ps.setString(2, orderNo);
            return ps.executeUpdate() > 0;
        }
    }

    private ProductionOrder mapRow(ResultSet rs) throws SQLException {
        ProductionOrder o = new ProductionOrder();
        o.setId(rs.getInt("id"));
        o.setOrderNumber(rs.getString("order_number"));
        o.setClientName(rs.getString("client_name"));
        o.setClientPhone(rs.getString("client_phone"));
        o.setClientEmail(rs.getString("client_email"));
        o.setCustomProduct(rs.getString("custom_product"));
        o.setSpecifications(rs.getString("specifications"));
        o.setQuantity(rs.getInt("quantity"));
        o.setEstimatedBudget(rs.getBigDecimal("estimated_budget"));
        o.setQuotedAmount(rs.getBigDecimal("quoted_amount"));
        o.setDepartment(rs.getString("department"));
        o.setStatus(rs.getString("status"));
        o.setNotes(rs.getString("notes"));
        o.setOrderDate(rs.getTimestamp("order_date"));
        o.setExpectedDate(rs.getDate("expected_date"));
        o.setCompletedDate(rs.getDate("completed_date"));
        return o;
    }
}
