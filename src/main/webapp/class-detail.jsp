<%@ page import="com.student.model.ClassRoom" %>
<%@ page import="com.student.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ClassRoom classRoom = (ClassRoom) request.getAttribute("classRoom");
    List<Student> students = (List<Student>) request.getAttribute("students");
%>

<html>
<head>
    <title>Danh sách sinh viên trong lớp</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="layout">

    <jsp:include page="/WEB-INF/layout/sidebar.jsp">
        <jsp:param name="active" value="classes"/>
    </jsp:include>

    <div class="main">

        <div class="top-header">
            <a class="back-mini" href="classes">‹</a>
            <h2>Danh sách sinh viên lớp <%= classRoom.getClassName() %></h2>
        </div>

        <div class="content">

            <div class="toolbar">
                <div>
                    <a class="btn" href="classes?action=scoreboard&id=<%= classRoom.getId() %>">Xem bảng điểm lớp</a>
                </div>
            </div>

            <table class="table">
                <tr>
                    <th>ID</th>
                    <th>Mã SV</th>
                    <th>Họ tên</th>
                    <th>Giới tính</th>
                    <th>Email</th>
                    <th>SĐT</th>
                    <th>Hành động</th>
                </tr>

                <%
                    if (students != null && !students.isEmpty()) {
                        for (Student s : students) {
                %>
                <tr>
                    <td><%= s.getId() %></td>
                    <td><%= s.getStudentCode() %></td>
                    <td><%= s.getFullName() %></td>
                    <td><%= s.getGender() %></td>
                    <td><%= s.getEmail() %></td>
                    <td><%= s.getPhone() %></td>
                    <td>
                        <a class="btn" href="students?action=detail&id=<%= s.getId() %>">Chi tiết</a>
                        <a class="btn btn-green" href="students?action=attendance&id=<%= s.getId() %>">Điểm danh</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7" style="text-align:center;">Lớp này chưa có sinh viên</td>
                </tr>
                <%
                    }
                %>
            </table>

        </div>
    </div>
</div>

</body>
</html>