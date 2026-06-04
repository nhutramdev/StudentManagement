package com.student.dao;

import com.student.model.ClassRoom;
import com.student.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClassDAO {

    public List<ClassRoom> getAllClasses() {
        List<ClassRoom> list = new ArrayList<>();

        String sql = "SELECT c.id, c.class_name, COUNT(s.id) AS total_students " +
                "FROM classes c " +
                "LEFT JOIN students s ON c.id = s.class_id " +
                "GROUP BY c.id, c.class_name " +
                "ORDER BY c.id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ClassRoom c = new ClassRoom();
                c.setId(rs.getInt("id"));
                c.setClassName(rs.getString("class_name"));
                c.setTotalStudents(rs.getInt("total_students"));
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ClassRoom getClassById(int id) {
        String sql = "SELECT * FROM classes WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ClassRoom c = new ClassRoom();
                c.setId(rs.getInt("id"));
                c.setClassName(rs.getString("class_name"));
                return c;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public void addClass(ClassRoom c) {
        String sql = "INSERT INTO classes(class_name) VALUES (?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, c.getClassName());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateClass(ClassRoom c) {
        String sql = "UPDATE classes SET class_name = ? WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, c.getClassName());
            ps.setInt(2, c.getId());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean deleteClass(int id) {
        String sql = "DELETE FROM classes WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
