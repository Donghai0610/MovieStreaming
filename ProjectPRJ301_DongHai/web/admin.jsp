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
        <%@include file="header.jsp" %>
        <div id="admin-wrapper">
            <%@include file="admin_sidebar.jsp" %>
            <div class="admin-main">
                <div class="main-cotainer">
                    <div class="main-header">
                        <h1>Add movie</h1>
                        <ul>
                            <li class="breadcrumb-item"><a href="">Admin</a></li>
                            <li class="breadcrumb-item active"><a href="#">Add movies</a></li>
                        </ul>
                    </div>
                    <div class="main-form">
                        <form action="addmovie" method="post" enctype="multipart/form-data">
                            <div class="form-group row">
                                <label for="inputName3" class="col-sm-2 col-form-label custom-label-ip">Movie Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control custom-label-ip" id="inputName3"
                                           placeholder="Name..." name="name">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputRealseYear3" class="col-sm-2 col-form-label custom-label-ip">Realse
                                    Year</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control custom-label-ip" id="inputRealseYear3"
                                           placeholder="Realse Year..." name="RealseYear">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="banner" class="col-sm-2 col-form-label custom-label-ip">Banner</label>
                                <div class="col-sm-10">
                                    <input type="file" class="form-control custom-label-ip" id="banner"
                                           placeholder="Banner..." name="banner">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPrice3" class="col-sm-2 col-form-label custom-label-ip">Price</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control custom-label-ip" id="inputPrice3"
                                           placeholder="Price..." name="Price">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputSrc3" class="col-sm-2 col-form-label custom-label-ip">Src</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control custom-label-ip" id="inputSrc3"
                                           placeholder="Src..." name="Src">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputDescription3"
                                       class="col-sm-2 col-form-label custom-label-ip">Description</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control custom-label-ip" id="inputDescription3"
                                           placeholder="Description..." name="Description">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputActor"
                                       class="col-sm-2 col-form-label custom-label-ip">Actor</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control custom-label-ip" id="inputActor"
                                           placeholder="Description..." name="Actor">
                                </div>
                            </div><!-- comment -->
                            <div class="form-group row">
                                <label for="inputDirector"
                                       class="col-sm-2 col-form-label custom-label-ip">Director</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control custom-label-ip" id="inputDirector"
                                           placeholder="Description..." name="Director">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputGenre"
                                       class="col-sm-2 col-form-label custom-label-ip">Gener</label>
                                <div class="col-sm-10">
                                    <select name="cid" style="width: 350px;height: 50px">
                                        <c:forEach items="${requestScope.listcate}" var="c">
                                            <<option   id="inputGenre" class="form-control custom-label-ip" value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <!--                            <form action="sendmail" method="Post">
                                                            <input type="radio" name=""/>
                                                        </form>-->
                            <div class="form-group row">
                                <div class="col-sm-10">
                                    <input type="submit" value="ADD"class="btn btn-primary custom-btn" onclick="this.form.submit()"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="footer.jsp" %>
        <script src="./js/script.js"></script>
        <script>
                                        handleAll_Except_Login_SignOut();
                                        handleAdmin();
                                        handleSubmitAddMovie();
        </script>
    </body>

</html>
