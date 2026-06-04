package com.student.controller;

import com.student.dao.ClassDAO;
import com.student.dao.ScoreDAO;
import com.student.dao.StudentDAO;
import com.student.model.ClassRoom;
import com.student.model.Score;
import com.student.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/classes")
public class ClassServlet extends HttpServlet {

    private ClassDAO classDAO = new ClassDAO();
    private StudentDAO studentDAO = new StudentDAO();
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
                request.getRequestDispatcher("class-form.jsp").forward(request, response);
                break;

            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                ClassRoom classRoom = classDAO.getClassById(id);
                request.setAttribute("classRoom", classRoom);
                request.getRequestDispatcher("class-form.jsp").forward(request, response);
                break;

            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                boolean success = classDAO.deleteClass(deleteId);

                if (!success) {
                    response.sendRedirect("classes?error=delete");
                } else {
                    response.sendRedirect("classes");
                }
                break;

            case "detail":
                int classId = Integer.parseInt(request.getParameter("id"));

                ClassRoom detailClass = classDAO.getClassById(classId);
                List<Student> students = studentDAO.getStudentsByClassId(classId);

                request.setAttribute("classRoom", detailClass);
                request.setAttribute("students", students);

                request.getRequestDispatcher("class-detail.jsp").forward(request, response);
                break;

            case "scoreboard":
                int scoreClassId = Integer.parseInt(request.getParameter("id"));

                ClassRoom scoreClass = classDAO.getClassById(scoreClassId);
                List<Score> scores = scoreDAO.getScoresByClassId(scoreClassId);

                request.setAttribute("classRoom", scoreClass);
                request.setAttribute("scores", scores);

                request.getRequestDispatcher("class-scoreboard.jsp").forward(request, response);
                break;

            default:
                List<ClassRoom> classes = classDAO.getAllClasses();
                request.setAttribute("classes", classes);
                request.getRequestDispatcher("class-list.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        String className = request.getParameter("className");

        ClassRoom c = new ClassRoom();
        c.setClassName(className);

        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            c.setId(id);
            classDAO.updateClass(c);
        } else {
            classDAO.addClass(c);
        }

        response.sendRedirect("classes");
    }
}
