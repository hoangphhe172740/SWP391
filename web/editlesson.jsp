<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Lesson</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .modal-header {
                background-color: #007bff;
                color: white;
            }
            .modal-footer .btn-default {
                background-color: #6c757d;
                color: white;
            }
            .modal-footer .btn-success {
                background-color: #28a745;
                color: white;
            }
            .form-group label {
                font-weight: bold;
            }
            .modal-content {
                border-radius: 10px;
            }
            .btn-close {
                background-color: transparent;
                border: none;
                font-size: 1.5rem;
                font-weight: bold;
                color: white;
                opacity: 0.7;
            }
            .btn-close:hover {
                color: #ff4d4d;
            }
        </style>
    </head>
    <body>
        <c:set var="firstCourseId" value="${modules[0].course_id}" />

        <jsp:include page="menu.jsp"></jsp:include>
            <div  id="editLessonModal" tabindex="-1" role="dialog" aria-labelledby="editLessonModalLabel" aria-modal="true" style="display: block;">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editLessonModalLabel">Edit Lesson</h5>
                        </div>
                        <form action="edit-lesson" method="post" id="f1">
                            <input name="courseid"  value="${firstCourseId}" hidden="">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="lesson_id">Lesson ID</label>
                                <input name="lesson_id" id="lesson_id" type="text" class="form-control" value="${lesson.lesson_id}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="module_id">Module</label>
                                <select name="module_id" id="module_id" class="form-control" required>
                                    <c:forEach var="module" items="${modules}">
                                        <option value="${module.module_id}" ${module.module_id == lesson.module_id ? 'selected' : ''}>${module.module_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="lesson_name">Lesson Name</label>
                                <input name="lesson_name" id="lesson_name" type="text" class="form-control" value="${lesson.lesson_name}" required>
                            </div>
                            <div class="form-group">
                                <label for="lesson_video">Lesson Video</label>
                                <input name="lesson_video" id="lesson_video" type="text" class="form-control" value="${lesson.lesson_video}" required>
                            </div>
                            <div class="form-group">
                                <label for="duration">Duration (minutes)</label>
                                <input name="duration" id="duration" type="number" class="form-control" value="${lesson.duration}" required>
                            </div>

                            <div class="form-group">
                                <label for="status">Status</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="true" ${lesson.isActive ? 'selected' : ''}>Active</option>
                                    <option value="false" ${!lesson.isActive ? 'selected' : ''}>Inactive</option>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">

                            <a href="display-modules?courseid=${modules[0].course_id}" ><button type="button" class="btn btn-default" data-dismiss="modal">Back</button></a>
                            <button type="submit" class="btn btn-success" id="btnSubmit">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Include Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>