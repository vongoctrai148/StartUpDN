
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link rel="stylesheet" href="fontawesome-free-5.15.4-web/css/all.css">
    <link rel="stylesheet" href="css/customLogin.css">
    <title>Login</title>
</head>
<body>
    <div class="container">
        <a class="d-block" href="/startup/listProject">
            <img loading="lazy" src="/images/projectImages/logodanang.png" style="width: 70px; height: 70px" alt="StartupDN">
            Trang chủ
        </a>
        <div class="d-flex justify-content-center h-100">
            <div class="card">

                <div class="card-body">
                    <form:form action="/login" modelAttribute="loginForm" method="POST" style=" color: white" class="form">
                        <h1>Đăng nhập</h1>
                        <p style="color: #fff425; ">${message}</p>
                        <div class="form-group">
                            <label for="username">Tài khoản</label>
                            <form:input path="username"  class="form-control" id="username" placeholder="Nhập tài khoản"/>
                            <form:errors path="username"/>
                        </div>
                        <div class="form-group">
                            <label for="password">Mật khẩu</label>
                            <form:password path="password" class="form-control" id="password" placeholder="Nhập mật khẩu"/>
                            <form:errors path="password"/>
                        </div>
                        <button type="submit" class="btn btn-primary">Đăng nhập</button>
                        <div class="form-group" style="margin-top: 2%">
                            <label>Bạn chưa có tài khoản?</label>
                            <br>
                            <a href="/register" class="register">Đăng ký ngay ở đây!</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>