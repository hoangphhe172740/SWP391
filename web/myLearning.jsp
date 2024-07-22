<%-- 
    Document   : myLearning
    Created on : Jul 7, 2024, 7:32:05 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Learning</title>
    </head>
    <style>
        /* Global Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f5;
        }

        /* Header Styles */
        .table-wrapper {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            margin: 30px 0;
        }

        .table-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            font-size: 24px;
            font-weight: bold;
        }

        /* Table Styles */
        .table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        .table th,
        .table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .table th {
            background-color: #f5f5f5;
            font-weight: bold;
        }

        .table tr:hover {
            background-color: #f5f5f5;
        }

        /* Image Styles */
        .table td img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }

        /* Button Styles */
        .join-now-btn {
            display: inline-block;
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .join-now-btn:hover {
            background-color: #0056b3;
        }

        .btn-primary {
            margin-top: 20px;
        }

        .progress-bar {
            width: 100%;
            background-color: #f3f3f3;
            border-radius: 25px;
            overflow: hidden;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .progress-bar-fill {
            display: block;
            height: 30px;
            background-color: #4caf50;
            text-align: center;
            line-height: 30px;
            color: white;
            font-weight: bold;
            transition: width 0.4s ease;
        }
    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="d-flex justify-content-between">
                        <div class="col-sm-6 pt-3">
                            <a href="home" style="text-decoration: none; color: #fff;"><h2><b>My Learning</b></h2></a>
                        </div>
                    </div>
                </div>
                <c:if test="${listcourse.size() == 0}">
                    <h1 class="btn btn-danger" style=" padding: 10px 10px;"><i class="fa-solid fa-circle-exclamation"></i> You have not participated in any courses yet</h1>
                </c:if>
                <c:if test="${listcourse.size() > 0}">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Progress</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listcourse}" var="o">
                                <tr>
                                    <td>${o.courseID}</td>
                                    <td>${o.courseName}</td>
                                    <td>
                                        <img src="${o.courseImage}" style="width: 300px; border-radius: 5px;">
                                    </td>
                                    <td>
                                        <div class="progress-bar">
                                            <div class="progress-bar-fill" style="width: ${o.courseProgress}%;">
                                                ${o.courseProgress} %
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <button class="join-now-btn col">
                                            <b><a href="join-course?Courseid=${o.courseID}" style=" text-decoration: none; color: #fff;">Enrolled</a></b>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
           
        </div>
    </body>
</html>
