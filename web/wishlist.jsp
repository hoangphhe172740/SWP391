<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wishlist</title>

        <style>
            /* General Styling */
            body {
                font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f4f4; /* Light background */
                color: #333; /* Dark text for contrast */
                margin: 0;
            }

            .container {
                max-width: 960px;
                margin: 20px auto;
                padding: 20px;
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            h2 {
                text-align: center;
                color: #3498db; /* Blue accent for heading */
                margin-bottom: 30px;
            }

            /* Wishlist Item Styling */
            .wishlist-item {
                display: flex;             /* Use flexbox for layout */
                align-items: center;       /* Vertically center items */
                justify-content: space-between; /* Space between image and details */
                border-bottom: 1px solid #eee; /* Divider between items */
                padding: 20px 0;         /* Top/bottom padding */
            }

            .wishlist-item div {        /* Container for image and course details */
                display: flex;            /* Use flexbox for layout */
                align-items: center;      /* Vertically center items */
            }

            .wishlist-item img {
                width: 100px;
                height: 100px;
                object-fit: cover;      /* Ensure image covers the container */
                border-radius: 5px;       /* Rounded corners */
                margin-right: 20px;       /* Spacing from details */
            }

            .wishlist-item h4 {
                margin: 0 0 5px;         /* Small bottom margin */
                color: #2c3e50;         /* Darker color for title */
            }

            .wishlist-item p {
                margin: 0;
                color: #7f8c8d;         /* Grey color for details */
                font-size: 14px;
            }
           
            /* Button Styling */
            .wishlist-item .btn-remove {
                background-color: #e74c3c; /* Red for remove button */
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .wishlist-item .btn-remove:hover {
                background-color: #c0392b; /* Darker red on hover */
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <h2><b>Wish list</b></h2>
            <c:forEach var="course" items="${wishlist}">
                <div class="wishlist-item">
                    <div>
                        <img src="${course.image}" alt="${course.name}" style="width: 100px; height: 100px; object-fit: cover;">
                        <h4>${course.name}</h4>
                        <p>Title: ${course.title}</p>
                        <p>Mentor: ${course.mentorName}</p>
                    </div>
                    <form action="addToWishlist" method="post">
                        <input type="hidden" name="courseId" value="${course.id}">
                        <button type="submit" class="btn btn-danger">Remove</button>
                        <b><button type="button" class="btn btn-success"><a href="load-historyjoin?Courseid=${course.id}" style="color: #fff; text-decoration: none; ">Join now</a></button></b>
                    </form>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
