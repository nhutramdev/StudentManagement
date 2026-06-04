package com.student.controller;

import com.student.dao.AttendanceDAO;
import com.student.dao.ScoreDAO;
import com.student.dao.StudentDAO;
import com.student.model.Attendance;
import com.student.model.Score;
import com.student.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {

    private StudentDAO studentDAO = new StudentDAO();
    private AttendanceDAO attendanceDAO = new AttendanceDAO();
    private ScoreDAO scoreDAO = new ScoreDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "new":
                request.getRequestDispatcher("student-form.jsp").forward(request, response);
                break;

            case "edit":
                int editId = Integer.parseInt(request.getParameter("id"));
                Student editStudent = studentDAO.getStudentById(editId);
                request.setAttribute("student", editStudent);
                request.getRequestDispatcher("student-form.jsp").forward(request, response);
                break;

            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                studentDAO.deleteStudent(deleteId);
                response.sendRedirect("students");
                break;

            case "detail":
                int detailId = Integer.parseInt(request.getParameter("id"));
                Student detailStudent = studentDAO.getStudentById(detailId);

                List<Attendance> attendanceList = attendanceDAO.getAttendanceByStudentId(detailId);
                List<Score> scoreList = scoreDAO.getScoresByStudentId(detailId);

                request.setAttribute("student", detailStudent);
                request.setAttribute("attendanceList", attendanceList);
                request.setAttribute("scoreList", scoreList);

                request.getRequestDispatcher("student-detail.jsp").forward(request, response);
                break;

            case "attendance":
                int attendanceId = Integer.parseInt(request.getParameter("id"));
                Student attendanceStudent = studentDAO.getStudentById(attendanceId);

                request.setAttribute("student", attendanceStudent);
                request.getRequestDispatcher("attendance-form.jsp").forward(request, response);
                break;

            case "score":
                int scoreId = Integer.parseInt(request.getParameter("id"));
                Student scoreStudent = studentDAO.getStudentById(scoreId);

                request.setAttribute("student", scoreStudent);
                request.getRequestDispatcher("score-form.jsp").forward(request, response);
                break;

            default:
                String keyword = request.getParameter("keyword");

                List<Student> students;

                if (keyword != null && !keyword.trim().isEmpty()) {
                    students = studentDAO.searchStudents(keyword.trim());
                } else {
                    students = studentDAO.getAllStudents();
                }

                request.setAttribute("students", students);
                request.setAttribute("keyword", keyword);
                request.getRequestDispatcher("student-list.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");

        if ("saveAttendance".equals(action)) {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            String attendanceDate = request.getParameter("attendanceDate");
            String status = request.getParameter("status");
            String note = request.getParameter("note");

            Attendance attendance = new Attendance();
            attendance.setStudentId(studentId);
            attendance.setAttendanceDate(attendanceDate);
            attendance.setStatus(status);
            attendance.setNote(note);

            attendanceDAO.addAttendance(attendance);

            response.sendRedirect("students?action=detail&id=" + studentId);
            return;
        }

        if ("saveScore".equals(action)) {
            int studentId = Integer.parseInt(request.getParameter("studentId"));

            String subjectName = request.getParameter("subjectName");
            double processScore = parseDouble(request.getParameter("processScore"));
            double midtermScore = parseDouble(request.getParameter("midtermScore"));
            double finalScore = parseDouble(request.getParameter("finalScore"));

            double averageScore = processScore * 0.2 + midtermScore * 0.3 + finalScore * 0.5;

            String note = request.getParameter("note");

            Score score = new Score();
            score.setStudentId(studentId);
            score.setSubjectName(subjectName);
            score.setProcessScore(processScore);
            score.setMidtermScore(midtermScore);
            score.setFinalScore(finalScore);
            score.setAverageScore(averageScore);
            score.setNote(note);

            scoreDAO.addScore(score);

            response.sendRedirect("students?action=detail&id=" + studentId);
            return;
        }

        String studentCode = request.getParameter("studentCode");
        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String classIdText = request.getParameter("classId");

        int classId = 0;

        if (classIdText != null && !classIdText.trim().isEmpty()) {
            classId = Integer.parseInt(classIdText);
        }

        Student student = new Student();

        student.setStudentCode(studentCode);
        student.setFullName(fullName);
        student.setGender(gender);
        student.setEmail(email);
        student.setPhone(phone);
        student.setClassId(classId);

        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            student.setId(id);
            studentDAO.updateStudent(student);
        } else {
            studentDAO.addStudent(student);
        }

        response.sendRedirect("students");
    }

    private double parseDouble(String value) {
        try {
            if (value == null || value.trim().isEmpty()) {
                return 0;
            }

            return Double.parseDouble(value);
        } catch (Exception e) {
            return 0;
        }
    }
}
