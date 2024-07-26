

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"/>
        <title>Join Course</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            /* Áp dụng cho toàn bộ section */
            .section {
                padding: 20px;
                background-color: #f2f2f2; /* Màu nền nhẹ nhàng cho section */
            }

            /* Kiểu dáng cho card */
            .card-body {
                background-color: white; /* Nền trắng cho card */
                padding: 20px;
                border-radius: 8px; /* Bo tròn góc */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
                margin-bottom: 20px; /* Khoảng cách giữa các card */
                display: flex;
                align-items: center;
                justify-content: space-between; /* Đề phần nội dung và button cách xa nhau */
            }

            /* Styling cho tiêu đề card */
            .card-content h4 {
                color: #333; /* Màu chữ đậm */
                font-size: 24px;
            }

            /* Kiểu dáng cho dropdown */
            .dropdown button {
                border: none;
                padding: 10px 20px;
                margin: 10px 0; /* Khoảng cách với các phần tử xung quanh */
                border-radius: 5px; /* Bo tròn góc */
                font-size: 16px;
                cursor: pointer; /* Hiệu ứng con trỏ khi hover */
                display: flex;
                align-items: center;
            }

            /* Hiệu ứng khi hover qua button */
            .dropdown button:hover {
                background-color: #e2e2e2;
            }

            /* Kiểu dáng cho nội dung dropdown */
            .dropdown-content {
                display: none; /* Ẩn mặc định */
                position: absolute; /* Hiển thị nổi */
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); /* Đổ bóng */
                z-index: 1;
                border-radius: 5px;
                padding: 10px 0;
            }

            /* Kiểu dáng cho links trong dropdown */
            .dropdown-content a {
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                color: #333;
            }

            /* Hiệu ứng khi hover qua links */
            .dropdown-content a:hover {
                background-color: #ddd;
            }

            /* Kiểu dáng cho nội dung module */
            .module-content {
                padding-left: 30px; /* Paddng bên trái */
                margin-left: 20px; /* Khoảng cách về bên trái so với dropdown */
                border-left: 2px solid #007bff; /* Đường dọc màu xanh */
            }

            /* Hiệu ứng mở dropdown */
            .dropdown-content.show {
                display: block;
            }
            .review-list ul li .left span {
                width: 32px;
                height: 32px;
                display: inline-block;
            }
            .review-list ul li .left {
                flex: none;
                max-width: none;
                margin: 0 10px 0 0;
            }
            .review-list ul li .left span img {
                border-radius: 50%;
            }
            .review-list ul li .right h4 {
                font-size: 16px;
                margin: 0;
                display: flex;
            }
            .review-list ul li .right h4 .gig-rating {
                display: flex;
                align-items: center;
                margin-left: 10px;
                color: #ffbf00;
            }
            .review-list ul li .right h4 .gig-rating svg {
                margin: 0 4px 0 0px;
            }
            .country .country-flag {
                width: 16px;
                height: 16px;
                vertical-align: text-bottom;
                margin: 0 7px 0 0px;
                border: 1px solid #fff;
                border-radius: 50px;
                box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
            }
            .country .country-name {
                color: #95979d;
                font-size: 13px;
                font-weight: 600;
            }
            .review-list ul li {
                border-bottom: 1px solid #dadbdd;
                padding: 0 0 30px;
                margin: 0 0 30px;
            }
            .review-list ul li .right {
                flex: auto;
            }
            .review-list ul li .review-description {
                margin: 20px 0 0;
            }
            .review-list ul li .review-description p {
                font-size: 14px;
                margin: 0;
            }
            .review-list ul li .publish {
                font-size: 13px;
                color: #95979d;
            }

            .review-section h4 {
                font-size: 20px;
                color: #222325;
                font-weight: 700;
            }
            .review-section .stars-counters tr .stars-filter.fit-button {
                padding: 6px;
                border: none;
                color: #4a73e8;
                text-align: left;
            }
            .review-section .fit-progressbar-bar .fit-progressbar-background {
                position: relative;
                height: 8px;
                background: #efeff0;
                -webkit-box-flex: 1;
                -ms-flex-positive: 1;
                flex-grow: 1;
                box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
                background-color: #ffffff;
                ;
                border-radius: 999px;
            }
            .review-section .stars-counters tr .star-progress-bar .progress-fill {
                background-color: #ffb33e;
            }
            .review-section .fit-progressbar-bar .progress-fill {
                background: #2cdd9b;
                background-color: rgb(29, 191, 115);
                height: 100%;
                position: absolute;
                left: 0;
                z-index: 1;
                border-radius: 999px;
            }
            .review-section .fit-progressbar-bar {
                display: flex;
                align-items: center;
            }
            .review-section .stars-counters td {
                white-space: nowrap;
            }
            .review-section .stars-counters tr .progress-bar-container {
                width: 100%;
                padding: 0 10px 0 6px;
                margin: auto;
            }
            .ranking h6 {
                font-weight: 600;
                padding-bottom: 16px;
            }
            .ranking li {
                display: flex;
                justify-content: space-between;
                color: #95979d;
                padding-bottom: 8px;
            }
            .review-section .stars-counters td.star-num {
                color: #4a73e8;
            }
            .ranking li>span {
                color: #62646a;
                white-space: nowrap;
                margin-left: 12px;
            }
            .review-section {
                border-bottom: 1px solid #dadbdd;
                padding-bottom: 24px;
                margin-bottom: 34px;
                padding-top: 64px;
            }
            .review-section select, .review-section .select2-container {
                width: 188px !important;
                border-radius: 3px;
            }
            ul, ul li {
                list-style: none;
                margin: 0px;
            }
            .helpful-thumbs, .helpful-thumb {
                display: flex;
                align-items: center;
                font-weight: 700;
            }
        </style>

    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div>
                <section class="section">
                    <div class="row">
                    <c:set var="c" value="${listc}" />               
                    <div class="card-body d-flex justify-content-between">
                        <div class="card-content">
                            <h4><b class="text-left font-weight-bold" style="padding-left: 30px;"><i class="fa-solid fa-graduation-cap" style="color: #007bff;"></i> ${c.name}</b></h4>
                        </div>                       
                    </div>
                    <div class="d-flex">
                        <div class="dropdown">
                            <button id="dropdownButton" style="background-color: #f8f9fa; color: #333;"><i class="fas fa-chevron-down" onclick="toggleSection(this)"></i> Course Material</button>

                            <div class="dropdown-content" id="dropdownContent">
                                <c:forEach items="${requestScope.listModule}" var="o">
                                    <a href="#" onclick="showLessons(${o.module_id});"><p>${o.module_name}</p></a>
                                        </c:forEach>
                            </div>
                        </div>
                        <div class="module-content" id="moduleContent">
                            <h2>Select a module to view lessons</h2>
                        </div>
                    </div>
                    <div class="container">
                        <div id="reviews" class="review-section">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h4 class="m-0">${requestScope.listc.list.size()} Reviews</h4>
                                <select class="custom-select custom-select-sm border-0 shadow-sm ml-2 select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true">
                                    <option data-select2-id="3">Most Relevant</option>
                                    <option>Most Recent</option>
                                </select>
                                <span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="2" style="width: 188px;"><span class="selection">
                                        <span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-qd66-container">
                                            <span class="select2-selection__rendered" id="select2-qd66-container" role="textbox" aria-readonly="true" title="Most Relevant">Most Relevant</span>
                                            <span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span>
                                        </span>
                                    </span>
                                    <span class="dropdown-wrapper" aria-hidden="true"></span>
                                </span>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <table class="stars-counters">
                                        <tbody>
                                            <tr class="">
                                                <td>
                                                    <span>
                                                        <button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">5 Stars</button>
                                                    </span>
                                                </td>
                                                <td class="progress-bar-container">
                                                    <div class="fit-progressbar fit-progressbar-bar star-progress-bar">
                                                        <div class="fit-progressbar-background">
                                                            <span class="progress-fill" style="width: 97.2973%;"></span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="star-num">(36)</td>
                                            </tr>
                                            <tr class="">
                                                <td>
                                                    <span>
                                                        <button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">5 Stars</button>
                                                    </span>
                                                </td>
                                                <td class="progress-bar-container">
                                                    <div class="fit-progressbar fit-progressbar-bar star-progress-bar"><div class="fit-progressbar-background">
                                                            <span class="progress-fill" style="width: 2.2973%;"></span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="star-num">(2)</td>
                                            </tr>
                                            <tr class="">
                                                <td>
                                                    <span>
                                                        <button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">5 Stars</button>
                                                    </span>
                                                </td>
                                                <td class="progress-bar-container">
                                                    <div class="fit-progressbar fit-progressbar-bar star-progress-bar">
                                                        <div class="fit-progressbar-background">
                                                            <span class="progress-fill" style="width: 0;"></span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="star-num">(0)</td>
                                            </tr>
                                            <tr class="">
                                                <td>
                                                    <span>
                                                        <button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">5 Stars</button>
                                                    </span>
                                                </td>
                                                <td class="progress-bar-container">
                                                    <div class="fit-progressbar fit-progressbar-bar star-progress-bar">
                                                        <div class="fit-progressbar-background">
                                                            <span class="progress-fill" style="width: 0;"></span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="star-num">(0)</td>
                                            </tr>
                                            <tr class="">
                                                <td><span>
                                                        <button class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">5 Stars</button>
                                                    </span>
                                                </td>
                                                <td class="progress-bar-container">
                                                    <div class="fit-progressbar fit-progressbar-bar star-progress-bar">
                                                        <div class="fit-progressbar-background">
                                                            <span class="progress-fill" style="width: 0;"></span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="star-num">(0)</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="review-list">
                            <ul>
                                <c:forEach items="${requestScope.listc.list}" var="item">
                                    <li>
                                        <div class="d-flex">
                                            <div class="left">
                                                <span>
                                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="profile-pict-img img-fluid" alt="" />
                                                </span>
                                            </div>
                                            <div class="right">
                                                <h4>
                                                    ${item.user.user}
                                                    <span class="gig-rating text-body-2">
                                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792" width="15" height="15">
                                                        <path
                                                            fill="currentColor"
                                                            d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"
                                                            ></path>
                                                        </svg>
                                                        5.0</span>
                                                </h4>
                                                <div class="country d-flex align-items-center">
                                                    <span>
                                                        <img class="country-flag img-fluid" src="https://bootdey.com/img/Content/avatar/avatar6.png" />
                                                    </span>
                                                </div>
                                                <div class="review-description">
                                                    <p>
                                                        ${item.content}
                                                    </p>
                                                </div>
                                                <span class="publish py-3 d-inline-block w-100">
                                                    <fmt:parseDate value="${item.createdDate}" pattern="yyyy-MM-dd'T'HH:mm" var="detailTime" type="both" /> 
                                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDateTime}" />
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </section> 
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                        document.getElementById("dropdownButton").addEventListener("click", function () {
                                            const dropdownContent = document.getElementById("dropdownContent");
                                            if (dropdownContent.style.display === "block") {
                                                dropdownContent.style.display = "none";
                                            } else {
                                                dropdownContent.style.display = "block";
                                            }
                                        });

                                        // Đóng dropdown nếu click ra ngoài
                                        window.onclick = function (event) {
                                            if (!event.target.matches('#dropdownButton')) {
                                                const dropdowns = document.getElementsByClassName("dropdown-content");
                                                for (let i = 0; i < dropdowns.length; i++) {
                                                    const openDropdown = dropdowns[i];
                                                    if (openDropdown.style.display === "block") {
                                                        openDropdown.style.display = "none";
                                                    }
                                                }
                                            }
                                        };

                                        function toggleSection(element) {
                                            const sectionContent = element.nextElementSibling;
                                            const icon = element.querySelector("i");
                                            if (sectionContent.style.display === "none" || sectionContent.style.display === "") {
                                                sectionContent.style.display = "block";
                                                icon.classList.remove("fa-chevron-down");
                                                icon.classList.add("fa-chevron-up");
                                            } else {
                                                sectionContent.style.display = "none";
                                                icon.classList.remove("fa-chevron-up");
                                                icon.classList.add("fa-chevron-down");
                                            }
                                        }
                                        function showLessons(moduleId) {
                                            $.ajax({
                                                url: 'load-module', // URL của servlet xử lý yêu cầu
                                                method: 'GET',
                                                data: {moduleId: moduleId},
                                                success: function (response) {
                                                    $('#moduleContent').html(response);
                                                }
                                            });
                                        }
        </script>
    </body>
</html>