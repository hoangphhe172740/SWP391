<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Take Quiz</title>
        <link rel="stylesheet" href="styles.css">
        <style>
            /* General Styling */
            body {
                font-family: "Roboto", Arial, sans-serif; /* More modern font */
                background-color: #f0f0f0; /* Lighter background */
                color: #333;
                line-height: 1.6;
            }

            .container {
                max-width: 900px; /* Adjusted width */
                margin: 40px auto;
                padding: 30px;
                background: white;
                border-radius: 10px; /* Softer rounded corners */
                box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* More subtle shadow */
            }

            h1 {
                text-align: center;
                color: #2c3e50; /* Darker, more professional color */
                margin-bottom: 30px;
            }

            /* Timer */
            #timer {
                text-align: right; /* Positioned on the right */
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 20px;
                color: #e74c3c; /* Red for urgency */
            }

            /* Question Styling */
            .question {
                margin-bottom: 30px;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 10px;
                background: #f9f9f9;
            }

            .question h3 {
                margin-bottom: 10px;
                color: #2c3e50;
                font-weight: bold;
            }

            .question p {
                font-size: 14px; /* Smaller font size */
                color: #7f8c8d;
                margin-bottom: 15px;
            }

            /* Answer Choices */
            .question div {
                margin-bottom: 10px;
            }

            label {
                cursor: pointer;
            }

            input[type="radio"],
            input[type="checkbox"] {
                transform: scale(1.2); /* Slightly larger checkboxes/radios */
                margin-right: 8px;
            }

            /* Submit Button */
            button[type="submit"] {
                background-color: #27ae60; /* Brighter green */
                color: white;
                padding: 15px 30px;
                border: none;
                border-radius: 5px;
                font-size: 18px;
                cursor: pointer;
                transition: background-color 0.3s ease; /* Smooth transition */
            }

            button[type="submit"]:hover {
                background-color: #219653; /* Darker green on hover */
            }

            /* Alert Box */
            .alert {
                background-color: #f2dede;
                border-color: #ebccd1;
                color: #a94442;
                margin-top: 20px;
            }

        </style>
        <script>
            function validateQuiz() {
                // Ensure all required fields are filled in
                var inputs = document.querySelectorAll('input[type="radio"]:checked, input[type="checkbox"]:checked');
                var totalQuestions = document.querySelectorAll('.question').length;
                if (inputs.length < totalQuestions) {
                    alert("Please answer all questions before submitting.");
                    return false;
                }
                return true;
            }
        </script>
        <script>
            // Function to initialize the countdown timer
            function startTimer(duration, display) {
                let timer = duration, minutes, seconds;
                const interval = setInterval(function () {
                    minutes = parseInt(timer / 60, 10);
                    seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.textContent = minutes + ":" + seconds;

                    // Save the remaining time in localStorage
                    localStorage.setItem('remainingTime', timer);

                    if (--timer < 0) {
                        clearInterval(interval);
                        alert("Time is up! Submitting your quiz.");
                        document.querySelector('form').submit(); // Automatically submit the form
                    }
                }, 1000);
            }

            window.onload = function () {
                const timeDisplay = document.getElementById('time');
                let timeLimit = parseInt(document.querySelector('input[name="timeLimit"]').value, 10); // Get time limit from server-side
                let remainingTime = parseInt(localStorage.getItem('remainingTime'), 10);

                // If there's no valid remaining time, start from time limit
                if (isNaN(remainingTime) || remainingTime <= 0) {
                    remainingTime = timeLimit;
                }

                startTimer(remainingTime, timeDisplay);

                // Block specific keys and key combinations
                document.addEventListener('keydown', function (event) {
                    const blockedKeys = [112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123]; // F1 to F12
                    if (blockedKeys.includes(event.keyCode) || event.ctrlKey || event.shiftKey || event.metaKey) {
                        event.preventDefault();
                    }
                });

                // Clear remaining time on form submission
                document.querySelector('form').addEventListener('submit', function () {
                    localStorage.removeItem('remainingTime');
                });
            };
        </script>
        

    </head>
    <body>
        <div class="container">
            <h1>Take Quiz</h1>
            <div id="timer">
                Time Remaining: <span id="time">00:00</span>
                <input type="hidden" name="timeLimit" value="${timeLimit}"> <!-- Example: 10 minutes (600 seconds) -->
            </div>
            <form action="submitquiz" method="post" onsubmit="return validateQuiz()">
                <input type="hidden" name="quizId" value="${quizId}" />
                <c:forEach var="question" items="${questions}">
                    <div class="question">
                        <h3>${question.questionText}</h3>
                        <p>Type: 
                            <c:choose>
                                <c:when test="${question.questionType == 'MC'}">Multiple Choice</c:when>
                                <c:when test="${question.questionType == 'SA'}">Single Choice</c:when>
                                <c:when test="${question.questionType == 'TF'}">True/False</c:when>
                            </c:choose>
                        </p>
                        <c:choose>
                            <c:when test="${question.questionType == 'MC'}">
                                <!-- Multiple Choice -->
                                <c:forEach var="answer" items="${question.answers}">
                                    <div>
                                        <input type="checkbox" id="answer-${question.questionId}-${answer.answerChoiceId}" name="question-${question.questionId}" value="${answer.answerChoiceId}" />
                                        <label for="answer-${question.questionId}-${answer.answerChoiceId}">${answer.answerChoiceText}</label>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:when test="${question.questionType == 'SA'}">
                                <!-- Single Choice -->
                                <c:forEach var="answer" items="${question.answers}">
                                    <div>
                                        <input type="radio" id="answer-${question.questionId}-${answer.answerChoiceId}" name="question-${question.questionId}" value="${answer.answerChoiceId}" />
                                        <label for="answer-${question.questionId}-${answer.answerChoiceId}">${answer.answerChoiceText}</label>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:when test="${question.questionType == 'TF'}">
                                <!-- True/False -->
                                <div>
                                    <input type="radio" id="answer-${question.questionId}-true" name="question-${question.questionId}" value="true" />
                                    <label for="answer-${question.questionId}-true">True</label>
                                </div>
                                <div>
                                    <input type="radio" id="answer-${question.questionId}-false" name="question-${question.questionId}" value="false" />
                                    <label for="answer-${question.questionId}-false">False</label>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>
                </c:forEach>
                <button type="submit">Submit Quiz</button>
            </form>
        </div>

    </body>
</html>
