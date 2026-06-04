<%@ page import="com.student.model.Student" %>
<%@ page import="com.student.model.Attendance" %>
<%@ page import="com.student.model.Score" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Student student = (Student) request.getAttribute("student");
    List<Attendance> attendanceList = (List<Attendance>) request.getAttribute("attendanceList");
    List<Score> scoreList = (List<Score>) request.getAttribute("scoreList");
%>

<html>
<head>
    <title>Chi tiết sinh viên</title>
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
            <h2>Chi tiết sinh viên</h2>
        </div>

        <div class="content">

            <div class="panel">
                <h3>Thông tin sinh viên</h3>

                <p><b>Mã sinh viên:</b> <%= student.getStudentCode() %></p>
                <p><b>Họ tên:</b> <%= student.getFullName() %></p>
                <p><b>Giới tính:</b> <%= student.getGender() %></p>
                <p><b>Email:</b> <%= student.getEmail() %></p>
                <p><b>Số điện thoại:</b> <%= student.getPhone() %></p>
                <p><b>Lớp:</b> <%= student.getClassName() != null ? student.getClassName() : "Chưa có lớp" %></p>

                <a class="btn btn-green" href="students?action=attendance&id=<%= student.getId() %>">Điểm danh</a>
                <a class="btn" href="students?action=score&id=<%= student.getId() %>">Thêm điểm</a>
                <a class="btn btn-orange" href="students?action=edit&id=<%= student.getId() %>">Sửa thông tin</a>
            </div>

            <br>

            <div class="panel">
                <h3>Lịch sử điểm danh</h3>

                <table class="table">
                    <tr>
                        <th>Ngày</th>
                        <th>Trạng thái</th>
                        <th>Ghi chú</th>
                    </tr>

                    <%
                        if (attendanceList != null && !attendanceList.isEmpty()) {
                            for (Attendance a : attendanceList) {
                    %>
                    <tr>
                        <td><%= a.getAttendanceDate() %></td>
                        <td><%= a.getStatus() %></td>
                        <td><%= a.getNote() != null ? a.getNote() : "" %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="3" style="text-align:center;">Chưa có dữ liệu điểm danh</td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>

            <br>

            <div class="panel">
                <h3>Bảng điểm cá nhân</h3>

                <table class="table">
                    <tr>
                        <th>Môn học</th>
                        <th>Quá trình</th>
                        <th>Giữa kỳ</th>
                        <th>Cuối kỳ</th>
                        <th>Trung bình</th>
                        <th>Ghi chú</th>
                    </tr>

                    <%
                        if (scoreList != null && !scoreList.isEmpty()) {
                            for (Score s : scoreList) {
                    %>
                    <tr>
                        <td><%= s.getSubjectName() %></td>
                        <td><%= s.getProcessScore() %></td>
                        <td><%= s.getMidtermScore() %></td>
                        <td><%= s.getFinalScore() %></td>
                        <td><b><%= String.format("%.2f", s.getAverageScore()) %></b></td>
                        <td><%= s.getNote() != null ? s.getNote() : "" %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6" style="text-align:center;">Chưa có điểm</td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>

        </div>
    </div>
</div>

</body>
</html>