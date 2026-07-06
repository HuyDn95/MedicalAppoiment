<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Thêm bác sĩ</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="header"><h1>Thêm bác sĩ mới</h1></div>
<nav class="navbar">
  <a href="${pageContext.request.contextPath}/doctors">Danh sách bác sĩ</a>
</nav>
<div class="content">
  <form action="${pageContext.request.contextPath}/doctors/save" method="post" class="form-box">
    <div class="form-group">
      <label>Họ tên</label>
      <input type="text" name="fullName" required />
    </div>
    <div class="form-group">
      <label>Chuyên khoa</label>
      <input type="text" name="specialization" />
    </div>
    <div class="form-group">
      <label>Số điện thoại</label>
      <input type="text" name="phoneNumber" />
    </div>
    <div class="form-group">
      <label>Email</label>
      <input type="email" name="email" />
    </div>
    <div class="form-group">
      <label>Số phòng</label>
      <input type="text" name="roomNumber" />
    </div>
    <button type="submit" class="btn">Lưu</button>
  </form>
</div>
</body>
</html>
