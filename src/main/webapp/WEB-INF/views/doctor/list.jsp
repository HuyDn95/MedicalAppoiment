<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Danh sách bác sĩ</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="header"><h1>Danh sách bác sĩ</h1></div>
<nav class="navbar">
  <a href="${pageContext.request.contextPath}/">Trang chủ</a>
  <a href="${pageContext.request.contextPath}/doctors/new">+ Thêm bác sĩ</a>
</nav>
<div class="content">
  <table class="data-table">
    <thead>
    <tr>
      <th>ID</th><th>Họ tên</th><th>Chuyên khoa</th><th>SĐT</th><th>Email</th><th>Phòng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="doc" items="${doctors}">
      <tr>
        <td>${doc.id}</td>
        <td>${doc.fullName}</td>
        <td>${doc.specialization}</td>
        <td>${doc.phoneNumber}</td>
        <td>${doc.email}</td>
        <td>${doc.roomNumber}</td>
      </tr>
    </c:forEach>
    <c:if test="${empty doctors}">
      <tr><td colspan="6">Chưa có bác sĩ nào.</td></tr>
    </c:if>
    </tbody>
  </table>
</div>
</body>
</html>
