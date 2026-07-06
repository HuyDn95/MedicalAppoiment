<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hệ thống đặt lịch khám bệnh</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="header">
    <h1>Hệ thống đặt lịch khám bệnh</h1>
</div>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/appointments">Lịch hẹn</a>
    <a href="${pageContext.request.contextPath}/doctors">Bác sĩ</a>
    <a href="${pageContext.request.contextPath}/patients">Bệnh nhân</a>
</nav>
<div class="content">
    <p>Chào mừng bạn đến với hệ thống quản lý đặt lịch khám bệnh.</p>
    <a class="btn" href="${pageContext.request.contextPath}/appointments/new">+ Đặt lịch khám mới</a>
</div>
</body>
</html>
