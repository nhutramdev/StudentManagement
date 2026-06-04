<%@ page import="java.util.List" %>
<%@ page import="com.student.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Student> students = (List<Student>) request.getAttribute("students");
    String keyword = (String) request.getAttribute("keyword");
%>

<html>
<head>
    <title>Danh sách sinh viên</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="layout">

    <jsp:include page="/WEB-INF/layout/sidebar.jsp">
        <jsp:param name="active" value="students"/>
    </jsp:include>

    <div class="main">

        <div class="top-header">
            <a class="back-mini" href="dashboard.jsp">‹</a>
            <h2>Quản lý sinh viên</h2>
        </div>

        <div class="content">

            <div class="toolbar">
                <div>
                    <a class="btn btn-green" href="students?action=new">Thêm sinh viên</a>
                </div>

                <form class="search-box" action="students" method="get">
                    <input type="text" name="keyword" placeholder="Tìm theo mã hoặc tên sinh viên"
                           value="<%= keyword != null ? keyword : "" %>">
                    <button class="btn btn-green" type="submit">Tìm kiếm</button>
                </form>
            </div>

            <table class="table">
                <tr>
                    <th>ID</th>
                    <th>Mã SV</th>
                    <th>Họ tên</th>
                    <th>Giới tính</th>
                    <th>Email</th>
                    <th>SĐT</th>
                    <th>Lớp</th>
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
                    <td><%= s.getClassName() != null ? s.getClassName() : "Chưa có lớp" %></td>
                    <td>
                        <a class="btn" href="students?action=detail&id=<%= s.getId() %>">Chi tiết</a>

                        <a class="btn btn-green" href="students?action=attendance&id=<%= s.getId() %>">Điểm danh</a>

                        <a class="btn btn-orange" href="students?action=score&id=<%= s.getId() %>">Điểm</a>

                        <a class="btn btn-orange" href="students?action=edit&id=<%= s.getId() %>">Sửa</a>

                        <a class="btn btn-red"
                           href="students?action=delete&id=<%= s.getId() %>"
                           onclick="return confirm('Bạn có chắc muốn xóa sinh viên này không?')">
                            Xóa
                        </a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="8" style="text-align:center;">Không có sinh viên nào</td>
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