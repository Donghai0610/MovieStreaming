<%-- 
    Document   : login
    Created on : Oct 6, 2023, 3:21:19 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
        <title>Document</title>
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <body>
        <div id="form-content">
            <div class="form-background">
                <img src="./images/spider_man_login.jpg" alt="bg">
            </div>
            <div class="logo-wrapper">
                <a href="home" class="fixed-logo">
                    <img src="./images/logo-default.png" alt="logo-img">
                </a>
            </div>
            <c:set var="cookie" value="${pageContext.request.cookies}"/>
            <div class="form-wrapper mx-auto">
                <c:set var="a" value="${requestScope.error}"/>
                <c:if test="${a != null}">
                    <div class="login-fail show">
                        <h3>${requestScope.error}</h3>
                        <span><i class="fas fa-times"></i></span>
                    </div>
                </c:if>


                <form action="login" method="post">
                    <h1>Login</h1>



                    <div class="form-group">
                        <div class="form-control-wrapper">
                            <input type="text" name="username" class="form-control" id="username" value="${cookie.username.value}">
                            <label for="username">Username</label>
                        </div>
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group">
                        <div class="form-control-wrapper">
                            <input type="password" name="password" class="form-control" id="password" value="${cookie.password.value}">
                            <label for="password">Password</label>
                        </div>
                        <span class="form-message"></span>
                    </div>
                    <div class="other-wrapper d-flex justify-content-between">
                        <label class="keep-login" for="reminde-me">
                            Remind me
                            <input type="checkbox" ${(cookie.remindeme.value eq 'ON')?"checked":""} name="remindeme" id="reminde-me" value="ON">
                            <span class="checkmark"></span>
                        </label>
                        <!--                        <a href="changepassword">Forgot Password?</a>-->
                    </div>
                    <button type="submit" class="form-submit">Login</button>
                </form>
                <div class="link-to-rest">
                    <div id="my-signin2"><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9999/project/login&response_type=code
                                            &client_id=411328130477-8vhoendbq81hldifvbcvbpjrlvm2ituj.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
                    </div>
                    Don't have an account?
                    <a href="signup">Sign up</a>
                </div>
                <!-- them none de an hien the p thu 2 -->
                <div class="captcha-wrapper none">
                    <p>Trang này được Google reCAPTCHA bảo vệ để đảm bảo bạn không phải là robot.
                        <span>Tìm hiểu thêm.</span>
                    </p>
                    <p>Thông tin do Google reCAPTCHA thu thập sẽ tuân theo <span>Chính sách Quyền riêng tư</span> and <span>Điều khoản dịch vụ</span> của Google, và được dùng để cung cấp, duy trì và cải thiện dịch vụ reCAPTCHA cũng như các mục đích bảo mật nói chung (thông tin này không được dùng để cá nhân hóa quảng cáo của Google).</p>
                </div>
            </div>
        </div>
        <div id="page-footer">
            <div class="container">
                <div class="footer-content">
                    <img src="./images/logo-default.png" alt="logo-img">
                    <div class="icon-wrapper">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-pinterest-p"></i></a>
                        <a href="#"><i class="fab fa-vimeo-v"></i></a>
                        <a href="#"><i class="fab fa-google"></i></a>
                        <a href="#"><i class="fas fa-rss"></i></a>
                    </div>
                </div>
                <div class="footer-copyright">
                    <p>© 2022 All Rights Reserved. Terms of Use.</p>
                </div>
            </div>
        </div>
        <script>
            function onSuccess(googleUser) {
                console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
            }
            function onFailure(error) {
                console.log(error);
            }
            function renderButton() {
                gapi.signin2.render('my-signin2', {
                    'scope': 'profile email',
                    'width': 240,
                    'height': 50,
                    'longtitle': true,
                    'theme': 'dark',
                    'onsuccess': onSuccess,
                    'onfailure': onFailure
                });
            }
        </script>

        <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
        <script src="./js/script.js"></script>
        <script>
            //            handleLogin();
        </script>
    </body>
</html>
