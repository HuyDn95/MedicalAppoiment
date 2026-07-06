<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách bệnh nhân</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="header"><h1>Danh sách bệnh nhân</h1></div>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/">Trang chủ</a>
    <a href="${pageContext.request.contextPath}/patients/new">+ Thêm bệnh nhân</a>
</nav>
<div class="content">
    <table class="data-table">
        <thead>
        <tr>
            <th>ID</th><th>Họ tên</th><th>SĐT</th><th>Email</th><th>Ngày sinh</th><th>Giới tính</th><th>Địa chỉ</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${patients}">
            <tr>
                <td>${p.id}</td>
                <td>${p.fullName}</td>
                <td>${p.phoneNumber}</td>
                <td>${p.email}</td>
                <td>${p.dateOfBirth}</td>
                <td>${p.gender}</td>
                <td>${p.address}</td>
            </tr>
        </c:forEach>
        <c:if test="${empty patients}">
            <tr><td colspan="7">Chưa có bệnh nhân nào.</td></tr>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>
