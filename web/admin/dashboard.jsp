<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link href="css/sidebar-admin.css" rel="stylesheet" type="text/css"/>
    </head>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>
<body>
    <div class="area">
        <div id="chart"></div>
    </div>
    <%@include file="SideBarAdmin.jsp" %>
    <script>
        var mentorData = {
        <c:forEach var="entry" items="${mentorData}">
        '${entry.key}': ${entry.value},
        </c:forEach>
        };
        var menteeData = {
        <c:forEach var="entry" items="${menteeData}">
        '${entry.key}': ${entry.value},
        </c:forEach>
        };
        var daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
        var mentorCounts = daysOfWeek.map(day => mentorData[day] || 0);
        var menteeCounts = daysOfWeek.map(day => menteeData[day] || 0);
        var options = {
        chart: {
        type: 'area',
                height: 350,
                zoom: {
                enabled: false
                }
        },
                dataLabels: {
                enabled: false
                },
                stroke: {
                curve: 'smooth'
                },
                series: [{
                name: 'Mentors',
                        data: mentorCounts
                }, {
                name: 'Mentees',
                        data: menteeCounts
                }],
                xaxis: {
                categories: daysOfWeek,
                },
                tooltip: {
                x: {
                format: 'dd/MM'
                },
                },
                fill: {
                type: 'gradient',
                        gradient: {
                        shadeIntensity: 1,
                                opacityFrom: 0.7,
                                opacityTo: 0.9,
                                stops: [0, 90, 100]
                        }
                },
                colors: ['#1E90FF', '#FF6347'],
                legend: {
                position: 'top',
                        horizontalAlign: 'left'
                }
        };
        var chart = new ApexCharts(document.querySelector("#chart"), options);
        chart.render();
    </script>
</body>
</html>
<script src="js/SideBar.js" type="text/javascript"></script>