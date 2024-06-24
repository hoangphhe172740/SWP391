<%-- 
    Document   : managerMentor
    Created on : Jun 24, 2024, 5:25:22 PM
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
        <title>Manager Mentor</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="d-flex justify-content-between">
                            <div class="col-sm-6 pt-3">
                                <h2>Manage <b>Courses</b></h2>
                            </div>
                            <div class="col-sm-3 pt-3">
                                <button type="button" data-target="#addEmployeeModal" class="btn btn-success d-flex justify-content-center" data-toggle="modal">
                                    <i class="material-icons">&#xE147;</i> <span>Add New Mentor</span>
                                </button>
                            </div>
                        </div>
                    </div>
                <c:if test="${listMentor.size() == 0}">
                    <h1>Contain no Mentor</h1>
                </c:if>
                <c:if test="${listMentor.size() > 0}">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listMentor}" var="o">
                                <c:set var="Mentorid" value="${o.mentorId}"/>
                                <tr>
                                    <td>${o.mentorId}</td>
                                    <td>${o.mentorName}</td>
                                    <td>
                                        <img src="${o.image}" style="width: 200px; border-radius: 5px;">
                                    </td>

                                    <td>
                                        <a href="#=${o.mentorId}" class="edit btn btn-info mb-3"><i
                                                class="material-icons"
                                                title="Edit">&#xE254;</i></a>
                                        <button id="buttonDelete" class="delete btn btn-info" course-id ="${o.mentorId}" data-target="#deleteEmployeeModal" data-toggle="modal">
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
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
