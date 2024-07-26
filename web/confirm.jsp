<%-- 
    Document   : confirm
    Created on : Jul 1, 2024, 3:53:58 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm</title>
    </head>
    <style>
        /* Body Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* Container Styles */
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 30px;
        }

        /* Table Wrapper Styles */
        .table-wrapper {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        /* Table Title Styles */
        .table-title {
            margin-bottom: 20px;
        }

        .table-title h2 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        /* Confirm Form Styles */
        .confirm {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        .confirm label {
            display: block;
            font-size: 16px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .confirm input[type="text"],
        .confirm input[type="email"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .confirm input[type="text"]:focus,
        .confirm input[type="email"]:focus {
            border-color: #6c63ff;
            outline: none;
        }

        .confirm input[readonly] {
            background-color: #e6e6e6;
            cursor: not-allowed;
        }

        .confirm button[type="submit"] {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #6c63ff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .confirm button[type="submit"]:hover {
            background-color: #5551cc;
        }
        .confirm .confirm-email{
            padding-bottom: 20px;
        }
    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6 d-flex justify-content-">
                                <h2>Course confirmation</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="confirm">
                    <form action="confirm-control" method="post">
                        <div class="confirm-course">
                            <label>Course ID</label>
                            <input type="text" id="courseID" name="courseID"  readonly value="${listCourse.id}" required>
                    </div>
                    <div class="confirm-id">
                        <label>AccountID</label>
                        <input type="text" name="account"  readonly value="${sessionScope.acc.id}"required>
                    </div>
                    <div class="confirm-email">
                        <label>Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <button type="submit">Submit</button>
                </form>
            </div>
        </div>
    </body>
</html>
