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
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
        }

        .top-area {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 6px 0 rgba(0,0,0,0.1);
        }

        .top-area div, .top-area form {
            flex: 1;
        }

        .search-box {
            display: flex;
            position: relative;
            max-width: 600px; /* Adjust based on your preference */
            margin-left: auto; /* Aligns the search box to the right */
            margin-right: 20px;
        }

        .search-box input[type="text"] {
            width: 100%;
            padding: 10px 20px;
            border: 1px solid #ccc;
            border-radius: 20px;
            font-size: 16px;
            background-color: #fff;
            outline: none;
        }

        .search-box button {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background-color: transparent;
            border: none;
            cursor: pointer;
            color: #333;
            outline: none;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 5px;
            background-color: #f8f9fa;
            margin-bottom: 20px;
        }

        .card-body {
            padding: 20px;
            background-color: #F2F6FD;
        }

        .content-and-image {
            display: flex;
            align-items: start; /* Bảo đảm nội dung và hình ảnh cùng căn đầu */
        }

        .text-section {
            flex: 1; /* Cho phép chiếm đa số không gian khi có thể */
            padding-right: 20px; /* Tạo khoảng cách giữa văn bản và hình ảnh */
        }

        .e-learning-icon {
            font-size: 20px;
            margin-bottom: 10px;
            color: #007bff;
            padding-bottom: 30px;
        }

        .text-content p {
            text-align: left;
            margin-bottom: 10px;
        }

        .text-content p:first-child {
            font-size: 40px;
            font-weight: bold;
        }

        .text-content p:last-child {
            font-size: 18px;
            width: 700px;
        }

        .image-section img {
            max-width: 100%;
            border-radius: 50%; /* Khuyến khích sử dụng khi hình ảnh cần được bo tròn */
        }
        /* Cố định phong cách cho toàn bộ section */
        #reviews {
            padding: 20px;
            background-color: #f4f4f4; /* Màu nền nhẹ cho phần reviews */
        }

        /* Phong cách cho card */
        .card.border-light.mb-3 {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Bóng đổ nhẹ */
            border-radius: 8px; /* Bo tròn góc của card */
        }

        /* Phong cách cho tiêu đề của card */
        .card-header.bg-primary.text-white.text-uppercase {
            display: flex;
            align-items: center;
            font-size: 18px;
            padding-left: 15px; /* Độ lệch sang trái cho biểu tượng và văn bản */
        }
        .show_txt.bg-light.text-center {
            margin-top: 10px;
            background-color: #ffffff; /* Màu nền cho tiêu đề */
            padding: 5px 10px; /* Đệm cho tiêu đề */
            border-radius: 5px;  /* Bo tròn góc cho tiêu đề */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Bóng đổ nhẹ */
        }

        /* Phong cách cho liên kết */
        .show_txt.bg-light.text-center a {
            color: #007bff;  /* Màu cho liên kết */
            text-decoration: none;
        }
        .swiper-slide {
            height: auto; /* Hoặc có thể thử cố định chiều cao bằng px */
            display: flex;
            flex-direction: column;
        }

        .slide__product-image {
            width: auto;  /* Đảm bảo chiều ngang tự động điều chỉnh */
            max-height: 200px; /* Cố định chiều cao tối đa */
            object-fit: cover; /* Đảm bảo hình ảnh che kín khu vực được chỉ định */
        }

        .swiper-slide, .slide__product-detail {
            display: flex;
            flex-direction: column;
            justify-content: center; /* Căn giữa nội dung cho đồng đều */
            align-items: center; /* Đảm bảo chiều rộng đồng đều */
        }
    </style>
    <section class="top-area">
        <div>
            <a href="#"><img src="img/360_F_128939133_0WXTVdZ1bv1NXusQsdYYJLIwTVoXHqQ7.jpg" alt="" width="90px"/></a>
        </div>
        <form action="seachtext" method="post">
            <div class="search-box">
                <input name="txt"  value="${txtS}"type="text" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search..." style=" border-radius: 20px;padding-left: 10px;background-color: #fff;margin: 10px 10px;padding-right: 70px;font-size: 16px;">
                <button type="submit"><i class="fa-solid fa-magnifying-glass" style="font-size: 16px;"></i></button>
            </div>
        </form>
    </section>
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
                                            <h6 class="card-title show_txt bg-light text-center"><a href="detail?pid=${cc.id}" title="View Product">${cc.name}</a></h6>
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
