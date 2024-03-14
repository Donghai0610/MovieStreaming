<%-- 
    Document   : payment
    Created on : Nov 6, 2023, 4:45:25 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Payment gateway</title>
        <link rel="stylesheet" type="text/css" href="./css/style.css">
    </head>
    <body>
        <c:set var="a" value="${requestScope.movie}"/>
        <header>
            <div class="container">
                <div class="left">
                    <h3>Movie PayMent</h3>
                    <form action="vnpayajax" method="POST">

                        <input type="hidden" id="" name="movieID" value="${a.id}">
                        <input type="hidden" Checked="True" id="bankCode" name="bankCode" value="">
                        Movie Name
                        <input type="text" name="upload" placeholder="Enter name" value="${a.name}">
                        Price
                        <input type="text" name="amount" placeholder="" value="${a.price}">
                        
                        <input readonly type="hidden" name="cmd" placeholder="" value="1">
                        <button type="submit" class="fa-angle-down" href><i class="fa fa-university" aria-hidden="true">Thanh Toan</i></button>
                    </form>
                </div>
                        <div class="right" style="display: flex;justify-content: center">
                    <img src="${a.image}"  height="450" alt="alt"/>
                </div>
            </div>
        </header>
    </body>
</html>
