<%-- 
    Document   : my-info
    Created on : Oct 6, 2023, 3:28:25 PM
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
        <c:set var="a" value="${sessionScope.account}"/>
        <div id="page-my-info-change-password-box">
            <div class="container">

                <h2>Your Information</h2>
                <div class="form-wrapper">
                    <form action="changeprofile" method="post"  enctype="multipart/form-data">
                        <div class="PMI-wrapper">
                            <img src="${a.avatar}" alt="">
                            <label for="avatar">
                                <div class="change-avatar">
                                    <i class="fas fa-camera"></i>
                                </div>
                                <input type="file" name="avatar" id="avatar">
                            </label>
                        </div>
                        <div class="PMI-wrapper">
                            <label for="username">User Name</label>
                            <input readonly type="text" name="username" value="${a.user}" id="username">
                        </div>
                        <div class="PMI-wrapper">
                            <label for="password">PASS WORD</label>
                            <input readonly type="password" name="password" value="${a.password}" id="password">
                        </div>
                        <div class="PMI-wrapper">
                            <label for="fullname">Full Name</label>
                            <input type="text" name="fullname" value="${a.fullname}" id="fullname">
                        </div>
                        <div class="PMI-wrapper">
                            <label for="email">Email</label>
                            <input type="text" name="email" value="${a.email}" id="email">
                        </div>
                        <div class="PMI-wrapper">
                            <label for="phone">Phone Number</label>
                            <input type="text" name="phone" value="${a.phonenum}" id="phone">
                        </div>


                        <!--                        <div class="PMI-wrapper">
                                                    <div class="money-wrapper">
                                                        <label for="money">Account Money</label>
                                                        <a href="#">Earn more money</a>
                                                    </div>
                                                    <input type="text" name="money" value="$500.00" id="money" readonly>
                                                </div>-->
                        <h2>${requestScope.ms2}</h2>
                        <button  class="btn btn-block "type="submit" onclick="this.form.submit()">SAVE</button>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script src="./js/script.js"></script>
        <script>
                            handleAll_Except_Login_SignOut();
                            handleMyInfo();
        </script>
    </body>

</html>