<%-- 
    Document   : addQuestion
    Created on : Jul 11, 2024, 3:40:30 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Question</title>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            text-align: center;
        }

        .question-container {
            margin-bottom: 20px;
            width: 600px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        textarea {
            width: 100%;
            height: 80px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button.delete-btn {
            background-color: #f44336;
        }

        button:hover {
            opacity: 0.8;
        }
    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <h1>List Questions</h1>
            <div class="container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Question Number</th>
                            <th>Question Content</th>
                            <th>Correct Answer</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.list}" var="item">
                        <tr>
                            <td>${item.question_number}</td>
                            <td>${item.question_name}</td>
                            <td>
                                <c:forEach items="${item.choices}" var="i">
                                    <c:if test="${!i.inCorrect}">
                                        ${i.choice}
                                    </c:if>
                                </c:forEach>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        <script>
            tinymce.init({
                selector: 'textarea#default'
            });
        </script>
    </body>
</html>
