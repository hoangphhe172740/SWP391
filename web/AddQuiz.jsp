<%-- 
    Document   : AddQuiz
    Created on : Jul 10, 2024, 9:19:40 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Quiz</title>
    </head>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Menu styles */
        .menu {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
        }

        .menu ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        .menu li {
            margin: 0 10px;
        }

        .menu a {
            color: #fff;
            text-decoration: none;
        }

        /* Table styles */
        .table-wrapper {
            background-color: #f2f2f2;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .table-title {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border-radius: 5px 5px 0 0;
        }

        .table-title h2 {
            margin: 0;
            font-size: 24px;
        }

        /* Form styles */
        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: #fff;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .btn-success {
            background-color: #28a745;
            color: #fff;
        }

        .btn-success:hover {
            background-color: #218838;
        }
    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6 d-flex justify-content-">
                                <h2>Mentor Quiz</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="editEmployeeModal">
                    <div class="modal-dialog" style="max-width: 1000px;">
                        <div class="modal-content">
                            <form action="add-quiz" method="post">
                                <div class="modal-header">						
                                    <h4> Create Quiz </h4>
                                    <a href="mentor-manager" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                                </div>
                                <div class="modal-body">					                               
                                    <div class="form-group">
                                        <label>Quiz Name</label>
                                        <input type="text" name="quizname" class="form-control" required autofocus="">
                                    </div>
                                    <div class="form-group">
                                        <label>Quiz Time</label>
                                        <input type="text" name="quiztime" pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]" class="form-control"  required>                                   
                                    </div>
                                    <div class="form-group">
                                        <label>Score</label>
                                        <input type="text" name="score" class="form-control" required>                                   
                                    </div>  
                                    <div class="form-group">
                                        <label>Module</label>
                                        <select name="module" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${module_id}" var="m">                                       
                                            <option value="${m.getModule_id()}">${m.getModule_name()}</option>
                                        </c:forEach>
                                    </select>
                                </div>   
                            </div>
                            <div class="modal-footer">
                                <a class="btn btn-secondary" href="manageMentor">Cancel</a>
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> 
    </body>
</html>
