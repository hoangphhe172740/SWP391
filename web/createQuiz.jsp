<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Create Quiz</title>
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
                position: relative;
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

            input[type="text"],
            input[type="number"] {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-bottom: 10px;
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
                position: absolute;
                top: 0;
                right: 0;
            }

            button:hover {
                opacity: 0.8;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .quiz-info {
                display: none;
                margin-top: 20px;
            }
        </style>
        <script>
            var questionCount = 1; // Biến toàn cục để theo dõi số lượng câu hỏi

            function addQuestion() {
                questionCount++; // Tăng số lượng câu hỏi lên mỗi khi thêm câu hỏi mới
                document.getElementById('questionCount').value = questionCount;
                var questionSection = document.getElementById('questions');
                var newQuestion = document.createElement('div');
                var questionIndex = questionCount;
                newQuestion.className = 'question-container';
                newQuestion.id = 'question-' + questionIndex;
                newQuestion.innerHTML = '<h3>Question ' + questionIndex + '</h3>' +
                        '<label for="questionText' + questionIndex + '">Question Text:</label>' +
                        '<textarea name="questionText' + questionIndex + '" placeholder="Enter your question here..." required></textarea><br/>' +
                        '<label for="questionType' + questionIndex + '">Question Type:</label>' +
                        '<select name="questionType' + questionIndex + '">' +
                        '<option value="MC">Multiple Choice</option>' +
                        '<option value="SA">Single Choice</option>' +
                        '<option value="TF">True/False</option>' +
                        '</select><br/>' +
                        '<div id="answers' + questionIndex + '">' +
                        '<h4>Answers</h4>' +
                        '<div class="question-container">' +
                        '<label for="answer-' + questionIndex + '-1">Option 1:</label>' +
                        '<textarea id="answer-' + questionIndex + '-1" name="answerChoice' + questionIndex + '-1" placeholder="Enter the answer option..." required></textarea>' +
                        '<label for="isCorrect' + questionIndex + '-1">Is Correct:</label>' +
                        '<input type="checkbox" name="isCorrect' + questionIndex + '-1" value="true"/><br/>' +
                        '</div>' +
                        '</div>' +
                        '<button type="button" onclick="addAnswer(' + questionIndex + ')">Add Answer</button>' +
                        '<button type="button" class="delete-btn" onclick="deleteQuestion(' + questionIndex + ')">Delete Question</button>';
                questionSection.appendChild(newQuestion);
            }

            function addAnswer(questionIndex) {
                var answersSection = document.getElementById('answers' + questionIndex);
                if (!answersSection) {
                    console.error('Answers section not found for question index:', questionIndex);
                    return;
                }

                var answerCount = answersSection.querySelectorAll('.question-container').length + 1;
                var newAnswerDiv = document.createElement('div');
                newAnswerDiv.classList.add('question-container');
                newAnswerDiv.innerHTML = '<label for="answer-' + questionIndex + '-' + answerCount + '">Option ' + answerCount + ':</label>' +
                        '<textarea id="answer-' + questionIndex + '-' + answerCount + '" name="answerChoice' + questionIndex + '-' + answerCount + '" placeholder="Enter the answer option..." required></textarea>' +
                        '<label for="isCorrect' + questionIndex + '-' + answerCount + '">Is Correct:</label>' +
                        '<input type="checkbox" id="isCorrect' + questionIndex + '-' + answerCount + '" name="isCorrect' + questionIndex + '-' + answerCount + '" value="true"/><br/>' +
                        '<button type="button" class="delete-btn" onclick="deleteAnswer(' + questionIndex + ')">X</button>';
                answersSection.appendChild(newAnswerDiv);
            }

            function deleteAnswer(questionIndex) {
                var answersSection = document.getElementById('answers' + questionIndex);
                if (!answersSection) {
                    console.error('Answers section not found for question index:', questionIndex);
                    return;
                }

                var answerContainers = answersSection.querySelectorAll('.question-container');
                if (answerContainers.length === 1) {
                    console.error('Cannot delete the only answer option.');
                    return;
                }

                // Find the parent container of the delete button
                var answerDiv = event.target.parentNode;
                answerDiv.remove();
            }


            function deleteQuestion(questionIndex) {
                var questionDiv = document.getElementById('question-' + questionIndex);
                questionDiv.remove();
                questionCount--;
            }

            function showQuizInfo() {
                document.querySelector('.quiz-info').style.display = 'block';
            }

            function hideQuizInfo() {
                document.querySelector('.quiz-info').style.display = 'none';
            }

            function saveQuiz() {
                showQuizInfo();
                // Code to save the quiz data
            }
        </script>

    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="container">
                    <h1>Create Quiz</h1>
                    <form action="addquiz" method="post">
                        <input type="text" name="lessonId" hidden="" value="${lessonId}"/>
                    <input type="hidden" id="questionCount" name="questionCount" value="1"/>
                    <div id="questions">
                        <h3>Question 1</h3>
                        <!-- Initial question -->
                        <div class="question-container" id="question-1">
                            <label for="questionText1">Question Text:</label>
                            <textarea name="questionText1" placeholder="Enter your question here..." required></textarea><br/>
                            <label for="questionType1">Question Type:</label>
                            <select name="questionType1">
                                <option value="MC">Multiple Choice</option>
                                <option value="SA">Single Choice</option>
                            </select><br/>
                            <div id="answers1">
                                <h4>Answers</h4>
                                <!-- Initial answer -->
                                <div class="question-container">
                                    <label for="answer-1-1">Option 1:</label>
                                    <textarea id="answer-1-1" name="answerChoice1-1" placeholder="Enter the answer option..." required></textarea>
                                    <label for="isCorrect1-1">Is Correct:</label>
                                    <input type="checkbox" id="isCorrect1-1" name="isCorrect1-1" value="true"/><br/>
                                </div>
                            </div>
                            <button type="button" onclick="addAnswer(1)">Add Answer</button>
                        </div>
                    </div>
                    <button type="button" onclick="addQuestion()">Add Another Question</button>
                    <button type="button" onclick="saveQuiz()">Save Quiz</button>
                    <div class="quiz-info">
                        <label for="quizName">Quiz Name:</label>
                        <input type="text" name="quizName" required /><br/>

                        <label for="quizDescription">Quiz Description:</label>
                        <textarea name="quizDescription" required></textarea><br/>

                        <label for="quizTime">Quiz Time (Seconds):</label>
                        <input type="number" name="quizTime" required /><br/>

                        <label for="passScore">Pass Score:</label>
                        <input type="number" name="passScore" required /><br/>

                        <button type="submit">Submit Quiz</button>
                        <button type="button" class="btn-danger" onclick="hideQuizInfo()">Cancel</button>
                    </div>
                </form>
            </div>
            <a href="quizbylesson?lessonId=${lessonId}"><button type="button" style="background: #6c757d">Back</button></a>
        </div>
    </body>
</html>