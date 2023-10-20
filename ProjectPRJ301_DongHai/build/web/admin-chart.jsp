<%-- 
    Document   : admin-chart
    Created on : Oct 6, 2023, 3:22:54 PM
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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="./css/all.css">
    </head>

    <body>
        <div id="page-heading">
            <!-- them onactive + bo container de thay doi size cua header -->
            <nav class="navbar navbar-expand-sm navbar-dark onactive">
                <a class="navbar-brand" href="#">
                    <img src="./images/logo-default.png" alt="Logo" style="width:164px; height: 47px;">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <!-- them d-flex justify-content-between nav-width de tao khoang cach khi login-->
                    <ul class="navbar-nav ml-auto d-flex justify-content-between nav-width" id="collapsibleNavbar">
                        <div class="const-component-wrapper d-flex">
                            <li class="nav-item active">
                                <a class="nav-link" href="./home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="./movie.jsp">Movies</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">About us</a>
                            </li>
                            <!-- them not-admin de an link nay -->
                            <li class="nav-item not-admin">
                                <a class="nav-link" href="#">Admin Manager</a>
                            </li>
                            <!-- <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="fas fa-shopping-bag"></i>
                                    <span>2</span>
                                </a>
                            </li> -->
                        </div>
                        <!-- them d-flex de hien -->
                        <div class="connecting-to-web">
                            <li class="nav-item">
                                <a class="nav-link" href="./login.jsp">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./signup.jsp">Sign up</a>
                            </li>
                        </div>
                        <div class="connected-to-web d-flex">
                            <div class="shopping-card-wrapper">
                                <!-- them class onclick de hien demo-card-film -->
                                <span class="shoping-card-title">Shopping Card</span>
                                <div class="demo-card-film">
                                    <div class="MyCard-header d-flex">
                                        <h6>Shopping Card</h6>
                                        <a href="#">View all notification</a>
                                    </div>
                                    <div class="MyCard-content">
                                        <div class="MyCard-content-item">
                                            <a href="#">
                                                <img src="./images/gallery-1.jpg">
                                            </a>
                                            <div class="card-film-info">
                                                <h3><a href="#">Twenty Five Twenty One Twenty Five Twenty One</a></h3>
                                                <p class="card-last-access">Last access was 13 day ago</p>
                                                <!-- mac dinh la chua tra, them paid de hien tra roi -->
                                                <div class="card-checkpay paid">
                                                    <span>Paid</span>
                                                    <!-- dung after de hien tich -->
                                                    <a href="#">Pay Now$$</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="notification-wrapper">
                                <span><i class="fas fa-bell"></i></span>
                                <div class="notification-list"></div>
                            </div> -->
                            <!-- add class onclick to appear avatar-down-->
                            <div class="avatar-wrapper">
                                <img src="./images/avatar.jpg" alt="avatar">
                                <div class="avatar-down">
                                    <div class="avatar__down-header">
                                        <img src="./images/avatar.jpg" alt="avatar">
                                        <p>Le Minh Quan</p>
                                    </div>
                                    <hr>
                                    <div class="avatar__down-info">
                                        <a href="#">Your Info</a>
                                    </div>
                                    <hr>
                                    <div class="avatar__down-singout">
                                        <a href="#">Sign out</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ul>
                </div>
            </nav>
        </div>
        <div id="admin-wrapper">
            <div class="admin-sidebar">
                <ul>
                    <li class="main-side">
                        <h3>Main</h3>
                        <a href="#">
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
                            <li><a href="admin.jsp">
                                    <i class="fas fa-caret-right"></i>
                                    <span>Add movie</span>
                                </a></li>
                            <li><a href="movie.jsp">
                                    <i class="fas fa-caret-right"></i>
                                    <span>List movie</span>
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
                            <li><a href="admin-handleAcc.jsp">
                                    <i class="fas fa-caret-right"></i>
                                    <span>Block account</span>
                                </a></li>
                            <li><a href="admin-handleAcc.jsp">
                                    <i class="fas fa-caret-right"></i>
                                    <span>UnBlock account</span>
                                </a></li>
                        </ul>
                    </li>
                    <li class="other-side">
                        <h3>Other</h3>
                        <a href="#">
                            <i class="fab fa-facebook-messenger"></i>
                            <span>Message</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="admin-main">
                <div class="main-cotainer">
                    <div class="main-header">
                        <h1>User Dashboard</h1>
                        <ul>
                            <li class="breadcrumb-item"><a href="#">Admin</a></li>
                            <li class="breadcrumb-item active"><a href="#">User Dashboard</a></li>
                        </ul>
                    </div>
                    <div class="general-statistic">
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="GS__item-general">
                                    <div class="GS__left-side">
                                        <h4>Total User</h4>
                                        <p>44,444</p>
                                    </div>
                                    <span><i class="fas fa-users"></i></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="GS__item-general">
                                    <div class="GS__left-side">
                                        <h4>Total Movie</h4>
                                        <p>44,444</p>
                                    </div>
                                    <span><i class="fas fa-film"></i></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="GS__item-general">
                                    <div class="GS__left-side">
                                        <h4>Total Money</h4>
                                        <p>44,444$</p>
                                    </div>
                                    <span><i class="fas fa-dollar-sign"></i></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="GS__item-general">
                                    <div class="GS__left-side">
                                        <h4>Total director, actor</h4>
                                        <p>44,444</p>
                                    </div>
                                    <span><i class="fas fa-user-friends"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="detail-statistic">
                            <div class="row">
                                <div class="col-lg-8 col-12">
                                    <div>
                                        <h4>Amount creating accounts</h4>
                                        <canvas data-createAcc="0,10,5,2,20,30,45,10,5,2,20,20" id="create-account"></canvas>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-12">
                                    <div>
                                        <h4>Male/Female account</h4>
                                        <canvas data-mf="300,50" id="M__F-Account"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="detail-statistic">
                            <div class="row">
                                <div class="col-lg-4 col-12">
                                    <div>
                                        <h4>Genre movie</h4>
                                        <canvas data-gm="Actor-12,Advanger-15,Humor-20,Danger-22" id="genre-movie"></canvas>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-12">
                                    <div>
                                        <h4>Movie viewer</h4>
                                        <canvas data-mv="Actor-32,Advanger-25,Humor-20,Danger-18,Advanger-15,Humor-13,Danger-12" id="movie-viewer"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="detail-statistic">
                            <div class="row">
                                <div class="col-12">
                                    <div>
                                        <h4>Statistic money</h4>
                                        <canvas data-sm="0,10,5,2,20,30,45,10,5,2,20,20" id="statistic-money"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
        <script src="./js/script.js"></script>
        <script src="./js/chart.js"></script>
        <script>
            handleAll_Except_Login_SignOut();
            handleAdmin();
        </script>
    </body>

</html>
