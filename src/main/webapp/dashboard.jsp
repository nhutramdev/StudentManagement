<%@ page import="com.student.model.User" %>
<%@ page import="com.student.util.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int totalStudents = 0;
    int totalClasses = 0;
    int totalUsers = 0;

    try {
        Connection conn = DBConnection.getConnection();
        Statement st = conn.createStatement();

        ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM students");
        if (rs1.next()) totalStudents = rs1.getInt(1);

        ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM classes");
        if (rs2.next()) totalClasses = rs2.getInt(1);

        ResultSet rs3 = st.executeQuery("SELECT COUNT(*) FROM users");
        if (rs3.next()) totalUsers = rs3.getInt(1);

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="layout">

    <jsp:include page="/WEB-INF/layout/sidebar.jsp">
        <jsp:param name="active" value="dashboard"/>
    </jsp:include>

    <div class="main">

        <div class="top-header">
            <h2>Hệ thống quản lý sinh viên</h2>
        </div>

        <div class="content">

            <div class="card-grid">
                <div class="stat-card">
                    <h3>Tổng sinh viên</h3>
                    <p><%= totalStudents %></p>
                </div>

                <div class="stat-card">
                    <h3>Tổng lớp học</h3>
                    <p><%= totalClasses %></p>
                </div>

                <div class="stat-card">
                    <h3>Tài khoản</h3>
                    <p><%= totalUsers %></p>
                </div>

                <div class="stat-card">
                    <h3>Vai trò</h3>
                    <p><%= user.getRole() %></p>
                </div>
            </div>

            <div class="panel">
                <h3>Chức năng nhanh</h3>
                <p>Chọn chức năng bên dưới để quản lý hệ thống.</p>

                <a class="btn btn-green" href="students">Quản lý sinh viên</a>
                <a class="btn" href="classes">Quản lý lớp học</a>

                <a class="btn btn-red"
                   href="logout"
                   onclick="return confirm('Bạn có chắc chắn muốn đăng xuất không?')">
                    Đăng xuất
                </a>
            </div>

        </div>
    </div>

</div>

</body>
</html>