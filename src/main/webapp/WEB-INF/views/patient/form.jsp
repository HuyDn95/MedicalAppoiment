<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm bệnh nhân</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="header"><h1>Thêm bệnh nhân mới</h1></div>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/patients">Danh sách bệnh nhân</a>
</nav>
<div class="content">
    <form action="${pageContext.request.contextPath}/patients/save" method="post" class="form-box">
        <div class="form-group">
            <label>Họ tên</label>
            <input type="text" name="fullName" required />
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
            <label>Ngày sinh</label>
            <input type="date" name="dateOfBirth" />
        </div>
        <div class="form-group">
            <label>Giới tính</label>
            <select name="gender">
                <option value="Nam">Nam</option>
                <option value="Nữ">Nữ</option>
            </select>
        </div>
        <div class="form-group">
            <label>Địa chỉ</label>
            <input type="text" name="address" />
        </div>
        <button type="submit" class="btn">Lưu</button>
    </form>
</div>
</body>
</html>
