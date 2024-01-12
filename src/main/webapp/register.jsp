<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<link rel="stylesheet" href="css/register.css">
<%@include file="component/allcss.jsp" %>


</head>
<body>
	<div id="wrapper">
        <div id="header">
            <a class="name" href="index.jsp">
                <font color=#FFD700>
                    <img src="http://localhost:8080/projectwebtrangsuc/asesst/logo-t.png" alt="">
                </font>
            </a>
        </div>
        <main class="main">
            <div class="contenttive">
            
           
               

                <form id="signup" class="form-signup" action="registerController" method="POST"
                    autocomplete="off">

                    <br>
                    <h1 class="h3 mb-3 font-weight-normal text-center">Nhập thông tin đăng ký</h1>


                    <div class="form-group">
                        
                        <input type="text" class="form-control" placeholder="Tài khoản" required="" name="username"
                            value="">
                    </div>
                    <div class="form-group">
                       
                        <input type="text" class="form-control" placeholder="Email" required="" name="email" value=""
                            >
                    </div>

                    <div class="form-group">
                        
                        <input type="password" class="form-control" placeholder="Mật khẩu" required="" name="password">
                    </div>
                    <div class="form-group">
                       
                        <input type="password" class="form-control" placeholder="Nhập Lại Mật khẩu" required=""
                            name="repassword">
                    </div>
                    



                   <div class="button-register text-center">
                    <button name="register" type="submit" class="btn btn-info btn-block">Đăng ký</button>
                   </div>
                   
                   
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <script type="text/javascript">
   
    function showToast(message, type) {
    	
        Toastify({
            text: message,
            duration: 3000, // Hiển thị toast trong 3 giây
            close: true,
            gravity: "top", // Hiển thị ở phía dưới
            position: "right", // Hiển thị ở phía bên phải
            backgroundColor: type === 'error' ? '#ff0000' : '#00ff00', // Màu nền
        }).showToast();
    }

                   </script>
                   <script type="text/javascript">
                   var error = '<%= request.getAttribute("error") %>';
                   if (error && error.trim() !== 'null' && error.trim() !== '') {
                       showToast(error, 'error');
                   }
                   var success = '<%= request.getAttribute("success") %>';
                   if (success && success.trim() !== 'null' && success.trim() !== '') {
                       showToast(success, 'success');
                   }
                   
                   
                   </script>
                    <div class="text-center pt-2">
                        Bạn đã có tài khoản? <a href="login">Đăng nhập ngay</a>
                    </div>
                </form>
        </main>
	
</body>
</html>