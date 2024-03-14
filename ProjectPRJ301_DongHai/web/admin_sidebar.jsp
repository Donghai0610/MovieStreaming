<%-- 
    Document   : admin
    Created on : Oct 6, 2023, 3:19:38 PM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/all.css">
    </head>

    <body>


        <div class="admin-sidebar">
            <ul>
                <li class="main-side">
                    <h3>Main</h3>
                    <a href="admin-chart.jsp">
                        <i class="fas fa-home"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="movie-side">
                    <h3>Movie</h3>
                    <button>
                        <i class="fas fa-video"></i>
                        <span>Movie Manager</span>
                        <div class="direction-wrapper">
                            <i class="fas fa-angle-right"></i>
                            <i class="fas fa-angle-down"></i>
                        </div>
                    </button>
                    <ul class="dropdown-manager">
                        <li><a href="addmovie">
                                <i class="fas fa-caret-right"></i>
                                <span>Add movie</span>
                            </a></li>
                        <li><a href="movie">
                                <i class="fas fa-caret-right"></i>
                                <span>List movie</span>
                            </a></li>
                        <li><a href="addcategory">
                                <i class="fas fa-caret-right"></i>
                                <span>Add Gener</span>
                            </a></li>
                    </ul>
                </li>
                <li class="account-side">
                    <h3>Account</h3>
                    <button>
                        <i class="fas fa-user"></i>
                        <span>Account Manager</span>
                        <div class="direction-wrapper">
                            <i class="fas fa-angle-right"></i>
                            <i class="fas fa-angle-down"></i>
                        </div>
                    </button>
                    <ul class="dropdown-manager">
                        <li><a href="admin_account">
                                <i class="fas fa-caret-right"></i>
                                <span>Account Manager</span>
                            </a></li>
                        <!--                        <li><a href="admin-handleAcc.jsp">
                                                        <i class="fas fa-caret-right"></i>
                                                        <span>UnBlock account</span>
                                                    </a></li>-->
                    </ul>
                </li>
                <!--                <li class="other-side">
                                    <h3>Other</h3>
                                    <a href="#">
                                        <i class="fab fa-facebook-messenger"></i>
                                        <span>Message</span>
                                    </a>
                                </li>-->
            </ul>
        </div>





        <script src="./js/script.js"></script>
        <script>
            handleAll_Except_Login_SignOut();
            handleAdmin();
            handleSubmitAddMovie();
        </script>
    </body>

</html>
