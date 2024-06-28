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
        <title>Join Course</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            /* General Styles */
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f8f9fa;
                color: #333;
                padding: 20px;
                margin: 0;
            }

            /* Container Styles */
            .container {
                width: 100%;
                max-width: 900px;
                margin: 20px auto;
                padding: 20px;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Section Styles */
            .section {
                margin-bottom: 20px;
            }

            .section-title {
                font-size: 18px;
                font-weight: bold;
                display: flex;
                align-items: center;
                cursor: pointer;
                padding: 10px;
                background: #007bff;
                color: white;
                border-radius: 4px;
                transition: background 0.3s, color 0.3s;
            }

            .section-title:hover {
                background: #0056b3;
            }

            .section-title i {
                margin-right: 10px;
            }

            .section-content {
                display: none;
                padding: 10px;
                border-left: 3px solid #007bff;
                background: #e9ecef;
                border-radius: 4px;
                margin-top: 10px;
            }

            /* Dropdown Styles */
            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown button {
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                cursor: pointer;
                border-radius: 4px;
                transition: background 0.3s;
            }

            .dropdown button:hover {
                background-color: #0056b3;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
                border-radius: 4px;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                border-bottom: 1px solid #ddd;
                transition: background 0.3s;
            }

            .dropdown-content a:hover {
                background-color: #ddd;
            }

            .dropdown-content a:last-child {
                border-bottom: none;
            }

            /* Course Item Styles */
            .course-item {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
                color: #333;
            }

            .course-item i {
                margin-right: 10px;
                color: #007bff;
            }

            .course-item span {
                font-size: 14px;
                color: #888;
                margin-left: auto;
            }

            .card-body {
                background-color: #fff;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .card-content h4 {
                margin: 0;
                font-size: 24px;
                color: #007bff;
            }

            .card-content h4 i {
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>

            <div class="container">
                <section class="section">
                    <div class="row">
                    <c:set var="c" value="${listc}" />               
                    <div class="card-body d-flex justify-content-between">
                        <div class="card-content">
                            <h4><b class="text-left font-weight-bold" style="padding-left: 30px;"><i class="fa-solid fa-graduation-cap" style="color: #007bff;"></i> ${c.name}</b></h4>
                        </div>                       
                    </div>
                    <div class="dropdown">
                        <button id="dropdownButton" style="background-color: #f8f9fa; color: #333;">Course Material</button>

                        <div class="dropdown-content" id="dropdownContent">
                            <c:forEach items="${requestScope.listModule}" var="o">
                                <a href="load-module?moduleID=${o.module_id}"><p>${o.module_name}</p></a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section">
                <c:forEach var="o" items="${Listlesson}">
                    <div class="section">
                        <div class="section-title" onclick="toggleSection(this)">
                            <i class="fas fa-chevron-down"></i> ${o.lesson_name}
                        </div>
                        <div class="section-content">
                            <div class="course-item">
                                <i>${o.lesson_video}</i>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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
        </script>
    </body>
</html>