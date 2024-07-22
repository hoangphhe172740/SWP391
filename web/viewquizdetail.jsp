<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Quiz Details</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f2f2f2;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                color: #333;
            }

            .quiz-info {
                margin-bottom: 20px;
                padding: 10px;
                background-color: #e9e9e9;
                border-radius: 8px;
            }

            .quiz-info h2 {
                margin: 0 0 10px 0;
            }

            .question-container {
                margin-bottom: 20px;
                padding: 10px;
                background-color: #f9f9f9;
                border-radius: 8px;
                border-left: 5px solid #435d7d;
            }

            .question-container h3 {
                margin-top: 0;
                color: #435d7d;
            }

            .answer {
                padding: 5px 0;
            }

            .answer.correct {
                color: #4CAF50;
                font-weight: bold;
            }

            .answer.incorrect {
                color: #f44336;
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
                <h1>Quiz Details</h1>
                <div class="quiz-info">
                    <strong>Quiz Name:</strong> ${quiz.quizName}<br/>
                <strong>Description:</strong> ${quiz.quizDescription}<br/>
                <strong>Time:</strong> ${quiz.quizTime} Seconds<br/>
                <strong>Status:</strong> <span class="status-${quiz.is_active ? 'active' : 'disabled'}">${quiz.is_active ? 'active' : 'disabled'}</span><br/>
                <strong>Pass Score:</strong> ${quiz.passScore}<br/>
            </div>
            <c:forEach var="question" items="${quiz.questions}">
                <div class="question-container">
                    <h3>${question.questionText}</h3>
                    <c:choose>
                        <c:when test="${question.questionType == 'MC'}"><span style="font-size: 12px;font-style:  italic;">Multiple Choice</span><br/></c:when>
                        <c:when test="${question.questionType == 'SA'}"><span style="font-size: 12px;font-style:  italic;">Single Choice</span><br/></c:when>
                    </c:choose>
                    <c:forEach var="answer" items="${question.answers}">
                        <div class="answer ${answer.correct ? 'correct' : 'incorrect'}">
                            <p>${answer.answerChoiceText}</p>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
            <a href="quizbylesson?lessonId=${quiz.lessonId}"><button type="button" class="btn btn-secondary">Back</button></a>
        </div>
    </body>
</html>
