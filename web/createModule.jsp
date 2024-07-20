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
        /* General Styling */
        body {
            font-family: 'Montserrat', sans-serif;   /* Sleek, modern font */
            background-color: #f5f5f5;               /* Soft, off-white background */
            color: #333;                            /* Dark grey text for readability */
            line-height: 1.6;                        /* Improved line height for comfort */
        }

        .container {
            max-width: 800px;                      /* Adjusted container width */
            margin: 40px auto;                       /* Centered container */
            padding: 30px;
            background: white;
            border-radius: 12px;                     /* Slightly larger radius for softer look */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* More subtle shadow for depth */
        }

        /* Heading */
        h2 {
            text-align: center;
            font-weight: 600;                        /* Medium weight for a refined look */
            color: #2980b9;                          /* Vibrant blue accent */
            margin-bottom: 30px;
        }

        /* Form Elements */
        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;                         /* Slightly bolder labels */
        }

        input[type="text"], select {
            width: 100%;
            padding: 12px;                          /* Increased padding for comfort */
            border: 1px solid #ddd;
            border-radius: 8px;                      /* Rounded corners for inputs */
            box-sizing: border-box;
            transition: border-color 0.3s;           /* Smooth transition on focus */
        }

        input[type="text"]:focus, select:focus {
            border-color: #3498db;                  /* Blue accent on focus */
            outline: none;
        }

        /* Button */
        button[type="submit"] {
            background-color: #2980b9;             /* Vibrant blue */
            color: white;
            padding: 14px 25px;                    /* Larger padding for a bolder button */
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;                       /* Medium font weight for button */
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #207cca;             /* Slightly darker blue on hover */
        }

        .btn {
            display: inline-block; /* Make the button an inline-block element */
            padding: 10px 20px; /* Adjust padding as needed */
            background-color: #2980b9; /* Blue accent color */
            color: #fff;
            text-decoration: none; /* Remove default link underline */
            border: none;
            border-radius: 5px; /* Add rounded corners */
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease; /* Add smooth transition for background color */
        }

        .btn:hover {
            background-color: #2471a3; /* Darker blue on hover */
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .container {
                max-width: 90%;
                padding: 20px;
            }
        }


    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
            <c:if test="${requestScope.report != nulls}">
                <p>${requestScope.report}</p>
            </c:if>
            <h2>Add New Module</h2>
            <form action="create-module" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail1">Module Name</label>
                    <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Module Name" required="">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlSelect2">Course</label>
                    <input type="text" class="form-control" value="${requestScope.courses.name}" readonly="">
                    <input type="text" name="courseID" class="form-control" value="${requestScope.courses.id}" readonly="" hidden="">
                </div>
                <button type="submit" class="btn btn-primary">Add</button>
                <button><a href="mentor-manager"></a>Back</button>
            </form>
            
        </div>
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
