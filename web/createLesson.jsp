<%-- 
    Document   : createlesson
    Created on : Jun 28, 2024, 2:15:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6 d-flex justify-content-">
                                <h2>Mentor Manager</h2>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="editEmployeeModal">
                <div class="modal-dialog" style="max-width: 1000px;">
                    <div class="modal-content">
                        <form action="create-lesson" method="post">
                            <div class="modal-header">						
                                <h4> Create Lesson </h4>
                                <a href="mentor-manager" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                            </div>
                        <c:if test="${requestScope.report != nulls}">
                            <p style="color: #00c61c">${requestScope.report}</p>
                        </c:if>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>ID Course</label>
                                <input type="text" name="id" value="${listCourse.id}" readonly class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="name" value="${listCourse.name}" readonly class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Image</label>
                                <input type="text" name="image" value="${listCourse.getImage()}" readonly class="form-control" required>
                                <img src="${listCourse.getImage()}" alt="${listCourse.name}" class="img-preview" />
                            </div>

                            <div class="form-group">
                                <label>Lesson Name</label>
                                <textarea  class="form-control" name="lessonname" id="textarea" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Lesson video</label>
                                <input class="form-control" name="lessonvideo" required>

                            </div>
                            <div class="form-group">
                                <label>Module</label>
                                <select name="module" class="form-select" aria-label="Default select example" >
                                    <c:forEach items="${module_id}" var="m">                                       
                                        <option value="${m.getModule_id()}" >${m.getModule_name()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a class="btn btn-secondary" href="display-modules?courseid=${listCourse.id}">Back</a>
                            <input type="submit" class="btn btn-success" value="Save">
                        </div>
                    </form>                          
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

        <script src="https://cdn.tiny.cloud/1/tq3vg414qe7kthcn976ppu53gc1d1t29xo9nux1lzy1r5c96/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
        <script src="js/tinymce-config.js"></script>
        <script>
            tinymce.init({
                selector: 'textarea#default'
            });
        </script>
    </body>
</html>
