<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Đăng ký tài khoản</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="header"><h1>Đăng ký tài khoản</h1></div>
<nav class="navbar">
  <a href="${pageContext.request.contextPath}/login">Đã có tài khoản? Đăng nhập</a>
</nav>
<div class="content">
  <form action="${pageContext.request.contextPath}/register" method="post" class="form-box">
    <c:if test="${not empty errors}">
      <div class="alert-error">
        <c:forEach var="err" items="${errors}">
          <p>${err}</p>
        </c:forEach>
      </div>
    </c:if>
    <div class="form-group">
      <label>Họ tên</label>
      <input type="text" name="fullName" value="${registerRequest.fullName}" required />
    </div>
    <div class="form-group">
      <label>Tên đăng nhập</label>
      <input type="text" name="username" value="${registerRequest.username}" required />
    </div>
    <div class="form-group">
      <label>Mật khẩu</label>
      <input type="password" name="password" required />
    </div>
    <div class="form-group">
      <label>Xác nhận mật khẩu</label>
      <input type="password" name="confirmPassword" required />
    </div>
    <button type="submit" class="btn">Đăng ký</button>
  </form>
</div>
</body>
</html>
