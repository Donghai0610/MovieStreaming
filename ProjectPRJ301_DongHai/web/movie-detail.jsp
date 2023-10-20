<%-- 
    Document   : movie-detail
    Created on : Oct 6, 2023, 3:27:49 PM
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
        <%--<jsp:useBean id="d" class="dal.InsertManyToMany"/>--%>
        <%@include file="header.jsp" %>
        <div id="page-movie-detail-box">
            <div class="container">
                <c:set var="a" value="${requestScope.movie}"/>
                <div class="MD-main">
                    <div class="MD__main-trailer">

                        <img src="${a.image}" alt="">
                        <i class="fas fa-play-circle"></i>

                        <button type="button" class="" data-toggle="modal" data-target="#videoModal"><i
                                class="fas fa-play-circle"></i></button>

                        <div id="videoModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
                             aria-labelledby="myLargeModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <iframe width="560" height="315" src="${a.linkmovie}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                                </div>
                            </div>
                        </div> 

                        <div class="modal fade" id="videoModal" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Message</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <span>You haven't paid this film!</span>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="MD__main-info">
                        <h1>${a.name}
                            <span>${a.price}</span>
                        </h1>
                        <div class="info-rating">
                            <div class="IF-left">
                                <!--<span class="IF-left-span">40min</span>-->
                                <span>${a.release}</span>
                                <div class="view-like-wrapper">
                                    <div class="VL-view">
                                        <i class="fas fa-eye"></i>
                                        <span>${a.view}</span>
                                    </div>
                                    <!-- them liked de chuyen mau btn like -->
                                    <div class="VL-like liked">
                                        <!-- button dung before de chen icon ~ content dung unicode de hien icon like thay vi tag i-->
                                        <span>1+</span> 
                                    </div>
                                </div>
                            </div>

                            <!-- rating -->
                            <div class="IF-right">
                                <div class="IF-right-wrapper">
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="IF-voted-quantity">
                                    <span>1 Voted</span>
                                </div>
                            </div>
                        </div>
                        <div class="info-content show">
                            <!-- them class show de hien het content -->
                            <div class="IC-left">
                                <div class="IC-left-wrapper">
                                    <p>
                                        <span class="IC-directed">Director: <a href="#" style="text-decoration: none"> ${a.director}</a></span> </br>
                                        <span class="IC-actor">Main actor:
                                            <a href="#" style="text-decoration: none">${a.actor}</a>,
                                        </span>
                                    </p>
                                    <p>${a.describe}</p>
                                </div>
                                <!-- overflow:hiden, chi thay cai height voi set cai transition cho muot la dc-->
                                <span class="read-more ">Read Mores</span>
                            </div>
                            <div class="IC-right">
                                <span>Tags: ${a.cid.name}</span>
                                <a href="#"></a>

                            </div>
                        </div>
                        <button class="btn">
                            <i class="fas fa-shopping-cart"></i>
                            ADD TO CARD</button>
                    </div>

                    <div class="MD__main-comment onclick">
                        <!-- onclick de hien cmt -->
                        <h1>Comment (<span>50</span>)</h1>

                        <div class="MDM-comment-wrapper">
                            <!-- hien dong cmt cua minh dau tien neu da login/ neu chua thi hien thong bao -->
                            <c:set var="a" value="${sessionScope.account}"/>
                            <div class="myselft_cmt show">
                                <p class="ms_mustbelog">You must be <a href="login">Logged in</a> to post a review.</p>
                                <c:if test="${a != null}">
                                    <div class="comment-item">
                                        <img src="${a.avatar}" alt="">
                                        <div class="comment-item-right">
                                            <input type="text" name="ms_cmt" placeholder="How do you feel about film...">
                                            <input type="submit" value="Submit">
                                            <!-- ranh lam them cai btn binh luan + btn huy -->
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <!-- chua cac cmt -->
                            <div class="comment-list">
                                <c:forEach items="${requestScope.comment}" var="c">
                                    <div class="comment-item">  
                                        <img src="./images/batman_icon.png" alt="">
                                        <div class="comment-item-right">
                                            <p>
                                                <strong></strong>
                                                <span></span>
                                            </p>

                                            <p>${c.comment}</p>
                                            <p>${c.commentDate}</p>
                                            <div class="commnent-react">
                                                <!-- to mau neu like -->
                                                <i class="fas fa-thumbs-up "></i>
                                                <span>1+</span>
                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>
                                <!-- load du lieu lay cmt tiep -->
                                <span class="load-more">Read Mores</span>
                            </div>
                        </div>
                    </div>

                </div>


                <div class="MD-other">
                    <h1>YOU MAY ALSO LIKE</h1>
                    <hr>
                    <div class="row">
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="movie-img-wrapper">
                                <a href="#">
                                    <div>
                                        <img src="./images/gallery-1.jpg" alt="movie-img">
                                    </div>
                                </a>
                            </div>
                            <div class="movie-description">
                                <h6><a href="#">Ant-Man and the Wasp</a></h6>
                                <p>2018, USA, Action</p>
                                <div class="description-star">
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="movie-price">
                                    <p>$29.00</p>
                                    <span>ADD TO CARD</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="movie-img-wrapper">
                                <a href="#">
                                    <div>
                                        <img src="./images/gallery-1.jpg" alt="movie-img">
                                    </div>
                                </a>
                            </div>
                            <div class="movie-description">
                                <h6><a href="#">Ant-Man and the Wasp</a></h6>
                                <p>2018, USA, Action</p>
                                <div class="description-star">
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="movie-price">
                                    <p>$29.00</p>
                                    <span>ADD TO CARD</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="movie-img-wrapper">
                                <a href="#">
                                    <div>
                                        <img src="./images/gallery-1.jpg" alt="movie-img">
                                    </div>
                                </a>
                            </div>
                            <div class="movie-description">
                                <h6><a href="#">Ant-Man and the Wasp</a></h6>
                                <p>2018, USA, Action</p>
                                <div class="description-star">
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="movie-price">
                                    <p>$29.00</p>
                                    <span>ADD TO CARD</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="movie-img-wrapper">
                                <a href="#">
                                    <div>
                                        <img src="./images/gallery-1.jpg" alt="movie-img">
                                    </div>
                                </a>
                            </div>
                            <div class="movie-description">
                                <h6><a href="#">Ant-Man and the Wasp</a></h6>
                                <p>2018, USA, Action</p>
                                <div class="description-star">
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star voted"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="movie-price">
                                    <p>$29.00</p>
                                    <span>ADD TO CARD</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script src="./js/script.js"></script>
        <script>
            handleMovieDetail();
            handleAll_Except_Login_SignOut();
        </script>
    </body>
</html>
