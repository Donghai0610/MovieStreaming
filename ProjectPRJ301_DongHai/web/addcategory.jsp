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
        <script type="text/javascript">
            function deleteCate(id) {
                if (confirm("Are you surely to delete id =" + id)) {
                    window.location = "deletecategory?id=" + id;
                }
            }
        </script>
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
                            <li class="breadcrumb-item"><a href="admin-chart.jsp">Admin</a></li>
                            <li class="breadcrumb-item active"><a href="addmovie">Add movies</a></li>
                        </ul>
                    </div>
                    <div class="main-form">
                        <div id="genre-data" class="form-group row">
                            <label for="" class="col-sm-2 col-form-label custom-label-ip">Genre</label>
                            <div class="col-sm-10">
                                <div class="form-check form-check-inline">
                                    <input data-type="add-new" class="form-check-input custom-label-ip" type="radio" name="genre-action"
                                           id="inlineRadio5" value="add-new">
                                    <label class="form-check-label custom-label-ip" for="inlineRadio5">Add new</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input data-type="choose-exist" class="form-check-input custom-label-ip" type="radio" name="genre-action"
                                           id="inlineRadio6" value="choose-exist">
                                    <label class="form-check-label custom-label-ip" for="inlineRadio6">Add exist
                                        genre</label>
                                </div>
                                <div class="result-wrapper">

                                </div>
                                <div class="Choose-Ewrapper">
                                    <input class="form-control custom-label-ip custom-search" id="search-info"
                                           type="text" placeholder="Search.." onkeyup="">

                                    <div class="custom-tableWrapper">
                                        <table id="Choose-existed"
                                               class="table table-striped table-hover custom-label-ip">
                                            <thead class="">
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Genre Name</th>
                                                </tr>
                                            </thead>
                                            <tbody class="customm-tableBody">
                                                <c:forEach items="${requestScope.listcate}" var="c">
                                                    <tr onclick="handleFind(this, 'genre')">
                                                        <th scope="row">${c.id}</th>
                                                        <td>${c.name}</td>
                                                        <td>
                                                            &nbsp;&nbsp; <a href="updatecategory?id=${c.id}">Update</a>&nbsp;&nbsp;
                                                            &nbsp;&nbsp; <a href="#" onclick="deleteCate('${c.id}')">Delete</a>&nbsp;&nbsp;
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <form action="addcategory" method="post">
                                    <div class="Add-Nwrapper row">
                                        <div id="add-New" class="col-md-3 form-row">
                                            <div class="col-md-12 mb-3">
                                                <label for="validationCustom07" class="custom-label-ip">Genre Name</label>
                                                <input type="text" class="form-control custom-label-ip"
                                                       name="NGenreName" placeholder="Genre Name"
                                                       value="${requestScope.name}">
                                                <div class="valid-feedback">
                                                    ${requestScope.noti}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="col-md-3 btn btn-outline-primary custom-btn-addN" onclick="this.form.submit()">ADD</button>
                                </form>

                            </div>
                        </div>




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
