<%@ page import="com.student.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Student student = (Student) request.getAttribute("student");
%>

<html>
<head>
    <title>Thêm điểm sinh viên</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="layout">

    <jsp:include page="/WEB-INF/layout/sidebar.jsp">
        <jsp:param name="active" value="students"/>
    </jsp:include>

    <div class="main">

        <div class="top-header">
            <a class="back-mini" href="students?action=detail&id=<%= student.getId() %>">‹</a>
            <h2>Thêm điểm sinh viên</h2>
        </div>

        <div class="content">

            <div class="form-box">
                <form action="students" method="post">

                    <input type="hidden" name="action" value="saveScore">
                    <input type="hidden" name="studentId" value="<%= student.getId() %>">

                    <p><b>Sinh viên:</b> <%= student.getFullName() %></p>
                    <p><b>Mã sinh viên:</b> <%= student.getStudentCode() %></p>

                    <label>Tên môn học</label>
                    <input type="text" name="subjectName" required placeholder="Ví dụ: Java Web">

                    <label>Điểm quá trình</label>
                    <input type="number" step="0.1" min="0" max="10" name="processScore" required>

                    <label>Điểm giữa kỳ</label>
                    <input type="number" step="0.1" min="0" max="10" name="midtermScore" required>

                    <label>Điểm cuối kỳ</label>
                    <input type="number" step="0.1" min="0" max="10" name="finalScore" required>

                    <label>Ghi chú</label>
                    <input type="text" name="note" placeholder="Nhập ghi chú nếu có">

                    <button class="btn btn-green" type="submit">Lưu điểm</button>
                    <a class="btn btn-gray" href="students?action=detail&id=<%= student.getId() %>">Quay lại</a>

                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>