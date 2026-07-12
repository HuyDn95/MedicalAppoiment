<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Đặt lịch khám</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="header"><h1>Đặt lịch khám mới</h1></div>
<nav class="navbar">
  <a href="${pageContext.request.contextPath}/appointments">Danh sách lịch hẹn</a>
</nav>
<div class="content">
  <form action="${pageContext.request.contextPath}/appointments/book" method="post" class="form-box">
    <div class="form-group">
      <label>ID Bệnh nhân</label>
      <input type="number" name="patientId" required />
    </div>
    <div class="form-group">
      <label>ID Bác sĩ</label>
      <input type="number" name="doctorId" required />
    </div>
    <div class="form-group">
      <label>Thời gian khám (yyyy-MM-ddTHH:mm)</label>
      <input type="datetime-local" name="appointmentTime" required />
    </div>
    <div class="form-group">
      <label>Lý do khám</label>
      <textarea name="reason" rows="3"></textarea>
    </div>
    <button type="submit" class="btn">Đặt lịch</button>
  </form>
</div>
</body>
</html>
