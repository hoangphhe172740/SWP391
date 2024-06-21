<%-- 
    Document   : Success
    Created on : May 15, 2024, 4:15:38 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
        <link rel="stylesheet" href="./css/Home.css"/>
        <title>Home Page</title>
    </head>
    <style>

    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <section class="container-home">
                <div class="swiper mySwiper">
                    <div class="main-wrapper swiper-wrapper">
                    <c:forEach items="${cnew}" var="cnew">
                        <div class="main swiper-slide">
                            <div class="left-side">
                                <div class="main-wrapper">
                                    <h1 class="main-title"><a href="detail?Courseid=${cnew.id}">${cnew.name}</a></h1>
                                    <h3 class="main-header">${cnew.title}</h3>
                                    <h2 class="main-subtitle">${cnew.price}</h2>
                                </div>  
                            </div>
                            <div class="right-side">                                       
                                <img  class="swiper-slide img" src="${cnew.image}" alt="alt"/>
                            </div>
                        </div>                     
                    </c:forEach>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>


        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script>
        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 1,
            spaceBetween: 30,
            loop: true,
            pagination: {
                el: ".swiper-pagination",
                clickable: true
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev"
            }
        });
    </script>
</body>
</html>
