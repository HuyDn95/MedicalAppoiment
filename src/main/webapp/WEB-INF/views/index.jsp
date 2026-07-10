<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
  <sec:authorize access="isAuthenticated()">
            <span style="margin-left:auto;">
                Xin chào, <sec:authentication property="principal.username"/>
                (<sec:authentication property="principal.authorities"/>)
            </span>
    <form action="${pageContext.request.contextPath}/logout" method="post" style="display:inline;">
      <button type="submit" class="btn-small">Đăng xuất</button>
    </form>
  </sec:authorize>
  <sec:authorize access="isAnonymous()">
    <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
    <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
  </sec:authorize>
</nav>
<div class="content">
  <p>Chào mừng bạn đến với hệ thống quản lý đặt lịch khám bệnh.</p>
  <sec:authorize access="hasAnyRole('ADMIN','RECEPTIONIST')">
    <a class="btn" href="${pageContext.request.contextPath}/appointments/new">+ Đặt lịch khám mới</a>
  </sec:authorize>
</div>
</body>
</html>
