<%@ page import="com.student.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User loginUser = (User) session.getAttribute("user");

    String username = "";
    String role = "";
    String greeting = "Xin chào";

    if (loginUser != null) {
        username = loginUser.getUsername();
        role = loginUser.getRole();

        if ("ADMIN".equalsIgnoreCase(role)) {
            greeting = "Xin chào quản trị viên";
        } else if ("STUDENT".equalsIgnoreCase(role)) {
            greeting = "Xin chào " + username;
        } else if ("TEACHER".equalsIgnoreCase(role)) {
            greeting = "Xin chào giảng viên";
        } else {
            greeting = "Xin chào " + username;
        }
    }

    String active = request.getParameter("active");
    if (active == null) active = "";
%>

<div class="sidebar">
    <div class="logo">Student Manager</div>

    <div class="user-box">
        <div class="avatar">
            <%= username != null && !username.isEmpty() ? username.substring(0, 1).toUpperCase() : "U" %>
        </div>

        <div>
            <div class="user-greeting"><%= greeting %></div>
            <div class="user-role"><%= role %></div>
        </div>
    </div>

    <div class="menu">
        <a class="<%= "dashboard".equals(active) ? "active" : "" %>" href="dashboard.jsp">
            Dashboard
        </a>

        <a class="<%= "students".equals(active) ? "active" : "" %>" href="students">
            Quản lý sinh viên
        </a>

        <a class="<%= "classes".equals(active) ? "active" : "" %>" href="classes">
            Quản lý lớp học
        </a>

        <a class="logout-menu"
           href="logout"
           onclick="return confirm('Bạn có chắc chắn muốn đăng xuất không?')">
            Đăng xuất
        </a>
    </div>
</div>
