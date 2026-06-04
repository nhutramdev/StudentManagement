<%@ page import="com.student.model.ClassRoom" %>
<%@ page import="com.student.model.Score" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ClassRoom classRoom = (ClassRoom) request.getAttribute("classRoom");
    List<Score> scores = (List<Score>) request.getAttribute("scores");
%>

<html>
<head>
    <title>Bảng điểm lớp</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="layout">

    <jsp:include page="/WEB-INF/layout/sidebar.jsp">
        <jsp:param name="active" value="classes"/>
    </jsp:include>

    <div class="main">

        <div class="top-header">
            <a class="back-mini" href="classes?action=detail&id=<%= classRoom.getId() %>">‹</a>
            <h2>Bảng điểm lớp <%= classRoom.getClassName() %></h2>
        </div>

        <div class="content">

            <table class="table">
                <tr>
                    <th>Mã SV</th>
                    <th>Họ tên</th>
                    <th>Môn học</th>
                    <th>Quá trình</th>
                    <th>Giữa kỳ</th>
                    <th>Cuối kỳ</th>
                    <th>Trung bình</th>
                    <th>Ghi chú</th>
                </tr>

                <%
                    if (scores != null && !scores.isEmpty()) {
                        for (Score s : scores) {
                %>
                <tr>
                    <td><%= s.getStudentCode() %></td>
                    <td><%= s.getFullName() %></td>
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
                    <td colspan="8" style="text-align:center;">Lớp này chưa có dữ liệu điểm</td>
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