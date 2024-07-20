<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>List of Quizzes</title>
        <style>          
            .container {
                max-width: 900px;
                width: 100%;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
                margin: 20px;
                padding: 20px;
            }
            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
                font-size: 2em;
            }
            .lesson {
                border-bottom: 1px solid #ddd;
                padding: 20px 0;
                transition: background-color 0.3s;
            }
            .lesson:last-child {
                border-bottom: none;
            }
            .lesson:hover {
                background-color: #f9f9f9;
            }
            .lesson p {
                color: #666;
                margin: 5px 0;
            }
            .lesson a {
                display: inline-block;
                padding: 10px 20px;
                margin-top: 10px;
                color: #fff;
                background-color: #4CAF50;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s;
            }
            .lesson a:hover {
                background-color: #45a049;
            }
            @media (max-width: 600px) {
                .container {
                    padding: 10px;
                }
                h1 {
                    font-size: 1.5em;
                }
                .lesson p {
                    font-size: 0.9em;
                }
                .lesson a {
                    padding: 8px 16px;
                    font-size: 0.9em;
                }
            }
        </style>

    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>

            <div class="container">
                <h1>List of Quizzes</h1>
            <c:forEach var="quiz" items="${lessons}">
                <div class="lesson">
                    <p><strong>Quiz Name:</strong> ${quiz.quizName}</p>
                    <p><strong>Description:</strong> ${quiz.quizDescription}</p>
                    <p>You have ${quiz.quizTime} seconds to do this quiz</p>
                    <p>You need to get ${quiz.passScore} or higher to pass</p>
                    <c:choose>
                        <c:when test="${quiz.hasJoined}">
                            <p><strong>Status:</strong> ${quiz.passed ? 'Passed' : 'Not Passed'}</p>
                            <p><strong>Score:</strong> ${quiz.score}</p>
                            <a href="takequiz?quizId=${quiz.quizId}">Re-Take Quiz: ${quiz.quizName}</a>

                        </c:when>
                        <c:otherwise>
                            <a href="takequiz?quizId=${quiz.quizId}">Take Quiz: ${quiz.quizName}</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
