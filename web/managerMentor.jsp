<%-- 
    Document   : managerMentor
    Created on : Jun 24, 2024, 5:25:22 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/footer.css"/>
        <link rel="stylesheet" href="./css/manager.css"/>
        <title>Manager Mentor</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="d-flex justify-content-between">
                            <div class="col-sm-6 pt-3">
                                <h2>Manage <b>Mentor</b></h2>
                            </div>
                            <div class="col-sm-3 pt-3">
                                <button type="button" data-target="#addEmployeeModal" class="btn btn-success d-flex justify-content-center" data-toggle="modal">
                                    <i class="material-icons">&#xE147;</i> <span>Add New Mentor</span>
                                </button>
                            </div>
                        </div>
                    </div>
                <c:if test="${listMentor.size() == 0}">
                    <h1>Contain no Mentor</h1>
                </c:if>
                <c:if test="${listMentor.size() > 0}">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listMentor}" var="o">
                                <c:set var="Mentorid" value="${o.mentorId}"/>
                                <tr>
                                    <td>${o.mentorId}</td>
                                    <td>${o.mentorName}</td>
                                    <td>
                                        <img src="${o.image}" style="width: 150px; border-radius: 5px;">
                                    </td>
                                    <td>
                                        <a href="load-account?mentorID=${o.mentorId}" class="edit btn btn-info mb-3"><i class="material-symbols-outlined" title="Create Account">&#xE254;</i></a>
                                        <button id="buttonDelete" class="delete btn btn-info" mentor-id ="${o.mentorId}" data-target="#deleteEmployeeModal" data-toggle="modal">
                                            <i class="material-icons" data-toggle="tooltip" 
                                               title="Delete">&#xE872;</i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </div>
            <a href="home"><button type="button" class="btn btn-primary">Back To Home</button></a>
        </div>
        <div id="addEmployeeModal" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="addEmployeeModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" style="max-width: 800px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Mentor</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <form action="addmentor" method="post" id="f1">
                        <b class="mess text-warning" style="padding: 30px;">${mess}</b>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" placeholder="Enter name..." id="inputname" class="form-control" required="" autofocus="">
                            </div>
                            <div class="form-group">
                                <label>email</label>
                                <input name="email" type="text" placeholder="name@email.com" id="inputemail" class="form-control" required="" autofocus="">
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required="" autofocus="">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <button type="submit" class="btn btn-success" id="btnSubmit">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="deleteEmployeeModal" class="modal fade" tabindex="-1" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="deletementor" id="f2">
                        <input name="mentorId" value="" id="mentorId" hidden/>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Mentor</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete Mentor?</p>
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
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="js/manager.js" type="text/javascript"></script>
        <script src="https://cdn.tiny.cloud/1/tq3vg414qe7kthcn976ppu53gc1d1t29xo9nux1lzy1r5c96/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="./js/tinymce-config.js"></script>
        <script type="text/javascript">
            const f1 = document.getElementById("f1");
            const f2 = document.getElementById("f2");
            const btnSubmit = document.getElementById("btnSubmit");
            const buttonDeletes = document.querySelectorAll("[mentor-id]");
            const cofirmDelete = document.getElementById("cofirmDelete");
            btnSubmit.addEventListener("click", (e) => {
                f1.submit();
            });

            buttonDeletes.forEach((button) => {
                button.addEventListener("click", (e) => {
                    cofirmDelete.addEventListener("click", (ev) => {
                        ev.preventDefault();
                        const mentorId = button.getAttribute("mentor-id");
                        document.getElementById("mentorId").value = mentorId;
                        f2.submit();
                    });
                });
            });
        </script>
        <script>
            tinymce.init({
                selector: 'textarea#default'
            });
        </script>
    </body>
</html>
