<%-- 
    Document   : addQuestion
    Created on : Jul 11, 2024, 3:40:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
            <h1>Quiz Question Creator</h1>
            <div class="container">
                <div class="question-container">
                    <label for="question-text">Question:</label>
                    <textarea id="question-text" placeholder="Enter your question here..."></textarea>
                </div>

                <div id="answer-container">
                    <div class="question-container">
                        <label for="answer-1">Option:</label>
                        <textarea id="answer-1"></textarea>
                        <button class="delete-btn" onclick="deleteAnswer(this)">X</button>
                    </div>
                </div>
                <button onclick="addAnswer()">Add Answer</button>
                <button onclick="saveQuestion()">Save Question</button>
            </div>
            <script>
                var answerCount = 1;

                function addAnswer() {
                    answerCount++;
                    var answerContainer = document.getElementById("answer-container");
                    var newAnswerDiv = document.createElement("div");
                    newAnswerDiv.classList.add("question-container");
                    newAnswerDiv.innerHTML = `
                  <label for="answer-${answerCount}">Option ${answerCount}:</label>
                  <textarea id="answer-${answerCount}" placeholder="Enter the answer option..."></textarea>
                  <button class="delete-btn" onclick="deleteAnswer(this)">X</button>
                `;
                    answerContainer.appendChild(newAnswerDiv);
                }
                function deleteAnswer(btn) {
                    var answerDiv = btn.parentNode;
                    answerDiv.remove();
                    answerCount--;
                }
                function saveQuestion() {
                    var questionText = document.getElementById("question-text").value;
                    var answers = [];
                    for (var i = 1; i <= answerCount; i++) {
                        var answerText = document.getElementById(`answer-${i}`).value;
                        if (answerText.trim() !== "") {
                            answers.push(answerText);
                        }
                    }
                    console.log("Question: " + questionText);
                    console.log("Answers: " + answers);
                }
        </script>
        <script>
            tinymce.init({
                selector: 'textarea#default'
            });
        </script>
    </body>
</html>
