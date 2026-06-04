package com.student.dao;

import com.student.model.Score;
import com.student.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ScoreDAO {

    public List<Score> getScoresByStudentId(int studentId) {
        List<Score> list = new ArrayList<>();

        String sql = "SELECT sc.*, s.student_code, s.full_name, c.class_name " +
                "FROM scores sc " +
                "JOIN students s ON sc.student_id = s.id " +
                "LEFT JOIN classes c ON s.class_id = c.id " +
                "WHERE sc.student_id = ? " +
                "ORDER BY sc.id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Score sc = mapScore(rs);
                list.add(sc);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Score> getScoresByClassId(int classId) {
        List<Score> list = new ArrayList<>();

        String sql = "SELECT sc.*, s.student_code, s.full_name, c.class_name " +
                "FROM scores sc " +
                "JOIN students s ON sc.student_id = s.id " +
                "LEFT JOIN classes c ON s.class_id = c.id " +
                "WHERE s.class_id = ? " +
                "ORDER BY s.full_name ASC, sc.subject_name ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, classId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Score sc = mapScore(rs);
                list.add(sc);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void addScore(Score sc) {
        String sql = "INSERT INTO scores(student_id, subject_name, process_score, midterm_score, final_score, average_score, note) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, sc.getStudentId());
            ps.setString(2, sc.getSubjectName());
            ps.setDouble(3, sc.getProcessScore());
            ps.setDouble(4, sc.getMidtermScore());
            ps.setDouble(5, sc.getFinalScore());
            ps.setDouble(6, sc.getAverageScore());
            ps.setString(7, sc.getNote());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Score mapScore(ResultSet rs) throws Exception {
        Score sc = new Score();

        sc.setId(rs.getInt("id"));
        sc.setStudentId(rs.getInt("student_id"));
        sc.setStudentCode(rs.getString("student_code"));
        sc.setFullName(rs.getString("full_name"));
        sc.setClassName(rs.getString("class_name"));
        sc.setSubjectName(rs.getString("subject_name"));
        sc.setProcessScore(rs.getDouble("process_score"));
        sc.setMidtermScore(rs.getDouble("midterm_score"));
        sc.setFinalScore(rs.getDouble("final_score"));
        sc.setAverageScore(rs.getDouble("average_score"));
        sc.setNote(rs.getString("note"));

        return sc;
    }
}
