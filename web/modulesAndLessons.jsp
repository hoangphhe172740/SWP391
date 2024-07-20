<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
    <head>
        <title>Modules and Lessons</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                display: flex;
            }
            .modules {
                width: 20%;
                border-right: 1px solid #ddd;
                padding-right: 20px;
            }
            .modules a {
                display: block;
                padding: 10px;
                text-decoration: none;
                color: #333;
                transition: all 0.3s ease;
            }
            .modules a:hover, .modules a.active {
                background-color: #f0f0f0;
            }
            .modules a.active {
                font-size: 18px;
                font-weight: bold;
                color: #007bff;
            }
            .lessons {
                width: 80%;
                padding-left: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                border: 1px solid #ddd;
            }
            th {
                background-color: #f4f4f4;
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="modules">
                    <h2>Modules</h2>
                <c:set var="firstCourseId" value="${modules[0].course_id}" />
                <c:forEach var="module" items="${modules}">
                    <a href="lessons?moduleId=${module.module_id}&courseid=${module.course_id}" class="${module.module_id == selectedModuleId ? 'active' : ''}">${module.module_name}</a>
                </c:forEach>
                <a href="load-lesson?courseid=${firstCourseId}" class="edit btn btn-info mb-3">
                    <i class="fa-solid fa-plus">Add New Lesson</i>
                </a>  
            </div>
            <div class="lessons">
                <h2>Lessons</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Lesson Name</th>
                            <th>Video</th>
                            <th>Duration</th>
                            <th>Created By</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="firstmoduleId" value="${lessons[0].module_id}" />
                        <c:forEach var="lesson" items="${lessons}">
                            <tr>
                                <td>${lesson.lesson_name}</td>
                                <td>
                                    <a href="${lesson.lesson_video}" class="glightbox link-video">
                                        <span class="bi-play-fill"></span>
                                        <img src="assets/img/post-landscape-5.jpg" alt="" class="img-fluid">
                                    </a>

                                </td>

                                <td>${lesson.duration}</td>
                                <td>${lesson.create_by}</td>
                                <td><button type="button" data-target="#addEmployeeModal" class="btn btn-primary" data-toggle="modal">
                                       <a href="quizbylesson?lessonId=${lesson.lesson_id}&courseid=${firstCourseId}" style="color: black; text-decoration: none">View</a>
                                    </button> | <button type="button" data-target="#addEmployeeModal" class="btn btn-Warning" data-toggle="modal">
                                       <a href="edit-lesson?lessonid=${lesson.lesson_id}&courseid=${firstCourseId}" style="color: black; text-decoration: none">Edit</a>
                                    </button>|  <button id="buttonDelete" class="delete btn btn-danger" lesson-id ="${lesson.lesson_id}" data-target="#deleteEmployeeModal" data-toggle="modal">
                                        <i class="material-icons" data-toggle="tooltip" 
                                           >Delete</i>
                                    </button> </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!--delete-->
        <div id="deleteEmployeeModal" class="modal fade" tabindex="-1" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="lessons" id="f2" method="post">
                        <input name="lessonId" value="" id="lessonId" hidden/>
                        <input name="courseid" value="${firstCourseId}"  hidden/>
                        <input name="moduleId" value="${firstmoduleId}"  hidden/>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Lesson</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete Lesson?</p>
                            <p class="text-warning"><span>This action cannot be undone.</span></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <button class="btn btn-danger" id="cofirmDelete">Delete</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="js/manager.js" type="text/javascript"></script>
    <script src="https://cdn.tiny.cloud/1/tq3vg414qe7kthcn976ppu53gc1d1t29xo9nux1lzy1r5c96/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script src="./js/tinymce-config.js"></script>
    <script type="text/javascript">
        const f2 = document.getElementById("f2");
        const buttonDeletes = document.querySelectorAll("[lesson-id]");
        const cofirmDelete = document.getElementById("cofirmDelete");

        buttonDeletes.forEach((button) => {
            button.addEventListener("click", (e) => {
                cofirmDelete.addEventListener("click", (ev) => {
                    ev.preventDefault();
                    const lessonId = button.getAttribute("lesson-id");
                    document.getElementById("lessonId").value = lessonId;
                    f2.submit();
                });
            });
        });
    </script>
</html>
