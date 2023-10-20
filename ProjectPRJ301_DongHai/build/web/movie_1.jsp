<%-- 
    Document   : movie.jsp
    Created on : Oct 6, 2023, 8:42:16 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script type="text/javascript">
            function change() {
                document.getElementById("f1").submit();
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <c:set var="page" value="${requestScope.page}"/>
        <div id="page-movies-box">
            <div class="left-content">
                <form action="checkbox">
                    <button data-toggle="collapse" data-target="#LC-filter">Filter <i class="fas fa-dot-circle"></i></button>
                    <div id="LC-filter" class="collapse">
                        <input type="checkbox" name="isPaid" id="isPaid" value="1">
                        <label for="isPaid">Have owned</label>
                    </div>
                    <button data-toggle="collapse" data-target="#LC-sort">Sort By <i class="fas fa-dot-circle"></i></button>
                    <div id="LC-sort" class="collapse">
                        <select name="sort-select">
                            <option value="nameDown">Name &#xf063;</option>
                            <option value="nameUP">Name &#xf062;</option>
                            <option value="priceDown">Price &#xf063;</option>
                            <option value="priceUP">Price &#xf062;</option>
                        </select>
                    </div>
                    <!--search film-->
                    <button data-toggle="collapse" data-target="#LC-choice-list">Type Of Film <i class="fas fa-dot-circle"></i></button>
                    <div id="LC-choice-list" class="collapse" >

                    </div>
                </form>

            </div>



            <div class="right-content">
                <div class="RC-search-header">
                    <form action="" method="get">
                        <select name="RC-search-type">
                            <option value="0">All</option>
                            <c:forEach items="${requestScope.data}" var="c">
                                <option ${(cid==c.id )?'selected':''} value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>
                        <div class="RC-search_wrapper">
                            <input type="text" name="key"  placeholder="Find ..." />
                            <button type="submit" onclick="this.form.submit()"><img src="./images/seach-icon.svg" width="20px" height="20px" alt="alt"/></button>
                        </div>
                    </form>
                </div>
                <div class="RC-search-content">
                    <div class="row">
                        <c:forEach items="${requestScope.movie}" var="m">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="movie-img-wrapper">
                                    <a href="movie_detail?id=${m.id}">
                                        <div>
                                            <img src="${m.image}" alt="movie-img">
                                        </div>
                                    </a>
                                </div>
                                <div class="movie-description">
                                    <h6><a href="movie_detail?id=${m.id}">${m.name}</a></h6>
                                    <p>${m.cid.name}</p>
                                    <div class="description-star">
                                        <i class="fas fa-star voted"></i>
                                        <i class="fas fa-star voted"></i>
                                        <i class="fas fa-star voted"></i>
                                        <i class="fas fa-star voted"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div class="movie-price">
                                        <p>${m.price}$</p>
                                        <span class="movie-paid">PAID</span>
                                    </div>
                                    <!--                                    <div class="movie-action not-admin">
                                                                            <span><i class="fas fa-edit"></i></span>
                                                                            <span><i class="fas fa-trash-alt"></i></span>
                                                                        </div>-->
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <c:set var="k" value="${requestScope.key}"/>
                <div class="RC-pagination">
                    <c:forEach begin="${1}" end="${requestScope.num}" var="n">
                        <a  class="${n==page?"active":""}"href="searchbyname?page=${n}&key=${k}">${n}</a>
                    </c:forEach>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
        <script src="./js/script.js"></script>
        <script>
//                                       handleMovies();
                                handleAll_Except_Login_SignOut();
//                                       handleMovieAddToCard();
        </script>
    </body>
</html>
