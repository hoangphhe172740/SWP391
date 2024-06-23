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
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-bottom: 20px;
        }

        .card-header.bg-primary {
            background-color: #007bff !important;
            color: #ffffff;
            font-size: 20px;
            font-weight: bold;
        }

        .card-body {
            padding: 20px;
        }

        .content-and-image {
            justify-content: space-between;
        }

        .text-section, .image-section {
            flex: 1;
        }

        .text-section {
            padding-right: 20px;
        }

        .e-learning-icon {
            display: flex;
            align-items: center;
            font-size: 18px;
            color: #007bff;
            margin-bottom: 15px;
        }

        .text-content p {
            color: #333;
            line-height: 1.6;
        }

        .text-content a {
            color: #007bff;
            text-decoration: none;
        }

        .image-section img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .card-title.show_txt {
            padding: 10px 0;
            font-size: 18px;
            font-weight: bold;
        }

        .btn.btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            color: #ffffff;
        }

        .btn.btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        /* Tổng quan và layout swiper */
        .swiper {
            overflow: hidden;
            width: 100%;
        }

        /* Tạo hiệu ứng border và box-shadow cho mỗi slide */
        .swiper-slide {
            display: flex;
            align-items: flex-end;
            justify-content: center;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            overflow: hidden;
        }
        

        /* Điều chỉnh cho ảnh sản phẩm trong các slide */
        .slide__product-image {
            width: 100%;
            height: auto;
            object-fit: cover; /* Đảm bảo ảnh không bị biến dạng */
        }

        /* Tạo kiểu cho tiêu đề sản phẩm */
        .card-title.show_txt {
            padding: 10px 0;
            font-size: 18px; /* Tăng kích thước font */
            font-weight: bold;
        }

        /* Button điều hướng (nếu bạn có sử dụng) */
        .swiper-button-next, .swiper-button-prev {
            color: #007bff; /* Màu sắc của buttons */
            font-size: 20px; /* Tăng kích thước để dễ nhấn hơn */
            border: none;
            background: transparent;
        }

        /* Pagination bullets */
        .swiper-pagination-bullet {
            background: #007bff; /* Màu sắc cho bullets */
            opacity: 1; /* Làm cho chúng luôn hiển thị */
        }

        .swiper-pagination-bullet-active {
            background: #ff6347; /* Màu sắc cho bullet đang active */
        }

        @media (max-width: 768px) {
            .content-and-image {
                flex-direction: column;
            }

            .text-section {
                padding-right: 0;
                padding-bottom: 20px;
            }
        }
    </style>
    <jsp:include page="menu.jsp"></jsp:include>
        <section class="container">
            <div>
                <div class="row">
                <c:set var="c" value="${requestScope.detail}"/>
                <div >
                    <div class="card bg-light mb-3">
                        <div class="card-body">
                            <div class="content-and-image d-flex flex-row align-items-start">
                                <div class="text-section">
                                    <div class="e-learning-icon">
                                        <i class="fa-solid fa-graduation-cap"> E-Learning</i>
                                    </div>
                                    <div class="text-content">
                                        <p class="text-left font-weight-bold">${c.name}</p>
                                        <p class="text-left">If you want to learn more about the course you are watching, you can buy it. We have many interesting courses. If you want to learn more, you can click<a href="search"> here.</a></p>
                                    </div>
                                </div>
                                <a href="" class="image-section" data-toggle="modal" data-target="#courseModal">
                                    <img class="img-fluid" src="${c.image}" alt="error"/>
                                </a>  
                            </div>
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
                    <div class="card-header bg-primary text-white text-uppercase"><i class="fa-brands fa-discourse"></i> Description</div>
                    <div class="card-body">
                        <p class="card-text">
                            ${c.description}
                        </p>
                    </div>
                </div>
            </div>
    </section>
    <section>
        <div class="col-12" id="reviews">
            <div class="card border-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa-brands fa-codepen"></i> Courses Similarly</div>
                <div>
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <c:forEach var="cc" items="${requestScope.cCate}">
                                <div class="swiper-slide">
                                    <div class="slide__product" style="padding-bottom: 20px;">
                                        <img class="slide__product-image" src="${cc.image}" alt="Card image cap">
                                        <div class="slide__product-detail">
                                            <h6 class="card-title show_txt bg-light text-center"><a href="detail?Courseid=${cc.id}" title="View Product">${cc.name}</a></h6>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${cc.price}$</p>
                                                </div>
                                            </div>
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
