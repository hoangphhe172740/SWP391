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
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Learning</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="d-flex justify-content-between">
                            <div class="col-sm-6 pt-3">
                                <a href="home" style="text-decoration: none;"><h2><b>My Learning</b></h2></a>
                            </div>                           
                        </div>
                    </div>
                <c:if test="${listcourse.size() == null}">
                    <h1>You have not participated in any courses yet</h1>
                </c:if>
                <c:if test="${listcourse.size() > 0}">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
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
