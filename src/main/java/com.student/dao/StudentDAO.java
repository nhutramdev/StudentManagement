package com.student.dao;

import com.student.model.Student;
import com.student.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();

        String sql = "SELECT s.*, c.class_name " +
                "FROM students s " +
                "LEFT JOIN classes c ON s.class_id = c.id " +
                "ORDER BY s.id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapStudent(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Student> searchStudents(String keyword) {
        List<Student> list = new ArrayList<>();

        String sql = "SELECT s.*, c.class_name " +
                "FROM students s " +
                "LEFT JOIN classes c ON s.class_id = c.id " +
                "WHERE s.student_code LIKE ? OR s.full_name LIKE ? " +
                "ORDER BY s.id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapStudent(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Student> getStudentsByClassId(int classId) {
        List<Student> list = new ArrayList<>();

        String sql = "SELECT s.*, c.class_name " +
                "FROM students s " +
                "LEFT JOIN classes c ON s.class_id = c.id " +
                "WHERE s.class_id = ? " +
                "ORDER BY s.full_name ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, classId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapStudent(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Student getStudentById(int id) {
        String sql = "SELECT s.*, c.class_name " +
                "FROM students s " +
                "LEFT JOIN classes c ON s.class_id = c.id " +
                "WHERE s.id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapStudent(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public void addStudent(Student s) {
        String sql = "INSERT INTO students(student_code, full_name, gender, email, phone, class_id) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, s.getStudentCode());
            ps.setString(2, s.getFullName());
            ps.setString(3, s.getGender());
            ps.setString(4, s.getEmail());
            ps.setString(5, s.getPhone());

            if (s.getClassId() == 0) {
                ps.setNull(6, Types.INTEGER);
            } else {
                ps.setInt(6, s.getClassId());
            }

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateStudent(Student s) {
        String sql = "UPDATE students SET student_code = ?, full_name = ?, gender = ?, email = ?, phone = ?, class_id = ? WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, s.getStudentCode());
            ps.setString(2, s.getFullName());
            ps.setString(3, s.getGender());
            ps.setString(4, s.getEmail());
            ps.setString(5, s.getPhone());

            if (s.getClassId() == 0) {
                ps.setNull(6, Types.INTEGER);
            } else {
                ps.setInt(6, s.getClassId());
            }

            ps.setInt(7, s.getId());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteStudent(int id) {
        String sql = "DELETE FROM students WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Student mapStudent(ResultSet rs) throws Exception {
        Student s = new Student();

        s.setId(rs.getInt("id"));
        s.setStudentCode(rs.getString("student_code"));
        s.setFullName(rs.getString("full_name"));
        s.setGender(rs.getString("gender"));
        s.setEmail(rs.getString("email"));
        s.setPhone(rs.getString("phone"));
        s.setClassId(rs.getInt("class_id"));
        s.setClassName(rs.getString("class_name"));

        return s;
    }
}
