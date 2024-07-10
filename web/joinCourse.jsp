<%-- 
    Document   : joinCourse
    Created on : Jun 28, 2024, 2:50:02 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
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