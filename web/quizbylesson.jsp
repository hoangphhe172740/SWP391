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
                background-color: #435d7d;
                color: white;
                border-radius: 4px;
            }
            .quiz-actions a:hover {
                background-color: #007bff;
                color: white;
            }
            .quiz-actions a.delete {
                background-color: #f44336;
            }
            .quiz-actions a.delete:hover {
                background-color: #da190b;
            }
            .status-active {
                color: white;
                background-color: #27ae60;
                padding: 5px;
                border-radius: 5px;
            }
            .status-disabled {
                color: white;
                background-color: red;
                padding: 5px;
                border-radius: 5px;
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
                            <strong>Time:</strong> ${quiz.quizTime} Seconds<br/>
                            <strong>Status:</strong> <span class="status-${quiz.is_active ? 'active' : 'disabled'}">${quiz.is_active ? 'active' : 'disabled'}</span><br/>
                            <strong>Pass Score:</strong> ${quiz.passScore}<br/>
                        </div>
                        <div class="quiz-actions">
                            <a href="editquiz?quizId=${quiz.quizId}">Edit Quiz</a>
                            <a href="addquestion?quizId=${quiz.quizId}&lessonId=${quiz.lessonId}">Add Question</a>
                            <a href="editQuestion?quizId=${quiz.quizId}&lessonId=${quiz.lessonId}">Edit Question</a>
                            <a href="viewquizdetail?quizId=${quiz.quizId}&lessonId=${quiz.lessonId}">View Quiz Detail</a>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty quizzes}">
                <p>No quizzes available.</p>
            </c:if>
        </div>
    </body>
</html>
