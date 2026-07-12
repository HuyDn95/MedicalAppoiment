<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="header"><h1>Đăng nhập hệ thống</h1></div>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/register">Chưa có tài khoản? Đăng ký</a>
</nav>
<div class="content">
    <form action="${pageContext.request.contextPath}/login" method="post" class="form-box">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <c:if test="${param.error != null}">
            <div class="alert-error"><p>Sai tên đăng nhập hoặc mật khẩu.</p></div>
        </c:if>
        <c:if test="${param.registered != null}">
            <div class="alert-success"><p>Đăng ký thành công! Vui lòng đăng nhập.</p></div>
        </c:if>
        <c:if test="${param.logout != null}">
            <div class="alert-success"><p>Bạn đã đăng xuất.</p></div>
        </c:if>
        <div class="form-group">
            <label>Tên đăng nhập</label>
            <input type="text" name="username" required />
        </div>
        <div class="form-group">
            <label>Mật khẩu</label>
            <input type="password" name="password" required />
        </div>
        <button type="submit" class="btn">Đăng nhập</button>
    </form>
</div>
</body>
</html>
