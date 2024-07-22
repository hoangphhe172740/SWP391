<%-- 
    Document   : addAccount
    Created on : Jul 21, 2024, 8:29:04 PM
    Author     : khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/cssCreateManager.css" rel="stylesheet" type="text/css"/>
        <link href="css/sidebar-admin.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="container">

            <div class="table-wrapper">
                <c:if test="${mess != null}">
                    <div class="alert alert-success mt-3">
                        <p>${mess}</p>
                    </div>
                </c:if>
                <c:if test="${error != null}">
                    <div class="alert alert-danger mt-3">
                        <p>${error}</p>
                    </div>
                </c:if>
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6 d-flex justify-content-">
                            <h2>Manage Account</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="editEmployeeModal">
                <div class="modal-dialog" style="max-width: 1000px;">
                    <div class="modal-content">
                        <form action="addmanager" method="post">
                            <div class="modal-header">						
                                <h4> Create Account </h4>
                                <a href="manageaccount?roleID=2" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
                            </div>
                            <div class="modal-body">					                               
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" name="name" value="" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="" name="email" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Pass</label>
                                    <input  name="pass" type="password" class="form-control" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a class="btn btn-secondary" href="manageaccount?roleID=2">Cancel</a>
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="SideBarAdmin.jsp" %>
    </body>
</html>
<script src="js/SideBar.js" type="text/javascript"></script>