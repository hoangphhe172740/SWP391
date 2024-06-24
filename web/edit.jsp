<%-- 
    Document   : edit
    Created on : Jun 23, 2024, 11:13:25 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>Edit Course</title>
        <style>
            /* Reset CSS */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f8f9fa;
                color: #333;
                padding: 20px;
            }

            .container {
                max-width: 1500px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            .table-wrapper {
                overflow-x: auto;
                margin-top: 20px;
            }

            .table-title {
                background-color: #0056D2;
                color: #fff;
                padding: 16px 30px;
                border-radius: 8px 8px 0 0;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .table-title h2 {
                margin: 0;
                font-size: 24px;
            }

            .modal-content {
                padding: 20px;
                border-radius: 8px;
            }

            .modal-header {
                background-color: #0056D2;
                color: #fff;
                border-bottom: 1px solid #eee;
            }

            .modal-header .close {
                color: #fff;
                opacity: 1;
            }

            .modal-header .close:hover {
                opacity: 0.8;
            }

            .modal-title {
                font-size: 24px;
            }

            .modal-body .form-group {
                margin-bottom: 20px;
            }

            .modal-body .form-group label {
                font-weight: 600;
            }

            .modal-body .form-group input,
            .modal-body .form-group textarea,
            .modal-body .form-group select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .modal-body .img-preview {
                margin-top: 10px;
                max-width: 100%;
                border-radius: 4px;
            }

            .modal-footer {
                padding: 10px 20px;
                border-top: 1px solid #eee;
            }

            .btn-secondary, .btn-success {
                min-width: 120px;
                border-radius: 4px;
            }

            .btn-secondary {
                background-color: #d6d6d6;
                border-color: #ccc;
            }

            .btn-secondary:hover {
                background-color: #c6c6c6;
                border-color: #bbb;
            }

            .btn-success {
                background-color: #4caf50;
                border-color: #4caf50;
            }

            .btn-success:hover {
                background-color: #45a049;
                border-color: #45a049;
            }
        </style>
    </head>

    <body>
        <jsp:include page="menu.jsp"></jsp:include>

            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6 d-flex justify-content-">
                                <h2>ManageCourse</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="editEmployeeModal">
                <div class="modal-dialog" style="max-width: 1000px;">
                    <div class="modal-content">
                        <form action="edit" method="post">
                            <div class="modal-header">						
                                <h4> Edit Course </h4>
                                <a href="manager" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID Course</label>
                                    <input type="text" name="id" value="${detail.id}" readonly class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="name" value="${detail.name}" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="text" name="image" value="${detail.image}" class="form-control" required>
                                <img src="${detail.image}" alt="${detail.name}" class="img-preview" />
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input value="${detail.price}" name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea  class="form-control" name="title" id="default" required>${detail.title}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" name="description" id="default" required rows="10">${detail.description}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="c">
                                        <c:set value="${category_id}" var="id"/>
                                        <option ${(id==c.cid)?"selected":""} value="${c.cid}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>				
                        </div>
                        <div class="modal-footer">
                            <a class="btn btn-secondary" href="manager">Cancel</a>
                            <input type="submit" class="btn btn-success" value="Edit">
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