<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 Error - Page Not Found</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #333;
        }
        .container {
            text-align: center;
        }
        .error-code {
            font-size: 120px;
            font-weight: bold;
            color: #435d7d; /* Your primary color */
        }
        .error-message {
            font-size: 24px;
            margin: 20px 0;
        }
        .error-description {
            font-size: 16px;
            color: #666;
            margin-bottom: 30px;
        }
        .home-button {
            background-color: #435d7d; /* Your primary color */
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s;
        }
        .home-button:hover {
            background-color: #2c4a6b; /* Slightly darker shade */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="error-code">404</div>
        <div class="error-message">Oops! Page Not Found</div>
        <div class="error-description">
            The page you are looking for might have been moved or deleted.<br>
            Please check the URL or return to the homepage.
        </div>
        <a href="/SWP391/home" class="home-button">Go to Homepage</a>
    </div>
</body>
</html>
