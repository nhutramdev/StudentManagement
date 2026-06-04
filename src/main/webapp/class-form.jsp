<%@ page import="com.student.model.ClassRoom" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ClassRoom classRoom = (ClassRoom) request.getAttribute("classRoom");
    boolean isEdit = classRoom != null;
%>

<html>
<head>
    <title><%= isEdit ? "Sửa lớp học" : "Thêm lớp học" %></title>
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
            <h2><%= isEdit ? "Sửa lớp học" : "Thêm lớp học" %></h2>
        </div>

        <div class="content">

            <div class="form-box">
                <form action="classes" method="post">

                    <input type="hidden" name="action" value="<%= isEdit ? "update" : "insert" %>">

                    <% if (isEdit) { %>
                    <input type="hidden" name="id" value="<%= classRoom.getId() %>">
                    <% } %>

                    <label>Tên lớp học</label>
                    <input type="text" name="className" required
                           value="<%= isEdit ? classRoom.getClassName() : "" %>"
                           placeholder="Ví dụ: CNTT K25">

                    <button class="btn btn-green" type="submit">Lưu</button>
                    <a class="btn btn-gray" href="classes">Quay lại</a>

                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>