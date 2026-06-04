<%@ page import="com.student.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Student student = (Student) request.getAttribute("student");
    boolean isEdit = student != null;
%>

<html>
<head>
    <title><%= isEdit ? "Sửa sinh viên" : "Thêm sinh viên" %></title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
        }

        .header {
            background: #1976d2;
            color: white;
            padding: 18px 30px;
        }

        .container {
            padding: 30px;
        }

        .form-box {
            background: white;
            width: 520px;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0,0,0,0.15);
        }

        label {
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 8px 0 18px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn {
            text-decoration: none;
            color: white;
            background: #1976d2;
            padding: 10px 16px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
        }

        .btn-back {
            background: #546e7a;
        }
    </style>
</head>
<body>

<div class="header">
    <h2><%= isEdit ? "Sửa sinh viên" : "Thêm sinh viên" %></h2>
</div>

<div class="container">
    <div class="form-box">

        <form action="students" method="post">

            <input type="hidden" name="action" value="<%= isEdit ? "update" : "insert" %>">

            <% if (isEdit) { %>
                <input type="hidden" name="id" value="<%= student.getId() %>">
            <% } %>

            <label>Mã sinh viên</label>
            <input type="text" name="studentCode" required
                   value="<%= isEdit ? student.getStudentCode() : "" %>">

            <label>Họ tên</label>
            <input type="text" name="fullName" required
                   value="<%= isEdit ? student.getFullName() : "" %>">

            <label>Giới tính</label>
            <select name="gender">
                <option value="Nam" <%= isEdit && "Nam".equals(student.getGender()) ? "selected" : "" %>>Nam</option>
                <option value="Nữ" <%= isEdit && "Nữ".equals(student.getGender()) ? "selected" : "" %>>Nữ</option>
            </select>

            <label>Email</label>
            <input type="email" name="email"
                   value="<%= isEdit ? student.getEmail() : "" %>">

            <label>Số điện thoại</label>
            <input type="text" name="phone"
                   value="<%= isEdit ? student.getPhone() : "" %>">

            <label>ID lớp</label>
            <input type="number" name="classId" placeholder="Ví dụ: 1, 2, 3"
                   value="<%= isEdit ? student.getClassId() : "" %>">

            <button class="btn" type="submit">Lưu</button>
            <a class="btn btn-back" href="students">Quay lại</a>

        </form>

    </div>
</div>
<%@ page import="com.student.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Student student = (Student) request.getAttribute("student");
    boolean isEdit = student != null;
%>

<html>
<head>
    <title><%= isEdit ? "Sửa sinh viên" : "Thêm sinh viên" %></title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="layout">

    <jsp:include page="/WEB-INF/layout/sidebar.jsp">
        <jsp:param name="active" value="students"/>
    </jsp:include>

    <div class="main">

        <div class="top-header">
            <a class="back-mini" href="students">‹</a>
            <h2><%= isEdit ? "Sửa sinh viên" : "Thêm sinh viên" %></h2>
        </div>

        <div class="content">

            <div class="form-box">
                <form action="students" method="post">

                    <input type="hidden" name="action" value="<%= isEdit ? "update" : "insert" %>">

                    <% if (isEdit) { %>
                    <input type="hidden" name="id" value="<%= student.getId() %>">
                    <% } %>

                    <label>Mã sinh viên</label>
                    <input type="text" name="studentCode" required
                           value="<%= isEdit ? student.getStudentCode() : "" %>">

                    <label>Họ tên</label>
                    <input type="text" name="fullName" required
                           value="<%= isEdit ? student.getFullName() : "" %>">

                    <label>Giới tính</label>
                    <select name="gender">
                        <option value="Nam" <%= isEdit && "Nam".equals(student.getGender()) ? "selected" : "" %>>Nam</option>
                        <option value="Nữ" <%= isEdit && "Nữ".equals(student.getGender()) ? "selected" : "" %>>Nữ</option>
                    </select>

                    <label>Email</label>
                    <input type="email" name="email"
                           value="<%= isEdit ? student.getEmail() : "" %>">

                    <label>Số điện thoại</label>
                    <input type="text" name="phone"
                           value="<%= isEdit ? student.getPhone() : "" %>">

                    <label>ID lớp</label>
                    <input type="number" name="classId" placeholder="Ví dụ: 1, 2, 3"
                           value="<%= isEdit ? student.getClassId() : "" %>">

                    <button class="btn btn-green" type="submit">Lưu</button>
                    <a class="btn btn-gray" href="students">Quay lại</a>

                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>
</body>
</html>