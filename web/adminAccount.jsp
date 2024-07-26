<%-- 
    Document   : adminAccount
    Created on : Jun 24, 2024, 4:18:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Account</title>
    </head>
    <body>
        <jsp:include page="menuAdmin.jsp"></jsp:include>
        <div class="container">
            <div class="table-title">
                <div class="table-title">
                    <div class="d-flex justify-content-between">
                        <div class="col-sm-6 pt-3">
                            <h2>Manage <b>Account</b></h2>
                        </div>
                        <div class="col-sm-3 pt-3">
                            <button type="button" data-target="#addEmployeeModal" class="btn btn-success d-flex justify-content-center" data-toggle="modal">
                                <i class="material-icons">&#xE147;</i> <span>Add New Account</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
