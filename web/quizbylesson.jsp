<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Quizzes List</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
            }
            .quiz-item {
                margin-bottom: 20px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .quiz-info {
                margin-bottom: 10px;
            }
            .add-quiz {
                margin-bottom: 20px;
                text-align: center;
            }
            .quiz-actions {
                margin-top: 10px;
            }
            .quiz-actions a {
                margin-right: 10px;
                text-decoration: none;
                padding: 6px 12px;
                background-color: #4CAF50;
                color: white;
                border-radius: 4px;
            }
            .quiz-actions a:hover {
                background-color: #45a049;
            }
            .quiz-actions a.delete {
                background-color: #f44336;
            }
            .quiz-actions a.delete:hover {
                background-color: #da190b;
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <h1>Quizzes List</h1>
                <div class="add-quiz">
                    <div class="quiz-actions">
                        <a href="addquiz?lessonId=${lessonId}">Add New Quiz</a>
                </div>
            </div>

            <c:if test="${not empty quizzes}">
                <c:forEach var="quiz" items="${quizzes}">
                    <div class="quiz-item">
                        <div class="quiz-info">
                            <strong>Quiz Name:</strong> ${quiz.quizName}<br/>
                            <strong>Description:</strong> ${quiz.quizDescription}<br/>
                            <strong>Time:</strong> ${quiz.quizTime} minutes<br/>
                            <strong>Pass Score:</strong> ${quiz.passScore}<br/>
                        </div>
                        <div class="quiz-actions">
                            <a href="viewQuiz?id=${quiz.quizId}">View Quiz</a>
                            <a href="editQuiz?id=${quiz.quizId}">Edit Quiz</a>
                            <a href="deleteQuiz?id=${quiz.quizId}" class="delete">Delete Quiz</a>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty quizzes}">
                <p>No quizzes available.</p>
            </c:if>
            <a href="home">Back to Home</a>
        </div>
    </body>
</html>
