<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quiz Result</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .result {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background: #f9f9f9;
        }

        .result h2 {
            margin: 0;
            color: #333;
        }

        .result p {
            font-size: 18px;
            color: #666;
        }

        .result.success {
            border-color: #4CAF50;
            color: #4CAF50;
        }

        .result.failure {
            border-color: #f44336;
            color: #f44336;
        }

        .button {
            display: block;
            width: 200px;
            padding: 10px;
            margin: 0 auto;
            text-align: center;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Quiz Result</h1>

        <div class="result ${isPassed ? 'success' : 'failure'}">
            <h2>Quiz ${isPassed ? 'Passed' : 'Failed'}</h2>
            <p>Your Score: ${score} / 100</p>
            <p>Pass Score: ${passScore}</p>
            <p>${isPassed ? 'Congratulations! You have passed the quiz.' : 'Sorry, you did not pass the quiz. Please try again.'}</p>
        </div>

        <a href="takequiz?quizId=${quizId}" class="button">Retake Quiz</a>
        <a href="list-quizzes-client?lessonId=${lessonId}" class="button">Home</a>
    </div>
</body>
</html>