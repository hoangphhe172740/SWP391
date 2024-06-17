<%-- 
    Document   : register
    Created on : May 21, 2024, 9:37:27 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"/>
        <link rel="stylesheet" href="css/register.css" type="text/css"/>
        <link rel="stylesheet" href="./css/footer.css"/>
        <title>Register Page</title>       
    </head>
    <body class="vh-100 mt-5"> 
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5"><a href="index.html">
                    <img src="img/thu-vien-elearning-va-nhung-thong-tin-can-nam-bat.jpg"
                         class="img-fluid" alt="Sample image">
                    </a></div>
                <div class="col-md-3 col-lg-3 col-lg-3 offset-xl-1">
                    <form class="form-signup" action="Register" method="Post">
                        <h1 class="h3 mb-3 font-weight-normal text-center bold-text">Sign Up</h1>
                        <p class="mess">${mess}</p>
                        
                        <!---EMAIL---->
                        <div>
                            <b class="mb-3">EMAIL</b>
                            <input name="email" type="email" id="inputemail" class="form-control form-control-lg mb-3 mt-2" placeholder="name@email.com" autofocus="" required="">
                        </div>
                        <!----Full name---->
                        <div>
                            <b class="mb-3">USERNAME</b>
                            <input name="user" type="text" id="inputname" class="form-control form-control-lg mb-3 mt-2" placeholder="Enter Your Full Name" autofocus="" required="">
                        </div>
                        <div>
                            <b class="mb-3">FULLNAME</b>
                            <input name="fullname" type="text" id="inputname" class="form-control form-control-lg mb-3 mt-2" placeholder="Enter Your Full Name" autofocus="" required="">
                        </div>
                        <!--Password -->
                        <div>
                            <b class="mb-3">PASSWORD</b>
                            <input name="password" type="password" id="inputpass" class="form-control form-control-lg mb-3 mt-2" placeholder="Create password" required="" autofocus="">

                        </div>
                        <div>
                            <b class="mb-3">CONFIRM PASSWORD</b>
                            <input name="repass" type="password"  class="form-control form-control-lg mb-3 mt-2" placeholder="Confirm password" required="" autofocus="">

                        </div>
                        <!--Sign Up-->
                        <div>
                            <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block mt-3">Join For Free</button>
                        </div>
                        <div class="divider d-flex align-items-center my-4">
                            <p class="text-center fw-bold mx-3 mb-0">Or</p>
                        </div>
                        <a data-mdb-ripple-init class="btn btn-primary btn-lg btn-block" style="background-color: #55acee" href="#!"
                           role="button">
                            <i class="fab fa-google me-2"></i>Continue with google</a>
                        <div class="d-flex align-items-center justify-content-center pt-3">
                            <p class="mb-0 me-2">Already on Coursera? </p>
                            <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn"><a href="Login">Sign In</a></button>
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
