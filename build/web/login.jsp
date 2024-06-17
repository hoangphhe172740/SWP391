<%-- 
    Document   : login
    Created on : May 14, 2024, 1:43:41 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"/>
        <link rel="stylesheet" href="css/login.css" type="text/css"/>
        <title>Login Page</title>
    </head>
    <style>
        .bold-text{
            font-weight: bold;
            padding: 20px 10px;

        }

    </style>
    <body class="vh-100">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5"><a href="index.html">
                        <img src="img/thu-vien-elearning-va-nhung-thong-tin-can-nam-bat.jpg"
                             class="img-fluid" alt="Sample image">
                    </a></div>

                <div class="col-md-3 col-lg-3 col-lg-3 offset-xl-1">
                    <c:set var="cookie" value="${pageContext.request.cookies}"/>
                    <form class="form-signin" action="Login" method="Post">
                        <h1 class="h3 mb-3 font-weight-normal text-center bold-text">Welcome Back</h1>
                        <p class="text-danger">${requestScope.mess}</p>
                        <!-- email -->
                        <div>
                            <i class="bold-text mb-3">EMAIL</i>
                            <input name="email" type="email" id="inputemail" class="form-control form-control-lg mb-3 mt-2" placeholder="name@email" required="" autofocus=""
                                   value="${cookie.cuser.value}" >
                        </div>
                        <!--Password -->
                        <div>
                            <i class="bold-text mb-3">PASSWORD</i>
                            <input name="password" type="password" id="inputpass" class="form-control form-control-lg mb-3 mt-2" placeholder="Enter The Password" required="" autofocus=""
                                   value="${cookie.cuser.value}">
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <!-- Checkbox -->
                            <div class="form-check mb-0">
                                <input name="remember" class="form-check-input me-2" type="checkbox" value="ON"
                                       ${(cookie.crem != null ?'checked':'')}/>
                                <label class="form-check-label">
                                    Remember me
                                </label>
                            </div>
                            <a href="forgotpassword.jsp" class="text-body">Forgot password?</a>
                        </div>
                        <!--LOGIN-->
                        <div>
                            <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block mt-3">Login</button>
                        </div>
                        <div class="divider d-flex align-items-center my-4">
                            <p class="text-center fw-bold mx-3 mb-0">Or</p>
                        </div>
                        <a data-mdb-ripple-init class="btn btn-primary btn-lg btn-block" style="background-color: #55acee" href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/project-swp391-test1/LoginGoogle&client_id=1086090652462-4j0rtt6h7v2qsorevepee5p8j9d3koho.apps.googleusercontent.com&approval_prompt=force"
                           role="button">
                            <i class="fab fa-google me-2"></i>Continue with google</a>
                        <div class="d-flex align-items-center justify-content-center pt-3">
                            <p class="mb-0 me-2">Don't have an account? </p>
                            <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn"><a href="register.jsp">Create New</a></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
