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

    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="d-flex justify-content-between">
                            <div class="col-sm-6 pt-3">
                                <a href="home" style="text-decoration: none; color: #fff;"><b><h2>Mentor Manage</h2></b></a>
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
                            <th>View Module</th>
                            <th>Add Module</th>                            
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
                                    <a href="display-modules?courseid=${o.id}"" class="edit btn btn-info mb-3"><i
                                            class="fa-solid fa-eye"
                                            title="View Module"></i></a>                                   
                                </td>
                                <td>
                                    <a href="create-module?courseid=${o.id}"><i class="fa-solid fa-plus"></i></a>
                                </td>
                                
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>
        
    </body>
</html>
