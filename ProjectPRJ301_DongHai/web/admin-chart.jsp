<%-- 
    Document   : admin-chart
    Created on : Oct 6, 2023, 3:22:54 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dal.MovieDAO,java.util.Map" %>
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
        <%@include file="header.jsp" %>
        <div id="admin-wrapper">
            <%@include file="admin_sidebar.jsp" %>
            <c:set var="totalMovie" value="${requestScope.totalMovie}"/>
            <div class="admin-main">
                <div class="main-cotainer">
                    <div class="main-header">
                        <h1>User Dashboard</h1>
                        <ul>
                            <li class="breadcrumb-item"><a href="admin">Admin</a></li>
                            <li class="breadcrumb-item active"><a href="#">User Dashboard</a></li>
                        </ul>
                    </div>
                    <div class="general-statistic">
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="GS__item-general">
                                    <div class="GS__left-side">
                                        <h4>Total User</h4>
                                        <p>${requestScope.totalUser}</p>
                                    </div>
                                    <span><i class="fas fa-users"></i></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="GS__item-general">
                                    <div class="GS__left-side">
                                        <h4>Total Movie</h4>
                                        <p>${totalMovie}</p>
                                    </div>
                                    <span><i class="fas fa-film"></i></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="GS__item-general">
                                    <div class="GS__left-side">
                                        <h4>Total Movie View</h4>
                                        <p>${requestScope.totalView}</p>
                                    </div>
                                    <span><i class="fas fa-eye"></i></span>
                                </div>
                            </div>
                            <%
                                MovieDAO dal = new MovieDAO();
                                 int[] totalDirectorActor = dal.statisticDirectorActor();
                            %>
                            <div class="col-lg-3 col-md-6 col-12">
                                <div class="GS__item-general">
                                    <div class="GS__left-side">
                                        <h4>Total director, actor</h4>
                                        <%
                                        for (int i = 0; i < totalDirectorActor.length-1; i++) {
                                        %>
                                        <p>Director:<%= totalDirectorActor[0] %></p>
                                        <p>Actor:<%= totalDirectorActor[1] %></p>
                                        <%
                                        }
                                        %>

                                    </div>
                                    <span><i class="fas fa-user-friends"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="detail-statistic" style="display: none">
                            <div class="row">
                                <div class="col-lg-8 col-12">
                                    <div>
                                        <h4>Amount creating accounts</h4>

                                        <canvas data-createAcc="${requestScope.chart1}" id="create-account"></canvas>

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

                                        <h4>The Number of Movie follow Genre</h4>
                                        <canvas data-gm="${requestScope.chart1}" id="genre-movie"></canvas>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-12">
                                    <div>
                                        <h4>Movie viewer</h4>
                                        <canvas data-mv="${requestScope.chart2}" id="movie-viewer"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="detail-statistic" style="display: none">
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
        <%@include file="footer.jsp" %>
        <script src="./js/script.js"></script>
        <script src="./js/chart.js"></script>
        <script>
            handleAll_Except_Login_SignOut();
            handleAdmin();
        </script>
    </body>

</html>
