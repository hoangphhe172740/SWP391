<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Edit Questions</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f8f9fa;
            }
            h1 {
                text-align: center;
            }
            .question-container {
                margin-bottom: 20px;
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
                margin-top: 20px;
            }
            .card-header {
                background-color: #435d7d;
                color: #fff;
                border-bottom: 2px solid #fff;
                padding-top: 10px;
            }
            .input-group-text {
                display: flex;
                align-items: center;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="card-header">
                <h1 class="mb-4">Edit Questions for Quiz: <span class="text-primary">${quiz.quizName}</span></h1>
            </div>
            <c:forEach var="question" items="${quiz.questions}">
                <div class="card my-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">${question.questionText}</h4>
                        <button class="btn delete-btn delete-question" data-question-id="${question.questionId}">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                    <div class="card-body">
                        <form class="edit-question-form">
                            <input type="hidden" name="questionId" value="${question.questionId}" />
                            <div class="mb-3">
                                <label for="questionText-${question.questionId}" class="form-label">Question:</label>
                                <input type="text" class="form-control" id="questionText-${question.questionId}" name="questionText" value="${question.questionText}" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Answers:</label>
                                <c:forEach var="answer" items="${question.answers}">
                                    <div class="input-group mb-2">
                                        <input type="text" class="form-control" name="answerText" value="${answer.answerChoiceText}" />
                                        <div class="input-group-text">
                                            <input class="form-check-input mt-0" type="checkbox" name="isCorrect" value="${answer.answerChoiceText}" ${answer.correct ? 'checked' : ''}>
                                            <span>IsCorrect</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                    </div>
                </div>
                <hr>
            </c:forEach>
                <a href="quizbylesson?lessonId=${quiz.lessonId}"><button type="button" style="background: #6c757d">Back</button></a>
        </div>

        <script>
            $(document).ready(function () {
                // Delete question
                $('.delete-question').on('click', function () {
                    const questionId = $(this).data('question-id');
                    $.ajax({
                        url: 'deleteQuestion',
                        type: 'POST',
                        data: {questionId: questionId},
                        success: function (response) {
                            alert('Question deleted successfully!');
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            alert('Error deleting question: ' + error);
                        }
                    });
                });

                // Edit question
                $('.edit-question-form').on('submit', function (e) {
                    e.preventDefault();
                    const formData = $(this).serialize();
                    $.ajax({
                        url: 'editQuestion',
                        type: 'POST',
                        data: formData,
                        success: function (response) {
                            alert('Question updated successfully!');
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            alert('Error updating question: ' + error);
                        }
                    });
                });
            });
        </script>
    </body>
</html>
