<%-- 
    Document   : Success
    Created on : May 15, 2024, 4:15:38 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <title>Home Page</title>
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

                <div id="editEmployeeModal">
                    <div class="modal-dialog" style="max-width: 1000px;">
                        <div class="modal-content">
                            <form action="create-module" method="post">
                                <div class="modal-header">						
                                    <h4> Create Module </h4>
                                    <a href="mentor-manager" style="color: white;" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                                </div>
                                <c:if test="${requestScope.report != null}">
                                    <p style="color: #00c61c">${requestScope.report}</p>
                                </c:if>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Module Name</label>
                                        <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Module Name" required="">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect2">Course</label>
                                        <input type="text" class="form-control" value="${requestScope.courses.name}" readonly="">
                                        <input type="text" name="courseID" class="form-control" value="${requestScope.courses.id}" readonly="" hidden="">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <a class="btn btn-secondary" href="mentor-manager">Back</a>
                                    <input type="submit" class="btn btn-info" value="Add">
                                </div>
                            </form>                          
                        </div>
                    </div>
                </div>
            </div>
      
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </body>
</html>
