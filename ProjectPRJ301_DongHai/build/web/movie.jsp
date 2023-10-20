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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <script src="./js/jquery-3.6.0.min.js"></script>
        <script src="./js/bootstrap.bundle.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <c:set var="page" value="${requestScope.page}"/>
        <div id="page-movies-box">
            <div class="left-content">
                <form action="checkbox  ">
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
                </form>
                                                              
                                                          
                <form action="checkbox  ">
                    <button data-toggle="collapse" data-target="#LC-choice-list">Type Of Film <i class="fas fa-dot-circle"></i></button>
                    <div id="LC-choice-list" class="collapse" >
                <c:set var="catelist" value="${requestScope.data}"/>
                <c:set var="cid" value="${requestScope.cid}"/>
                <c:forEach begin="0" end="${catelist.size()-1}" var="c">
                    <input type="checkbox" name="typeOfFilm"  value="${catelist.get(c).getId()}"
                    ${cid[c]?"checked":""} onclick="this.form.submit()"  /> 
             <label for="typeOfFilm">${catelist.get(c).getName()}</label><br/>
             <hr>
                </c:forEach>
            </div>
        </form>
                <c:set var="checkbox" value="${requestScope.checkbox}"/>
            </div>



            <div class="right-content">
                <div class="RC-search-header">
                    <form action="" method="get">
                        <div class="RC-search_wrapper">
                            <input type="text" name="key"  placeholder="Find ..."/>
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

                            <div class="description-star" id="star-rating">
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star "></i>
                                <i class="fas fa-star "></i>
                                <i class="fas fa-star "></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <div id="message"></div>


                            <div class="movie-price">
                                <p>${m.price}$</p>
                                <span class="movie-paid">PAID</span>
                            </div>
                    <c:set var="a" value="${sessionScope.account}" />
                    <c:if test="${a.role == 1}">
                        <div class="movie-action ">
                            <span><i class="fas fa-edit"></i></span>
                            <span><i class="fas fa-trash-alt"></i></span>
                        </div>
                    </c:if>
                </div>
            </div>
                </c:forEach>
            </div>
        </div>
                <c:set var="check" value="${requestScope.checkbox}"/>
                <c:if test="${check != null}">
                    <div class="RC-pagination">
                    <c:forEach begin="${1}" end="${requestScope.num}" var="n">
                        <a  class="${n==page?"active":""}"href="checkbox?page=${n}">${n}</a>
                    </c:forEach>
                </div>
                </c:if>
                <c:if test="${check == null}">
                    <div class="RC-pagination">
                    <c:forEach begin="${1}" end="${requestScope.num}" var="n">
                        <a  class="${n==page?"active":""}"href="movie?page=${n}">${n}</a>
                    </c:forEach>
                </div>
                </c:if>

            </div>
        </div>

                <%@include file="footer.jsp" %>
                <script src="./js/script.js"></script>
                <script type="text/javascript">
        // Get the star icons and message element
                                               const starIcons = document.querySelectorAll('#star-rating i');
                                               const message = document.getElementById('message');
        
        // Add a click event listener to each star icon
                                               starIcons.forEach((star, index) => {
                                                   star.addEventListener('click', () => {
                                                       // Reset all stars
                                                       starIcons.forEach((s, i) => {
                                                           s.classList.remove('voted');
                                                       });
        
                                                       // Highlight clicked and previous stars
                                                       for (let i = 0; i <= index; i++) {
                                                           starIcons[i].classList.add('voted');
                                                       }
        
                                                       // Display a message indicating the selected rating
                                                       message.textContent = `You rated this ${index + 1} star(s).`;
        
                                                       // You can also send the rating to the server via AJAX if needed.
                                                   });
                                               });
        
                </script>
                <script>
                    handleMovies();
                    handleAll_Except_Login_SignOut();
                    handleMovieAddToCard();
                </script>
            </body>
        </html>
