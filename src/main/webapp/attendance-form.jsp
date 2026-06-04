<%@ page import="com.student.model.Student" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Student student = (Student) request.getAttribute("student");
%>

<html>
<head>
    <title>Điểm danh sinh viên</title>
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
            <h2>Điểm danh sinh viên</h2>
        </div>

        <div class="content">

            <div class="form-box">
                <form action="students" method="post">

                    <input type="hidden" name="action" value="saveAttendance">
                    <input type="hidden" name="studentId" value="<%= student.getId() %>">

                    <p><b>Sinh viên:</b> <%= student.getFullName() %></p>
                    <p><b>Mã sinh viên:</b> <%= student.getStudentCode() %></p>

                    <label>Ngày điểm danh</label>
                    <input type="date" name="attendanceDate" required value="<%= LocalDate.now() %>">

                    <label>Trạng thái</label>
                    <select name="status" required>
                        <option value="Có mặt">Có mặt</option>
                        <option value="Vắng">Vắng</option>
                        <option value="Muộn">Muộn</option>
                        <option value="Có phép">Có phép</option>
                    </select>

                    <label>Ghi chú</label>
                    <input type="text" name="note" placeholder="Nhập ghi chú nếu có">

                    <button class="btn btn-green" type="submit">Lưu điểm danh</button>
                    <a class="btn btn-gray" href="students?action=detail&id=<%= student.getId() %>">Quay lại</a>

                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>