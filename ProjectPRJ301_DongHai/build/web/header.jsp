<%-- 
    Document   : header
    Created on : Oct 10, 2023, 3:03:52 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import= "dal.WishListDAO,model.User,model.WishList,model.Movie,java.util.List,model.Order" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script type="text/javascript">
            function doDeleteWishList(id) {
                if (confirm("Are you surely to delete id =" + id)) {
                    window.location.href = "deletewishlist?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <div id="page-heading">
            <nav class="navbar navbar-expand-sm navbar-dark onactive">
                <a class="navbar-brand" href="home">
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
                                <a class="nav-link " href="home">Home</a>
                            </li>
                            <li class="nav-item">

                                <a class="nav-link" href="movie">Movies</a>
                            </li>

                            <!--                            <li class="nav-item">
                            
                                                            <a class="nav-link" href="movie">Movies</a>
                                                        </li>-->


                            <c:set var="a" value="${sessionScope.account}" />
                            <c:if test="${a.role == 1}">
                                <li class="nav-item ">
                                    <a class="nav-link" href="admin-chart.jsp">Admin Manager</a>
                                </li>
                            </c:if>
                            <c:if test="${a.role == 2}">
                                <!-- them not-admin de an link nay -->
                                <li class="nav-item not-admin">
                                    <a class="nav-link" href="admin.jsp">Admin Manager</a>
                                </li>
                            </c:if>
                            <!-- <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="fas fa-shopping-bag"></i>
                                    <span>2</span>
                                </a>
                            </li> -->
                        </div>
                        <!-- them d-flex de hien -->
                        <c:set var="a" value="${sessionScope.account}"/>
                        <c:if test="${a == null}">
                            <div class="connecting-to-web d-flex">
                                <li class="nav-item">
                                    <a class="nav-link" href="login">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="signup">Sign up</a>
                                </li>
                            </div>
                        </c:if>
                        <c:if test="${a != null}">
                            <%
                                 WishListDAO dal = new WishListDAO();

                                List<WishList> list = dal.getALL((User)session.getAttribute("account"));
                                 int userID = ((User) request.getSession().getAttribute("account")).getId();
                                 List<Order> list_1 = dal.getOrder(userID);

                            %>
                            <div class="connected-to-web d-flex">
                                <div class="shopping-card-wrapper movie-paided">
                                    <!-- them class onclick de hien demo-card-film -->
                                    <span class="shoping-card-title">MoviePaided</span>
                                    <i class="fa fa-folder" aria-hidden="true"><span class="shoping-card-title"></span></i>
                                    <div class="demo-card-film ">
                                        <div class="MyCard-header d-flex">
                                            <h6>Movie Paided</h6>
                                            <a href="#">View all notification</a>
                                        </div>
                                        <div class="MyCard-content">
                                            <%for(int i = 0 ; i < list_1.size(); i++){
                                                Order c = list_1.get(i);
                                            %>
                                            <div class="MyCard-content-item">
                                                <a href="movie_detail?id=<%=c.getMovieID().getId()%>">
                                                    <img src="<%= c.getMovieID().getImage()%>">
                                                </a>
                                                <div class="card-film-info">
                                                    <h3><a href="#"><%= c.getMovieID().getName()%></a></h3>
                                                    <!--                                                   
                                                    <!-- mac dinh la chua tra, them paid de hien tra roi -->

                                                </div>
                                            </div>
                                            <%}%>

                                        </div>
                                    </div>
                                </div>

                                <div class="shopping-card-wrapper wishlist">
                                    <!-- them class onclick de hien demo-card-film -->
                                    <span class="shoping-card-title wishlist ">WishList</span>
                                    <i class="fas fa-shopping-cart"><span class="shoping-card-title"></span></i>
                                    <div class="demo-card-film onclick ">
                                        <div class="MyCard-header d-flex">
                                            <h6>WishList</h6>
                                            <a href="#">View all notification</a>
                                        </div>
                                        <div class="MyCard-content">
                                            <%for(int i = 0 ; i < list.size(); i++){
                                                WishList c = list.get(i);
                                            %>
                                            <div class="MyCard-content-item">
                                                <a href="movie_detail?id=<%=c.getMovie().getId()%>">
                                                    <img src="<%= c.getMovie().getImage()%>">
                                                </a>
                                                <div class="card-film-info">
                                                    <h3><a href="#"><%= c.getMovie().getName()%></a></h3>
                                                    <p class="card-last-access">Last acces <%=c.getWishlistDate()%></p>
                                                    <!-- mac dinh la chua tra, them paid de hien tra roi -->
                                                    <div class="card-checkpay paid">
                                                        <span onclick="doDeleteWishList('<%=c.getId()%>')">Delete</span></
                                                        <!-- dung after de hien tich -->
                                                        <!--<a href="de">Pay Now$$</a>-->
                                                    </div>
                                                </div>
                                            </div>
                                            <%}%>

                                        </div>
                                    </div>
                                </div>
                                <!-- <div class="notification-wrapper">
                                    <span><i class="fas fa-bell"></i></span>
                                    <div class="notification-list"></div>
                                </div> -->
                                <!-- add class onclick to appear avatar-down-->
                                <c:set var="a" value="${sessionScope.account}"/>
                                <div class="avatar-wrapper">
                                    <img src="${a.avatar}" alt="avatar">
                                    <div class="avatar-down ">
                                        <div class="avatar__down-header">
                                            <img src="${a.avatar}?onclick:''" alt="avatar">
                                            <div class="name__money-wrapper">
                                                <p>${a.user}</p>
                                                <!--                                                <span>$500.00</span>-->
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="avatar__down-info">
                                            <a href="changeprofile">Your Info</a>
                                        </div>
                                        <hr>
                                        <div class="avatar__down-change-password">
                                            <a href="changepassword">Change password</a>
                                        </div>

                                        <!--                                        <div class="avatar__down-setting">
                                                                                    <a href="#">Setting</a>
                                                                                </div>-->
                                        <hr>
                                        <div class="avatar__down-singout">
                                            <a href="logout">Sign out</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </ul>
                </div>
            </nav>

        </div>
    </body>
</html>
