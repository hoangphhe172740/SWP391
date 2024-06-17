<%-- 
    Document   : managercouser
    Created on : Jun 17, 2024, 4:08:58 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <title>Manager Course</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Courses</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <button type="button" data-target="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
                                    <i class="material-icons">&#xE147;</i> <span>Add New Course</span>
                                </button>
                            </div>
                        </div>
                    </div>
                <c:if test="${listc.size() == 0}">
                    <h1>Contains no courses  </h1>
                </c:if>
                <c:if test="${listc.size() > 0}">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listc}" var="o">
                                <c:set var="Courseid" value="${o.id}"/>
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.name}</td>
                                    <td>
                                        <img src="${o.image}">
                                    </td>
                                    <td>${o.price} $</td>
                                    <td>
                                        <a href="loadProduct?pid=${o.id}" class="edit btn btn-info mb-3"><i
                                                class="material-icons"
                                                title="Edit">&#xE254;</i></a>
                                        <button id="buttonDelete" class="delete btn btn-info" product-id ="${o.id}" data-target="#deleteEmployeeModal" data-toggle="modal">
                                            <i class="material-icons" data-toggle="tooltip" 
                                               title="Delete">&#xE872;</i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </div>
                <a href="home"><button type="button" class="btn btn-primary">Back To Home</button></a>
        </div>
    </body>
</html>
