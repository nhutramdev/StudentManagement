package com.student.dao;

import com.student.model.Attendance;
import com.student.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDAO {

    public List<Attendance> getAttendanceByStudentId(int studentId) {
        List<Attendance> list = new ArrayList<>();

        String sql = "SELECT * FROM attendance WHERE student_id = ? ORDER BY attendance_date DESC, id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Attendance a = new Attendance();
                a.setId(rs.getInt("id"));
                a.setStudentId(rs.getInt("student_id"));
                a.setAttendanceDate(rs.getString("attendance_date"));
                a.setStatus(rs.getString("status"));
                a.setNote(rs.getString("note"));
                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void addAttendance(Attendance a) {
        String sql = "INSERT INTO attendance(student_id, attendance_date, status, note) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, a.getStudentId());
            ps.setString(2, a.getAttendanceDate());
            ps.setString(3, a.getStatus());
            ps.setString(4, a.getNote());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
