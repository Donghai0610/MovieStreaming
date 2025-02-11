<%-- 
    Document   : shop-card
    Created on : Oct 6, 2023, 3:29:42 PM
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
        <script src="./js/jquery-3.6.0.min.js"></script>
        <script src="./js/bootstrap.bundle.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
    </head>

    <body>
        <div id="page-heading">
            <!-- them onactive de thay doi size cua header -->
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
                                <a class="nav-link" href="./movie.jsp">Movies</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">News</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Search</a>
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
        <div id="page-shop-card-box">
            <div class="container">
                <h2>Shopping Card</h2>
                <div class="shopping-card-list">
                    <div class="card-mess"></div>
                    <div class="SCL-heading">
                        <div class="markAll-wrapper">
                            <input type="checkbox" id="markAll" onclick="handleCheckAll(this)" checked>
                            <label for="markAll">Choose All</label>
                        </div>
                        <input onkeyup="handldeSearchCart(this)" type="text" name="card-find-film" id="">
                        <p><span>3 items</span> in Card</p>
                    </div>
                    <div class="shopping-card-item">
                        <input data-id="1" onclick="handleCheckItem(this)" type="checkbox" name="item-index" checked>
                        <a href="#">
                            <img src="./images/gallery-1.jpg">
                        </a>
                        <div class="card-film-info">
                            <h3><a href="#">Twenty Five Twenty One</a></h3>
                            <p class="card-director">Long An cuc</p>
                        </div>
                        <div class="card__film-created">
                            <h3>Created At:</h3>
                            <p>27-06-2022</p>
                        </div>
                        <div class="price-delete-wrapper">
                            <p>$39.00</p>
                            <span onclick="handleDelete(this)" data-id=""><i class="fas fa-trash"></i></span>
                        </div>
                    </div>
                    <div class="shopping-card-item">
                        <input data-id="2" onclick="handleCheckItem(this)" type="checkbox" name="item-index" checked>
                        <a href="#">
                            <img src="./images/gallery-1.jpg">
                        </a>
                        <div class="card-film-info">
                            <h3><a href="#">Yasuo montage</a></h3>
                            <p class="card-director">Khoa khoan hong</p>
                        </div>
                        <div class="card__film-created">
                            <h3>Created At:</h3>
                            <p>12-12-2002</p>
                        </div>
                        <div class="price-delete-wrapper">
                            <p>$25.00</p>
                            <span onclick="handleDelete(this)" data-id=""><i class="fas fa-trash"></i></span>
                        </div>
                    </div>
                    <div class="shopping-card-item">
                        <input data-id="3" onclick="handleCheckItem(this)" type="checkbox" name="item-index" checked>
                        <a href="#">
                            <img src="./images/gallery-1.jpg">
                        </a>
                        <div class="card-film-info">
                            <h3><a href="#">Cau Vang tau hai</a></h3>
                            <p class="card-director">hoang ccccccccccc</p>
                        </div>
                        <div class="card__film-created">
                            <h3>Created At:</h3>
                            <p>13-06-2020</p>
                        </div>
                        <div class="price-delete-wrapper">
                            <p>$329.00</p>
                            <span onclick="handleDelete(this)" data-id=""><i class="fas fa-trash"></i></span>
                        </div>
                    </div>
                </div>
                <div class="shopping-card-total">
                    <p>Toltal: <span>$29.00</span></p>
                </div>
                <div class="btn-nav">
                    <a href="#">CONTINUE SHOPPING</a>
                    <button type="button" class="btn btn-primary checkout" data-toggle="modal" data-target="#checkoutModal">
                        CHECK OUT
                    </button>

                    <div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <!-- <span>Buy Successfully!</span> -->
                                    <!-- <span>Not enough money!</span> -->
                                    <span>Do you really want to checkout?</span>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button id="checkout-btn" type="button" class="btn btn-primary">Yes</button>
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
        <script>
                                handleMoneys()
                                handleCheckout()
        </script>
    </body>

</html>
