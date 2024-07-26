<%-- 
    Document   : createAccount
    Created on : Jun 26, 2024, 2:35:00 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
        <link href="admin/css/sidebar-admin.css" rel="stylesheet" type="text/css"/>
        <style>

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
                background-color: #435d7d;
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
                background-color: #435d7d;
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
        <jsp:include page="admin/SideBarAdmin.jsp"></jsp:include>
            <!-- Edit Modal HTML -->
            <div id="editEmployeeModal">
                <div class="modal-dialog" style="max-width: 1000px;">
                    <div class="modal-content">
                        <form action="create-account" method="post">
                            <div class="modal-header">						
                                <h4> Create Account </h4>
                                <a href="manageMentor" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                            </div>
                            <div class="modal-body">					                               
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" name="name" value="${listM.mentorName}" class="form-control" required readonly>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="text" name="image" value="${listM.image}" class="form-control" required readonly>
                                <img src="${listM.image}" class="img-preview" style="width: 200px; height: 200px;"/>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input value="${listM.email}" name="email" type="text" class="form-control" required readonly>
                            </div>
                            <div class="form-group">
                                <label>Pass</label>
                                <input  name="pass" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
                                        oninvalid="this.setCustomValidity('Mật khẩu trên 8 kí tự và bao gồm chữ cái hoa, thường, chữ số, kí tự đặc biệt')" 
                                        oninput="this.setCustomValidity('')" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a class="btn btn-secondary" href="manageMentor">Cancel</a>
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
<script src="admin/js/SideBar.js" type="text/javascript"></script>