<%@ page import="java.util.List" %>
<%@ page import="com.student.model.ClassRoom" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<ClassRoom> classes = (List<ClassRoom>) request.getAttribute("classes");
    String error = request.getParameter("error");
%>

<html>
<head>
    <title>Quản lý lớp học</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="layout">

    <jsp:include page="/WEB-INF/layout/sidebar.jsp">
        <jsp:param name="active" value="classes"/>
    </jsp:include>

    <div class="main">

        <div class="top-header">
            <a class="back-mini" href="dashboard.jsp">‹</a>
            <h2>Quản lý lớp học</h2>
        </div>

        <div class="content">

            <% if ("delete".equals(error)) { %>
            <div class="alert">
                Không thể xóa lớp này vì vẫn còn sinh viên thuộc lớp.
            </div>
            <% } %>

            <div class="toolbar">
                <div>
                    <a class="btn btn-green" href="classes?action=new">Thêm lớp học</a>
                </div>
            </div>

            <table class="table">
                <tr>
                    <th>ID</th>
                    <th>Tên lớp</th>
                    <th>Số sinh viên</th>
                    <th>Hành động</th>
                </tr>

                <%
                    if (classes != null && !classes.isEmpty()) {
                        for (ClassRoom c : classes) {
                %>
                <tr>
                    <td><%= c.getId() %></td>
                    <td><%= c.getClassName() %></td>
                    <td><%= c.getTotalStudents() %></td>
                    <td>
                        <a class="btn" href="classes?action=detail&id=<%= c.getId() %>">Danh sách SV</a>

                        <a class="btn btn-green" href="classes?action=scoreboard&id=<%= c.getId() %>">Bảng điểm</a>

                        <a class="btn btn-orange" href="classes?action=edit&id=<%= c.getId() %>">Sửa</a>

                        <a class="btn btn-red"
                           href="classes?action=delete&id=<%= c.getId() %>"
                           onclick="return confirm('Bạn có chắc muốn xóa lớp này không?')">
                            Xóa
                        </a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4" style="text-align:center;">Chưa có lớp học nào</td>
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