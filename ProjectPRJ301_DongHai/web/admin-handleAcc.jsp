<%-- 
    Document   : admin-handleAcc
    Created on : Oct 6, 2023, 3:23:24 PM
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
            function deleted(user) {
                if (confirm("Are you surely to delete user = " + user)) {
                    window.location = "deleteaccount?user=" + user;
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
                        <h1>Block account</h1>
                        <ul>
                            <li class="breadcrumb-item"><a href="#">Admin</a></li>
                            <li class="breadcrumb-item active"><a href="#">Block account</a></li>
                        </ul>
                    </div>
                    <div class="main-form">
                        <div class="search-wrapper">
                            <select class="custom-select custom__own-select custom-label-ip" id="inputGroupSelect01">
                                <option value="0" selected>All</option>
                                <option value="1">Block</option>
                                <option value="2">Unblock</option>
                            </select>
                            <input class="form-control custom-label-ip custom-search" id="search-info" type="text"
                                   placeholder="Search..">
                        </div>
                        <div class="result_acc-wrapper">
                            <table class="table table-striped table-hover custom-label-ip">
                                <thead class="">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Username</th>
                                        <th scope="col">Password</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phonenum</th>
                                        <th scope="col">FullName</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody class="customm-tableBody">
                                    <c:forEach items="${requestScope.userList}" var="u">
                                        <tr onclick="">
                                            <th scope="row">${u.id}</th>
                                            <td>${u.user}</td>
                                            <td>${u.password}</td>
                                            <td>${u.email}</td>
                                            <td>${u.phonenum}</td>
                                            <td>${u.fullname}</td>
                                            <td>${u.role eq 1 ? 'Admin' : 'User'}</td>
                                            <td>
                                                <span> &nbsp;&nbsp;<a href="updateaccount?name=${u.user}"><i class="fas fa-edit"></i></a>&nbsp;&nbsp;</span>
                                                <span>&nbsp;&nbsp; <a href="#" onclick="deleted('${u.user}')"><i class="fas fa-trash-alt"></i></a>&nbsp;&nbsp;</span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <c:set var="page" value="${requestScope.page}"/>
                            <nav aria-label="Page navigation">
                                <ul class="pagination custom-nav">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <c:forEach begin="${1}" end="${requestScope.num}" var="n">
                                        <li><a  class="${n==page?"active":""}"href="admin_account?page=${n}">${n}</a></li>
                                        </c:forEach>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
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
        </script>
    </body>

</html>