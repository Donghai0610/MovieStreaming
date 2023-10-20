<%-- 
    Document   : change_password
    Created on : Oct 6, 2023, 3:25:31 PM
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
        <title>Document</title>
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="./js/jquery-3.6.0.min.js"></script>
        <script src="./js/bootstrap.bundle.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div id="page-my-info-change-password-box">
            <div class="container">
                <h2>Change password</h2>

                <div class="form-wrapper">
                    <c:set var="a" value="${requestScope.error}"/>
                    <c:if test="${a != null}">
                        <div class="error__mess-wrapper">
                            <span>${requestScope.error}</span>
                            <i class="fas fa-times" onclick="document.querySelector('.error__mess-wrapper').style.display = 'none';"></i>
                        </div>
                    </c:if>
                    <c:set var="a" value="${sessionScope.account}"/>
                    <%--<c:set var="change" value="${sessionScope.change}"/>--%>
                    <form action="changepassword" method="post">
                        <div class="PMI-wrapper">
                            <label for="username">UserName</label>
                            <input readonly type="text" name="username" value="${a.user}" id="username">
                        </div>
                        <div class="PMI-wrapper">
                            <label for="oldPassword">Old Password</label>
                            <input type="password" name="oldPassword" value="" id="oldPassword">
                        </div>
                        <div class="PMI-wrapper">
                            <label for="newPassword">New Password</label>
                            <input type="password" name="newPassword" value="" id="newPassword">
                        </div>
                        <div class="PMI-wrapper">
                            <label for="cfNewPassword">Confirm New Password</label>
                            <input type="password" name="cfNewPassword" value="" id="cfNewPassword">
                            <span class="form-message"></span>
                        </div>
                        <br/>
                        <input type="submit" value="Save">
                    </form>
                    <h3>${requestScope.ms2}</h3>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script src="./js/script.js"></script>
        <script>
                                handleAll_Except_Login_SignOut();
                                handleChangePassword();
                                function checkPassword() {
                                    var password = document.getElementById("newPassword").value;
                                    var confirmPassword = document.getElementById("cfNewPassword").value;
                                    var formMessage = document.querySelector('.form-message');

                                    if (password === confirmPassword) {
                                        // Passwords match, clear any previous error message
                                        formMessage.textContent = "";
                                    } else {
                                        // Passwords don't match, display an error message
                                        formMessage.textContent = "New Passwords do not match!";
                                        formMessage.style.color = "red";
                                    }
                                }

                                // Attach the checkPassword function to the input fields' onchange event
                                document.getElementById("newPassword").addEventListener("change", checkPassword);
                                document.getElementById("cfNewPassword").addEventListener("change", checkPassword);

        </script>
    </body>

</html>