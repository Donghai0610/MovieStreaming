<%-- 
    Document   : signup
    Created on : Oct 6, 2023, 3:22:17 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script type="text/javascript">

            // Function to check if the passwords match
            function checkPassword() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("password-confirmation").value;
                var formMessage = document.querySelector('.form-message');

                if (password === confirmPassword) {
                    // Passwords match, clear any previous error message
                    formMessage.textContent = "";
                } else {
                    // Passwords don't match, display an error message
                    formMessage.textContent = "Passwords do not match!";
                    formMessage.style.color = "red";
                }
            }

            // Attach the checkPassword function to the input fields' onchange event
            document.getElementById("password").addEventListener("change", checkPassword);
            document.getElementById("password-confirmation").addEventListener("change", checkPassword);


        </script>
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
            <div class="form-wrapper mx-auto">
                <form action="signup" method="post">
                    <h1>Sign up</h1>
                    <!--                     <div class="form-group">
                                            <div class="form-control-wrapper">
                                                <input type="text" name="fullname" class="form-control" id="fullname">
                                                <label for="fullname">Email</label>
                                            </div>
                                            <span class="form-message"></span>
                                        </div> -->

                    <div class="form-group">
                        <div class="form-control-wrapper">
                            <input type="text" name="username" class="form-control" id="username">
                            <label for="username">Username</label>
                        </div>
                        <span>${requestScope.error}</span>
                    </div>

                    <div class="form-group">
                        <div class="form-control-wrapper">
                            <input type="password" name="password" class="form-control" id="password" />
                            <label for="password">Password</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-control-wrapper">
                            <input type="password" name="password_confirmation" 
                                   class="form-control" id="password-confirmation" onchange="checkPassword()">
                            <label for="password_confirmation">Confirm Password</label>
                        </div>
                        <span class="form-message"></span>
                    </div>
                    <button class="form-submit">Login</button>
                    <div class="other-wrapper d-flex justify-content-between">
                        <label class="keep-login" for="agree-policy">
                            I agree with Terms of Service.
                            <input type="checkbox" name="agree-policy" id="agree-policy">
                            <span class="checkmark"></span>
                            <p class="agree-error"></p>
                        </label>

                    </div>
                </form>
                <div class="link-to-rest">
                    Already a Member?
                    <a href="login">Go to login</a>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script src="./js/script.js"></script>
        <script>
                                       handleSignUp();
        </script>
    </body>
</html>
