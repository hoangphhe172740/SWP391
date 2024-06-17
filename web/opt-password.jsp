<%-- 
    Document   : opt-password
    Created on : May 23, 2024, 4:31:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"/>
        <title>otp password</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="https://img.freepik.com/premium-vector/secure-login-concept-illustration-web-password-account-password_203633-3756.jpg"
                         class="img-fluid" alt="Sample image">
                </div>
                <div class="col-md-3 col-lg-3 col-lg-3 offset-xl-1">
                    <form action="otpPassword" method="Post">
                        <h1 class="h3 mb-3 font-weight-normal text-center">Forgot Password</h1>
                        <div>
                            <b class="mb-3">EMAIL</b>
                            <input name="email" type="email" id="inputemail" class="form-control form-control-lg mb-3 mt-2" placeholder="name@email.com" autofocus="" required="">
                        </div>
                        <div>
                            <b class="mb-3">OTP</b>
                            <input name="otp" type="text" id="otp" class="form-control form-control-lg mb-3 mt-2"autofocus="" required="">
                        </div>
                        <div>
                            <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block mt-3">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
