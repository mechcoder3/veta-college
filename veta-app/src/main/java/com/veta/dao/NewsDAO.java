package com.veta.dao;

import com.veta.models.*;
import com.veta.utils.DBConnection;
import com.veta.utils.RefGenerator;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO {

    public List<NewsEvent> findPublished(int limit) throws SQLException {
        String sql = "SELECT * FROM news_events WHERE published=1 ORDER BY event_date DESC LIMIT ?";
        List<NewsEvent> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapRow(rs));
            }
        }
        return list;
    }

    public List<NewsEvent> findAll() throws SQLException {
        String sql = "SELECT * FROM news_events ORDER BY created_at DESC";
        List<NewsEvent> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) list.add(mapRow(rs));
        }
        return list;
    }

    public boolean insert(NewsEvent e) throws SQLException {
        String sql = "INSERT INTO news_events " +
                "(title_en, title_sw, excerpt_en, excerpt_sw, content_en, content_sw, " +
                " category, icon, event_date, published, published_at) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, e.getTitleEn());
            ps.setString(2, e.getTitleSw());
            ps.setString(3, e.getExcerptEn());
            ps.setString(4, e.getExcerptSw());
            ps.setString(5, e.getContentEn());
            ps.setString(6, e.getContentSw());
            ps.setString(7, e.getCategory());
            ps.setString(8, e.getIcon());
            ps.setDate(9, e.getEventDate());
            ps.setInt(10, e.isPublished() ? 1 : 0);
            ps.setTimestamp(11, e.isPublished() ? new Timestamp(System.currentTimeMillis()) : null);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean publish(int id) throws SQLException {
        String sql = "UPDATE news_events SET published=1, published_at=NOW() WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean delete(int id) throws SQLException {
        String sql = "DELETE FROM news_events WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    private NewsEvent mapRow(ResultSet rs) throws SQLException {
        NewsEvent e = new NewsEvent();
        e.setId(rs.getInt("id"));
        e.setTitleEn(rs.getString("title_en"));
        e.setTitleSw(rs.getString("title_sw"));
        e.setExcerptEn(rs.getString("excerpt_en"));
        e.setExcerptSw(rs.getString("excerpt_sw"));
        e.setContentEn(rs.getString("content_en"));
        e.setContentSw(rs.getString("content_sw"));
        e.setCategory(rs.getString("category"));
        e.setIcon(rs.getString("icon"));
        e.setBgGradient(rs.getString("bg_gradient"));
        e.setImagePath(rs.getString("image_path"));
        e.setEventDate(rs.getDate("event_date"));
        e.setPublished(rs.getInt("published") == 1);
        e.setPublishedAt(rs.getTimestamp("published_at"));
        e.setCreatedAt(rs.getTimestamp("created_at"));
        return e;
    }
}
