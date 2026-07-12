<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách lịch hẹn</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="header"><h1>Danh sách lịch hẹn</h1></div>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/">Trang chủ</a>
    <a href="${pageContext.request.contextPath}/appointments/new">+ Đặt lịch mới</a>
</nav>
<div class="content">
    <table class="data-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Bệnh nhân</th>
            <th>Bác sĩ</th>
            <th>Thời gian khám</th>
            <th>Lý do</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="appt" items="${appointments}">
            <tr>
                <td>${appt.id}</td>
                <td>${appt.patient.fullName}</td>
                <td>${appt.doctor.fullName}</td>
                <td>${appt.appointmentTime.dayOfMonth}/${appt.appointmentTime.monthValue}/${appt.appointmentTime.year} ${appt.appointmentTime.hour}:${appt.appointmentTime.minute}</td>
                <td>${appt.reason}</td>
                <td><span class="status-${appt.status}">${appt.status}</span></td>
                <td>
                    <form action="${pageContext.request.contextPath}/appointments/${appt.id}/confirm" method="post" style="display:inline;">
                        <button type="submit" class="btn-small">Xác nhận</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/appointments/${appt.id}/cancel" method="post" style="display:inline;">
                        <button type="submit" class="btn-small btn-danger">Hủy</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty appointments}">
            <tr><td colspan="7">Chưa có lịch hẹn nào.</td></tr>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>
