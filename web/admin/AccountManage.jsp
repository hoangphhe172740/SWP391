<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link href="css/sidebar-admin.css" rel="stylesheet" type="text/css"/>    
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .status-active {
                color: white;
                background-color: #27ae60;
                padding: 5px;
                border-radius: 5px;
            }
            .status-disabled {
                color: white;
                background-color: red;
                padding: 5px;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <div class="area">
            <div class="row ">
                <div class="col-12">
                    <h2>Account Manage</h2>
                    <p class="center-side" style="color:
                       <c:choose>
                           <c:when test="${mess == 'Update Fail!'}">Red</c:when>
                           <c:otherwise>Green</c:otherwise>
                       </c:choose>
                       ">
                        <c:if test="${mess != null}">${mess}</c:if>
                        </p>                    
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Full Name</th>
                                    <th>Status</th>
                                    <th>Nation</th>
                                    <th>Email</th>
                                    <th>Gender</th>
                                    <th>Setting</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="profile" items="${accountProfiles}">
                                <tr>
                                    <td>${profile.uID}</td>
                                    <td><img src="../${profile.avatar}" alt="Profile Image" class="img-thumbnail" width="50" height="50"></td>
                                    <td>${profile.fullname}</td>
                                    <td><span class="status-${profile.isActive ? 'active' : 'disabled'}">${profile.isActive ? 'active' : 'disabled'}</span></td>
                                    <td>${profile.nation}</td>
                                    <td>${profile.email}</td>
                                    <td>${profile.gender ? 'Male' : 'Female'}</td>
                                    <td>
                                        <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#editModal" 
                                                data-id="${profile.uID}" data-name="${profile.fullname}" data-status="${profile.isActive}">Edit</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- Edit Modal -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit Account Status</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editForm" action="manageaccount" method="post">
                            <input type="hidden" name="uID" id="uID">
                            <input type="hidden" name="roleID" value="${roleID}">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" id="name" name="name" readonly>
                            </div>
                            <div class="form-group">
                                <label for="status">Status</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="true">Active</option>
                                    <option value="false">Inactive</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="SideBarAdmin.jsp" %>

    </body>
</html>
<script src="js/SideBar.js" type="text/javascript"></script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $('#editModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var id = button.data('id');
        var name = button.data('name');
        var status = button.data('status');

        var modal = $(this);
        modal.find('#uID').val(id);
        modal.find('#name').val(name);
        modal.find('#status').val(status.toString());
    });
</script>