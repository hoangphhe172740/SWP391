<%-- 
    Document   : newpassword
    Created on : May 23, 2024, 5:12:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"/>
        <title>New password</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="https://img.freepik.com/premium-vector/secure-login-concept-illustration-web-password-account-password_203633-3756.jpg"
                         class="img-fluid" alt="Sample image">
                </div>
                <div class="col-md-3 col-lg-3 col-lg-3 offset-xl-1">
                    <form action="NewPassword" method="Post">
                        <h1 class="h3 mb-3 font-weight-normal text-center">New Password</h1>
                        <p class="mess">${mess}</p>
                        <div>
                            <b class="mb-3">PASSWORD</b>
                            <input name="password" type="pass" id="inputpass" class="form-control form-control-lg mb-3 mt-2" placeholder="Create Password" autofocus="" required="">
                        </div>
                        <div>
                            <b class="mb-3">CONFIRM PASSWORD</b>
                            <input name="repass" type="password"  class="form-control form-control-lg mb-3 mt-2" placeholder="Confirm password" required="" autofocus="">
                        </div>
                        <div>
                            <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block mt-3">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>
