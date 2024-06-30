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
        .course-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Khoảng cách giữa các khóa học */
        }
        .course-card {
            display: none; /* Ẩn tất cả các khóa học ban đầu */
            flex: 0 0 30%; /* Mỗi khóa học chiếm 30% chiều rộng, có thể điều chỉnh */
            box-sizing: border-box; /* Bao gồm padding và border trong chiều rộng */
            margin-bottom: 20px; /* Khoảng cách dưới các khóa học */
        }
        .course-card.initial {
            display: block; /* Hiển thị các khóa học ban đầu */
        }
        .card-top {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
            width: 310px;
            height: 520px;

        }
        .card-top:hover {
            transform: scale(1.05);
        }
        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .e-learning-icon {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 5px 10px;
            border-radius: 4px;
            display: flex;
            align-items: center;
        }
        .card-body {
            padding: 15px;
        }
        .card-title a {
            text-decoration: none;
            color: #0056b3;
        }
        .card-title a:hover {
            text-decoration: underline;
        }
        .card-text {
            color: #555;
            margin-top: 10px;
        }
        .fa-star {
            color: yellowgreen;
        }
        .btn {
            display: inline-block;
            font-weight: 400;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            user-select: none;
            border: 1px solid transparent;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: 0.25rem;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        .btn-danger {
            color: #fff;
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

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
        </section>
        <section>
            <div style="padding-left: 80px;">
                <b style="padding-left: 5px; font-size: 20px;"><i class="fa-solid fa-graduation-cap"></i> SOME OUTSTANDING COURSES IN VARIOUS CATEGORIES:</b>
                <div class="col-sm-11 pt-4">
                    <div class="row">
                        <c:forEach items="${requestScope.listc}" var="c" varStatus="status">
                            <div class="col-lg-3 col-md-6 col-12 mb-4">
                                <div class="card-top course-card ${status.index < 4 ? 'initial' : ''}">
                                    <img class="card-img-top" src="${c.image}" alt="Card image cap">
                                    <div class="e-learning-icon">
                                        <i class="fa-solid fa-graduation-cap" style="padding: 10px 15px;
                                           color: #0056b3;"> E-Learning</i>
                                    </div>
                                    <div class="card-body">
                                        <h4 class="card-title"><a href="detail?Courseid=${c.id}" title="View Course">${c.name}</a></h4>                                       
                                        <p class="card-text"><b>Skills you'll gain:</b> ${c.title}</p>
                                        <i class="fa-solid fa-star" style="color: yellowgreen;"></i><b> 4.8</b>
                                        <div class="row">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="container" >
                        <button id="show-more">Show More</button>
                        <button id="show-less" style="display: none;">Show Less</button>
                    </div>
                </div>             
            </div>
        </section>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        <script>
            document.getElementById("show-more").addEventListener("click", function () {
                const hiddenCourses = document.querySelectorAll(".course-card:not(.initial)");
                hiddenCourses.forEach((course) => {
                    course.style.display = "block";
                });
                document.getElementById("show-less").style.display = "block"; // Hiển thị nút "Show Less"
                this.style.display = "none"; // Ẩn nút "Show More"
            });

            document.getElementById("show-less").addEventListener("click", function () {
                const allCourses = document.querySelectorAll(".course-card");
                allCourses.forEach((course, index) => {
                    if (!course.classList.contains("initial")) {
                        course.style.display = "none";
                    }
                });
                document.getElementById("show-more").style.display = "block"; // Hiển thị lại nút "Show More"
                this.style.display = "none"; // Ẩn nút "Show Less"
            });
        </script>
    </body>
</html>
