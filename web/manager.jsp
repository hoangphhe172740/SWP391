<%-- 
    Document   : manager
    Created on : Jun 28, 2024, 1:40:50 PM
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
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/manager.css"/>
        <title>Add lesson</title>
    </head>
    <style>
        /* Reset some default styles */
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        /* Container styles */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Table styles */
        .table-wrapper {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            overflow: hidden;
        }

        .table-title {
            background-color: #4CAF50;
            color: #fff;
            padding: 15px 30px;
            font-size: 24px;
            font-weight: bold;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        .table th, .table td {
            padding: 12px 15px;
            text-align: left;
        }

        .table th {
            background-color: #f2f2f2;
        }

        .table tbody tr:nth-of-type(even) {
            background-color: #f2f2f2;
        }

        .table tbody tr:hover {
            background-color: #e6e6e6;
        }

        /* Button styles */
        .btn {
            display: inline-block;
            padding: 8px 16px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .btn-info {
            background-color: #17a2b8;
            color: #fff;
        }

        .btn-info:hover {
            background-color: #138496;
        }

        .btn-success {
            background-color: #4CAF50;
            color: #fff;
        }

        .btn-success:hover {
            background-color: #398439;
        }

        /* Image styles */
        .table img {
            max-width: 300px;
            border-radius: 5px;
        }
    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="d-flex justify-content-between">
                            <div class="col-sm-6 pt-3">
                                <a href="home" style="text-decoration: none; color: #fff;"><h2>Mentor <b>Manage</b></h2></a>
                            </div>                       
                        </div>
                    </div>
                </div>
            <c:if test="${listCourse.size() == 0}">
                <h1>Contain no course</h1>
            </c:if>
            <c:if test="${listCourse.size() > 0}">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Actions</th>
                            <th>Add Quiz</th>
                            <th>Question</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listCourse}" var="o">
                            <c:set var="Courseid" value="${o.id}"/>
                            <tr>
                                <td>${o.id}</td>
                                <td>${o.name}</td>
                                <td>
                                    <img src="${o.image}" style="width: 300px; border-radius: 5px;">
                                </td>
                                <td>
                                    <a href="load-lesson?courseid=${o.id}" class="edit btn btn-info mb-3"><i
                                            class="material-icons"
                                            title="Add Lesson">&#xE254;</i></a>                                   
                                </td>
                                <td>
                                    <a href="load-quiz?courseid=${o.id}"><i class="fa-solid fa-plus"></i></a>
                                </td>
                                <td>
                                    <a href="#"><i class="fa-solid fa-circle-question"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>
        <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
            <a href="home" class="btn btn-success">
                <i class="fas fa-arrow-left mr-2"></i> Back to Home
            </a>
        </div>
    </body>
</html>
