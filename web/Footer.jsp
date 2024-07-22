<%-- 
    Document   : footer
    Created on : May 17, 2024, 1:20:15 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/footer.css" rel="stylesheet" type="text/css"/>
<style>
    /* Footer Styles */
    footer {
        background-color: #f8f9fa;
        color: #333;
        padding: 40px 0;
        font-family: 'Arial', sans-serif;
    }

    footer .social-icons a {
        color: #333;
        margin: 0 10px;
        font-size: 1.5rem;
        transition: color 0.3s ease;
    }

    footer .social-icons a:hover {
        color: #007bff;
    }

    footer .fw-bold {
        font-weight: 700;
    }

    footer .text-uppercase {
        text-transform: uppercase;
    }

    footer h6 {
        font-size: 1.25rem;
        margin-bottom: 20px;
    }

    footer p, footer a {
        font-size: 1rem;
        line-height: 1.6;
        color: #333;
    }

    footer a {
        color: #007bff;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    footer a:hover {
        color: #0056b3;
        text-decoration: underline;
    }

    footer .border-bottom {
        border-bottom: 1px solid #ddd;
    }

    footer .p-4 {
        padding: 1.5rem !important;
    }

    footer .text-muted {
        color: #6c757d !important;
    }

    footer .container {
        max-width: 1100px;
    }

    footer .row > div {
        margin-bottom: 30px;
    }

    footer .text-reset {
        color: inherit;
    }

    footer .me-3 {
        margin-right: 1rem !important;
    }

    footer .me-4 {
        margin-right: 1.5rem !important;
    }

    footer .mt-5 {
        margin-top: 3rem !important;
    }

    footer .mx-auto {
        margin-left: auto !important;
        margin-right: auto !important;
    }

    footer .text-center {
        text-align: center !important;
    }

    footer .text-lg-start {
        text-align: left !important;
    }

    footer .text-md-start {
        text-align: left !important;
    }

    footer .modal-content {
        background: #f8f9fa;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    footer .modal-header {
        border-bottom: 1px solid #ddd;
    }

    footer .btn-secondary {
        background-color: #6c757d;
        border: none;
    }

    footer .btn-success {
        background-color: #28a745;
        border: none;
    }

    footer .btn-secondary:hover, .btn-success:hover {
        opacity: 0.9;
    }

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Footer -->
<footer class="text-center text-lg-start bg-body-tertiary text-muted mt-5">
    <!-- Section: Social media -->
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom social-icons">
        <!-- Left -->
        <div class="me-5 d-none d-lg-block">
            <span>Get connected with us on social networks:</span>
        </div>
        <!-- Left -->

        <!-- Right -->
        <div>
            <a href="https://www.facebook.com/hhdzvcl" class="me-4 text-reset">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-twitter"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-google"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-instagram"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-linkedin"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-github"></i>
            </a>
        </div>
        <!-- Right -->
    </section>
    <!-- Section: Social media -->

    <!-- Section: Links  -->
    <section class="">
        <div class="container text-center text-md-start mt-5">
            <!-- Grid row -->
            <div class="row mt-3">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    <!-- Content -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        <i class="fas fa-gem me-3"></i>Company name
                    </h6>
                    <p>
                        Here you can use rows and columns to organize your footer content. Lorem ipsum
                        dolor sit amet, consectetur adipisicing elit.
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        Products
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Angular</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">React</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Vue</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Laravel</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        Useful links
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Pricing</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Settings</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Orders</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Help</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                    <p><i class="fas fa-home me-3"></i>Láng Hòa Lạc, Thạch Thất, Hà Nội</p>
                    <p>
                        <i class="fas fa-envelope me-3"></i>
                        phamhaihoang50@gmail.com
                    </p>
                    <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                    <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </div>
    </section>
    <!-- Section: Links  -->

    <!-- Copyright -->
    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
        © 2024 Copyright:
        <a class="text-reset fw-bold" href="https://www.facebook.com/hhdzvcl">CodeByHoangchatboy</a>
    </div>
    <!-- Copyright -->
</footer>
<!-- Footer -->
<!--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

            <div class="alert alert-danger mt-3">

            </div>-->
