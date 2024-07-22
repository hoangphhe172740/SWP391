<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Quiz</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin-top: 30px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .modal-header {
            background-color: #435d7d;
            color: white;
            border-bottom: none;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .modal-body {
            background-color: #f8f9fa;
            padding: 20px;
        }
        .modal-footer {
            border-top: none;
            background-color: #f8f9fa;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="container">
        <div class="modal-header">						
            <h4>Edit Quiz</h4>
            <a href="mentor-manager" style="color: white;" class="btn-close" aria-label="Close"></a>
        </div>
        <form action="editquiz" method="post">
            <input type="hidden" name="quizId" value="${quiz.quizId}"/>
            <div class="mb-3">
                <label for="quizName" class="form-label">Quiz Name:</label>
                <input type="text" name="quizName" class="form-control" id="quizName" value="${quiz.quizName}" required />
            </div>

            <div class="mb-3">
                <label for="quizDescription" class="form-label">Quiz Description:</label>
                <textarea name="quizDescription" class="form-control" id="quizDescription" rows="4" required>${quiz.quizDescription}</textarea>
            </div>

            <div class="mb-3">
                <label for="quizTime" class="form-label">Quiz Time (Seconds):</label>
                <input type="number" name="quizTime" class="form-control" id="quizTime" value="${quiz.quizTime}" required />
            </div>

            <div class="mb-3">
                <label for="passScore" class="form-label">Pass Score:</label>
                <input type="number" name="passScore" class="form-control" id="passScore" value="${quiz.passScore}" required />
            </div>

            <div class="mb-3">
                <label for="isActive" class="form-label">Active:</label>
                <select name="isActive" class="form-select" id="isActive">
                    <option value="true" ${quiz.is_active ? 'selected' : ''}>Active</option>
                    <option value="false" ${!quiz.is_active ? 'selected' : ''}>Inactive</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Update Quiz</button>
            <a href="quizbylesson?lessonId=${quiz.lessonId}"><button type="button" class="btn btn-secondary">Back</button></a>
        </form>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9x4C7f/JvJQ0ZT1/3LFG4vfXJ7xE/8dE4wRs8COnJ8vFfrN9xT" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniU8A0U1O1LtLu2G1E4PpD0j4v5eV5F6t8f6ST2j8B7Q0K1h5gDp" crossorigin="anonymous"></script>
</body>
</html>
