<%-- 
    Document   : doQuizz
    Created on : Jun 23, 2023, 10:42:36 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/dashboard.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <!--        <script src="js/scripts.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- MDB -->
        <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
        <!-- Font Awesome -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <!-- Google Fonts Roboto -->
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
        <link rel="stylesheet" href="css/dashboard.css" />
        <link rel="stylesheet" href="css/mdb.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script type="text/javascript" src="js/navbarCategory.js"></script>
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <script type="text/javascript"></script>
    </head>
    <script>
        function timerfunction() {
        <% HttpSession session1 = request.getSession();%>
            var minute = <%=(int) session1.getAttribute("TIMER")%>;
            minute--;
            var sec = 60;
            setInterval(function () {
                document.getElementById("timer").innerHTML = minute + " : " + sec;
                sec--;
                if (sec == 00) {
                    minute--;
                    sec = 60;
                    if (minute == 0) {
//                            minute = 5;
                    }
                }
                if (minute == 0 && sec == 1) {
                    document.getElementById("myForm").submit();
                }
            }, 1000);
        }
    </script>
    <style>
        .account-div{
            position: relative;
        }

        .account-table{
            display: none;
            position: absolute;
            top: 34px;
            right: 0;
            width: 160px;
            border-radius: 5px;
            padding: 10px;
        }

        .account-div:hover .account-table{
            display: block;
        }
    </style>
</head>
<body class="sb-sidenav-toggled" onload="timerfunction()">
    <header class="sb-nav-fixed"><nav class="sb-topnav navbar navbar-expand navbar-light py-3" style=" background-image: url(''); background-color: #FFC533; height: 70px">

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="row p-2 d-flex">
                    <div>Your Time: </div><p class="p-1 form-control text-center bg-light text-dark my-auto ms-2" style="width: 90px" id="timer"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M12.5 7.25a.75.75 0 00-1.5 0v5.5c0 .27.144.518.378.651l3.5 2a.75.75 0 00.744-1.302L12.5 12.315V7.25z"></path><path fill-rule="evenodd" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zM2.5 12a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z"></path></svg></p>
                </div>
            </div>
            </div>
        </nav>
    </header>
    <div class="col-lg-4">
        <!-- Side widgets-->

    </div>
    <div id="layoutSidenav" class="mb-4">
        <div id="layoutSidenav_content">
            <div class="container-fluid px-4 px-lg-5 mb-5" style="margin-top: 91px">
                <p class="fs-1 fw-bold">Quiz Name: ${QUIZZ.title}</p>
                <p class="fs-2 fw-light">Total Question: ${QUIZZ.totalQues}</p>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10">
                            <!-- Blog entries-->
                            <form action="DoQuizzServlet" method="post" id="myForm">
                                <input type="hidden" name="quizzId" value="${requestScope.id}" />
                                <div class="row">
                                    <div class="col-12">
                                        <div>
                                            <ol type="1">
                                                <c:forEach var="question" items="${requestScope.list}">
                                                    <div class="mb-3 mx-auto d-block shadow p-3 mb-5 bg-white rounded" style="padding: 10px 10px 10px 10px; border-radius: 8px; width: 32%; margin-left: 10px; width: 100% !important">
                                                        <li class="ms-3">
                                                            <span>${question.question_name} </span>
                                                            <input type="hidden" name="questionId" value="${question.questionID}">
                                                            <ol type="A" class="mt-3">
                                                                <c:forEach var="ans" items="${question.choices}">
                                                                    <li class="d-flex mb-1 row">
                                                                        <input type="radio" name="answer_${question.questionID}" value="${ans.id}" class="col-1 question" style="width: 14px">
                                                                        <span class="col-11"><input type="text" name="name" value="${ans.choice}" class="col-6 form-control ms-2" readonly></span>
                                                                    </li>
                                                                </c:forEach>
                                                            </ol>
                                                        </li>
                                                    </div>
                                                    <br>
                                                </c:forEach>
                                            </ol>
                                            <div class="col-12">
                                                <div class="d-flex justify-content-center">
                                                    <!--<button type="submit" class="btn btn-primary px-4 py-2 fw-bold">check</button>-->
                                                    <button onclick="checkDone(event)" type="submit" name="btnAction" value="submitQuizz" class="btn btn-primary px-4 py-2 fw-bold">Submit</button> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function checkDone(e) {
            var a = JSON.parse('${requestScope.list}');
            for (var i = 0; i < a.length; i++) {
                var count = 0;
                var temp = $('[name="' + 'answer_' + a[i].questionID + '"]');
                for (var idx = 0; idx < temp.length; idx++) {
                    if (temp[idx].checked) {
                        count++;
                        break;
                    }
                }
                if (count == 0) {
                    var a = confirm("You haven't finished the test. Are you sure you want to submit?");
                    if (a == false) {
                        e.preventDefault();
                    }
                    break;
                }
            }
        }
    </script>
</body>
</html>
