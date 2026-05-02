package com.veta.dao;

import com.veta.models.User;
import com.veta.utils.DBConnection;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;

public class UserDAO {

    /** Authenticate username + plaintext password. Returns User if valid, null otherwise. */
    public User authenticate(String username, String plainPassword) throws SQLException {
        String sql = "SELECT * FROM users WHERE username=? AND is_active=1";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String hash = rs.getString("password_hash");
                    if (BCrypt.checkpw(plainPassword, hash)) {
                        User u = mapRow(rs);
                        updateLastLogin(u.getId(), conn);
                        return u;
                    }
                }
            }
        }
        return null;
    }

    /** Authenticate by student number + last-6-digits-of-NIDA (student portal). */
    public User authenticateStudent(String studentNumber, String nidaLast6) throws SQLException {
        String sql = "SELECT u.* FROM users u " +
                     "JOIN students s ON s.user_id = u.id " +
                     "WHERE s.student_number=? AND u.is_active=1";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, studentNumber);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String hash = rs.getString("password_hash");
                    if (BCrypt.checkpw(nidaLast6, hash)) {
                        return mapRow(rs);
                    }
                }
            }
        }
        return null;
    }

    /** Tengeneza users za students ambazo hazina user_id - inaitwa wakati wa login */
    public void createStudentUsers() throws SQLException {
        String sql = "SELECT s.* FROM students s WHERE s.user_id IS NULL";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String nida = rs.getString("nida_number");
                String studentNumber = rs.getString("student_number");
                int studentId = rs.getInt("id");

                if (nida == null || nida.isEmpty()) continue;

                // Last 6 digits za NIDA = default password
                String last6 = nida.length() >= 6 ?
                    nida.substring(nida.length() - 6) : nida;
                String hash = BCrypt.hashpw(last6, BCrypt.gensalt(12));

                // Tengeneza user
                String insertUser = "INSERT INTO users (username, password_hash, role, " +
                    "full_name, email, phone, is_active) VALUES (?,?,?,?,?,?,1)";
                try (PreparedStatement ins = conn.prepareStatement(insertUser,
                    Statement.RETURN_GENERATED_KEYS)) {
                    ins.setString(1, studentNumber);
                    ins.setString(2, hash);
                    ins.setString(3, "STUDENT");
                    ins.setString(4, rs.getString("full_name"));
                    ins.setString(5, rs.getString("email"));
                    ins.setString(6, rs.getString("phone"));
                    ins.executeUpdate();

                    // Pata user id iliyotengenezwa
                    ResultSet keys = ins.getGeneratedKeys();
                    if (keys.next()) {
                        int userId = keys.getInt(1);
                        // Link student na user
                        String update = "UPDATE students SET user_id=? WHERE id=?";
                        try (PreparedStatement upd = conn.prepareStatement(update)) {
                            upd.setInt(1, userId);
                            upd.setInt(2, studentId);
                            upd.executeUpdate();
                        }
                    }
                }
            }
        }
    }

    public User findById(int id) throws SQLException {
        String sql = "SELECT * FROM users WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        }
        return null;
    }

    public boolean createUser(User u, String plainPassword) throws SQLException {
        String hash = BCrypt.hashpw(plainPassword, BCrypt.gensalt(12));
        String sql = "INSERT INTO users (username, password_hash, role, full_name, email, phone) " +
                     "VALUES (?,?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getUsername());
            ps.setString(2, hash);
            ps.setString(3, u.getRole());
            ps.setString(4, u.getFullName());
            ps.setString(5, u.getEmail());
            ps.setString(6, u.getPhone());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean changePassword(int userId, String newPlainPassword) throws SQLException {
        String hash = BCrypt.hashpw(newPlainPassword, BCrypt.gensalt(12));
        String sql = "UPDATE users SET password_hash=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, hash);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        }
    }

    private void updateLastLogin(int userId, Connection conn) throws SQLException {
        String sql = "UPDATE users SET last_login=NOW() WHERE id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        }
    }

    private User mapRow(ResultSet rs) throws SQLException {
        User u = new User();
        u.setId(rs.getInt("id"));
        u.setUsername(rs.getString("username"));
        u.setPasswordHash(rs.getString("password_hash"));
        u.setRole(rs.getString("role"));
        u.setFullName(rs.getString("full_name"));
        u.setEmail(rs.getString("email"));
        u.setPhone(rs.getString("phone"));
        u.setActive(rs.getInt("is_active") == 1);
        u.setLastLogin(rs.getTimestamp("last_login"));
        u.setCreatedAt(rs.getTimestamp("created_at"));
        return u;
    }
}