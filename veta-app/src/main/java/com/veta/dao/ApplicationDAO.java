package com.veta.dao;

import com.veta.models.Application;
import com.veta.utils.DBConnection;
import com.veta.utils.RefGenerator;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ApplicationDAO {

    // ✅ Helper: badilisha "MM/dd/yyyy" → "yyyy-MM-dd"
    private String toMySQLDate(String input) {
        if (input == null || input.trim().isEmpty() || input.equals("0000-00-00")) {
            return null;
        }
        try {
            SimpleDateFormat fromUser = new SimpleDateFormat("MM/dd/yyyy");
            SimpleDateFormat toMySQL = new SimpleDateFormat("yyyy-MM-dd");
            Date parsed = fromUser.parse(input.trim());
            return toMySQL.format(parsed);
        } catch (Exception e) {
            // Kama format si sahihi, jaribu kurudisha kama ilivyo (labda tayari yyyy-MM-dd)
            return input.trim();
        }
    }

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

            // ✅ Badilisha format ya date
            String dob = toMySQLDate(app.getDateOfBirth());
            if (dob == null) {
                ps.setNull(4, java.sql.Types.DATE);
            } else {
                ps.setString(4, dob);  // sasa ni yyyy-MM-dd
            }

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

            if (updated && "APPROVED".equalsIgnoreCase(newStatus)) {

                // ✅ Pata sequence number
                int sequence = 1;
                String seqSql = "SELECT COUNT(*) + 1 FROM students";
                try (PreparedStatement psSeq = conn.prepareStatement(seqSql);
                     ResultSet rsSeq = psSeq.executeQuery()) {
                    if (rsSeq.next()) sequence = rsSeq.getInt(1);
                }

                // ✅ Tengeneza student number
                String stuNum = RefGenerator.studentNumber(sequence);

                // ✅ Pata date_of_birth iliyobadilishwa tayari kwenye applications (sasa yyyy-MM-dd)
                String dobMySQL = null;
                String getDobSql = "SELECT date_of_birth FROM applications WHERE ref_number=?";
                try (PreparedStatement psDob = conn.prepareStatement(getDobSql)) {
                    psDob.setString(1, refNumber);
                    try (ResultSet rsDob = psDob.executeQuery()) {
                        if (rsDob.next()) {
                            // Ikiwa db ina DATE type, getString inarudisha yyyy-MM-dd tayari
                            dobMySQL = rsDob.getString("date_of_birth");
                        }
                    }
                }

                // ✅ Ikiwa bado ni mbaya (0000-00-00) au null, weka NULL
                if (dobMySQL == null || dobMySQL.equals("0000-00-00") || dobMySQL.isEmpty()) {
                    dobMySQL = null;
                } else {
                    // Bado jaribu kubadilisha ikiwa ilibakia format mbaya (safety)
                    dobMySQL = toMySQLDate(dobMySQL); // Hiari — ikiwa tayari ni yyyy-MM-dd, itarudisha sawa
                }

                // ✅ Insert kwenye students – tumia prepared statement ya kawaida kuepuka STR_TO_DATE
                String insertStudent =
                    "INSERT IGNORE INTO students (student_number, full_name, nida_number, phone, email, " +
                    "gender, date_of_birth, region_of_origin, residential_address, " +
                    "course_id, intake_period, enrollment_date, status) " +
                    "SELECT ?, full_name, nida_number, phone, email, gender, " +
                    "?, region_of_origin, residential_address, course_id, intake_period, " +
                    "CURDATE(), 'ACTIVE' " +
                    "FROM applications WHERE ref_number=?";

                try (PreparedStatement ps2 = conn.prepareStatement(insertStudent)) {
                    ps2.setString(1, stuNum);
                    if (dobMySQL == null) {
                        ps2.setNull(2, java.sql.Types.DATE);
                    } else {
                        ps2.setString(2, dobMySQL);
                    }
                    ps2.setString(3, refNumber);
                    ps2.executeUpdate();
                }

                // ✅ Tengeneza User account kwa student
                UserDAO userDAO = new UserDAO();
                userDAO.createStudentUsers();
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

        // ✅ Salama — haitaleta error kwa date mbaya
        try { a.setDateOfBirth(rs.getString("date_of_birth")); } catch (Exception ignored) {}

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
        try { a.setSubmittedAt(rs.getTimestamp("submitted_at")); } catch (Exception ignored) {}
        try { a.setUpdatedAt(rs.getTimestamp("updated_at")); } catch (Exception ignored) {}
        return a;
    }
}