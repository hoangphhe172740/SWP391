<%-- 
    Document   : detail
    Created on : Jun 15, 2024, 10:37:34 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />   
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/footer.css"/>
        <link rel="stylesheet" href="./css/detail.css"/>
        <title>Course Detail</title>
    </head>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            padding: 20px;
            margin: 0;
        }

        /* Container Styles */
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card {
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .card-body {
            padding: 20px;
        }

        .content-and-image {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
        }

        .text-section {
            flex: 1;
        }

        .text-content {
            margin-top: 10px;
        }

        .text-content p {
            font-size: 16px;
        }

        .image-section {
            flex: 1;
        }

        .course-image {
            max-width: 100%;
            height: auto;
            border-radius: 8px;

        }

        .join-now-btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-align: center;
            width: 150px;
            height: 50px;

        }

        .join-now-btn:hover {
            background-color: #0056b3;
        }

        .card-header {
            border-radius: 8px 8px 0 0;
        }

        .card-text {
            font-size: 16px;
        }

        .swiper {
            width: 100%;
            height: 100%;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .slide__product {
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s;
        }

        .slide__product:hover {
            transform: scale(1.05);
        }

        .slide__product-image {
            width: 100%;
            height: auto;
        }

        .slide__product-detail {
            padding: 10px;
        }

        .slide__product-detail h6 {
            margin: 0;
        }

        .text-center {
            font-size: 16px;
            padding: 10px;
        }

        @media screen and (max-width: 768px) {
            .container {
                padding: 10px;
            }

            .content-and-image {
                flex-direction: column;
                text-align: center;

            }

            .text-content p {
                font-size: 14px;
            }

            .card-text {
                font-size: 14px;
            }

            .swiper-slide {
                font-size: 16px;
            }

            .text-center {
                font-size: 14px;
            }
        }
    </style>
    <jsp:include page="menu.jsp"></jsp:include>
        <section class="container">
            <div>
                <div class="row">
                <c:set var="c" value="${requestScope.detail}"/>
                <div>
                    <div class="card bg-light mb-3">
                        <div class="card-body">
                            <div class="content-and-image d-flex">
                                <div class="text-section">
                                    <%
                                    String message = request.getParameter("mess");

                                    if (message != null && !message.isEmpty()) {
                                    out.println("<div class='alert alert-warning'>" + message + "</div>");
                                    }
                                    %>
                                    <div class="e-learning-icon">
                                        <i class="fa-solid fa-graduation-cap"> E-Learning</i>
                                    </div>
                                    <div class="text-content">
                                        <p class="text-left font-weight-bold" style="font-size: 30px;">${c.name}</p>
                                        <p class="text-left">
                                            If you want to learn more about the course you are watching, you can buy it. We have many interesting courses. If you want to learn more, you can click
                                            <a href="search"> here.</a>
                                        </p>
                                    </div>
                                </div>
                                <a href="" class="image-section" data-toggle="modal" data-target="#courseModal">
                                    <img class="img-fluid course-image" src="${c.image}" alt="error"/>
                                </a>
                            </div>
                            <c:if test="${Enrolled == null}">
                                <button class="join-now-btn col">
                                    <b><a href="load-historyjoin?Courseid=${c.id}" style="color: #fff; text-decoration: none;">Join now</a></b>
                                </button>
                                <button class="join-now-btn btn-info col">
                                    <b><a href="addToWishlist?courseId=${c.id}" style="color: #fff; text-decoration: none;">Add to wish list</a></b>
                                </button>
                            </c:if>
                            <c:if test="${Enrolled != null}">
                                <button class="join-now-btn col">
                                    <b><a href="join-course?Courseid=${c.id}" style="color: #fff; text-decoration: none;">Enrolled</a></b>
                                </button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="container">
        <div class="row">
            <!-- Description -->
            <div class="col-12">
                <div class="card border-light mb-3">
                    <div class="card-header bg-primary text-white text-uppercase">
                        <i class="fa-brands fa-discourse"></i> Description
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            ${c.description}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="col-12" id="reviews">
            <div class="card border-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase">
                    <i class="fa-brands fa-codepen"></i> Courses Similarly
                </div>
                <div>
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <c:forEach var="cc" items="${requestScope.cCate}">
                                <div class="swiper-slide">
                                    <div class="slide__product" style="padding-bottom: 20px; width: 400px;">
                                        <img class="slide__product-image" src="${cc.image}" alt="Card image cap">
                                        <div class="slide__product-detail">
                                            <h6 class="card-title show_txt bg-light text-center">
                                                <a href="detail?Courseid=${cc.id}" title="View Product">${cc.name}</a>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="Footer.jsp"></jsp:include>
    <script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script type="text/javascript">
        var swiper = new Swiper(".mySwiper", {
            autoHeight: true, // Cài đặt này cho phép swiper điều chỉnh chiều cao tự động
            slidesPerView: 3,
            spaceBetween: 30,
            pagination: {
                el: ".swiper-pagination",
                clickable: true
            }
        });
    </script>
</html>
