<%-- 
    Document   : menu
    Created on : Jun 15, 2024, 7:04:09 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    /* Cơ bản cho navbar */
    .navbar {
        background-color: #ffffff; /* Màu nền sáng */
        box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* Thêm bóng mờ cho độ sâu */
        padding: 0.5rem 1rem; /* Chỉnh sửa khoảng cách padding */
    }

    .navbar-brand img {
        height: 90px; /* Điều chỉnh kích thước logo */
        padding: 5px 5px;
    }

    .navbar-toggler {
        border: none;
    }

    /* Điều chỉnh màu sắc và gạch chân khi hover nav-link */
    .navbar .navbar-nav .nav-link {
        color: #5a5a5a; /* Màu chữ tối màu sắc nhã nhặn */
        transition: color 0.3s ease; /* Hiệu ứng chuyển màu */
    }

    .navbar .navbar-nav .nav-link:hover, .navbar .navbar-nav .nav-link:focus {
        color: #007bff; /* Màu chữ khi hover */
        text-decoration: none; /* Bỏ gạch chân */
    }

    /* Dropdown menu */
    .dropdown-menu {
        border: 0; /* Bỏ viền dropdown */
        box-shadow: 0 4px 8px rgba(0,0,0,.05); /* Thêm bóng mờ */
    }

    .dropdown-item:hover, .dropdown-item:focus {
        background-color: #f8f9fa; /* Màu nền khi hover item */
        color: #007bff; /* Đổi màu chữ khi hover */
    }

    /* Biểu tượng người dùng trong dropdown */
    .nav-profile > .fa-circle-user {
        color: #007bff; /* Màu biểu tượng */
        margin-right: .5rem; /* Khoảng cách biểu tượng và text */
    }

    /* Cách biệt giữa các nav-item */
    .nav-item + .nav-item {
        margin-left: 20px; /* Khoảng cách giữa các mục */
    }

    /* Responsive adjustments */
    @media (max-width: 992px) {
        .navbar-brand img {
            height: 40px; /* Nhỏ logo một chút trên thiết bị di động */
        }
        /* Đảo ngược màu sắc cho navbar-toggler để nổi bật */
        .navbar-toggler {
            color: #007bff;
        }
    }
    .search-box button {
        position: absolute;
        background: none;
        border: none;
        color: #007bff;
        cursor: pointer;
        font-size: 16px;
    }
</style>
<link rel="stylesheet" href="./css/menu.css"/>
<!-- begin of Menu--->
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="img/360_F_128939133_0WXTVdZ1bv1NXusQsdYYJLIwTVoXHqQ7.jpg" class="img-fluid" alt="Sample image">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <form action="searchtext" method="post">
            <div class="search-box">
                <input name="txt"  value="${txtS}"type="text" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search..." style=" border-radius: 20px; padding-left: 10px; background-color: #fff; margin: 10px 10px; padding-right: 70px; font-size: 16px;">
                <button type="submit"><i class="fa-solid fa-magnifying-glass" style="font-size: 16px; padding-top: 18px;"></i></button>
            </div>
        </form>
        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav">
                <c:if test="${sessionScope.acc.roleID == 2}">
                    <li class="nav-item">
                        <b><a class="nav-link" href="manageMentor">Manage Mentor</a></b>
                    </li>
                    <li class="nav-item">
                        <b><a class="nav-link" href="manageCourse">Manage Course</a></b>
                    </li>
                    <li class="nav-item">
                        <b><a class="nav-link" href="statistic">Statistic</a></b>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">                    
                    <li class="nav-item dropdown pe-3">
                        <a class="nav-link nav-profile d-flex align-items-center pe-0" aria-expanded="true" data-bs-toggle="dropdown">
                            <span class="fa-solid fa-circle-user d-none d-md-block dropdown-toggle ps-2"> ${acc.email}</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                            <li class="dropdown-header d-flex align-items-center">
                                <h6>${acc.user}</h6>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="profile?id=${acc.id}">
                                    <i class="bi bi-person-fill "></i>
                                    <span> My Profile</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="logout">
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span>Log Out</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="Login">Login</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="path/to/chartjs/dist/chart.umd.js"></script>