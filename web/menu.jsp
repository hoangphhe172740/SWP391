<%-- 
    Document   : menu
    Created on : Jun 15, 2024, 7:04:09 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- begin of Menu--->

<nav class="navbar navbar-expand-md navbar-dark bg-dark navMenu">
    <div class="menu">
        <div class="col-md-9 col-lg-6 col-xl-5"><a>
                <img src="img/360_F_128939133_0WXTVdZ1bv1NXusQsdYYJLIwTVoXHqQ7.jpg"
                     class="img-fluid" alt="Sample image"></a>
                     
        </div>
        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul>
                <c:if test="${sessionScope.acc.role == 2}">
                    <li class="nav-item">
                        <a class="nav-link" href="manageMentor">Manage Mentor</a>
                    </li> 
                </c:if>
                <c:if test="${sessionScope.acc.role == 2}">
                    <li class="nav-item">
                        <a class="nav-link" href="manageCourse">Manage Course</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.role == 2}">
                    <li class="nav-item">
                        <a class="nav-link" href="statistic">Statistic</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <c:set value="${sessionScope.acc}" var="acc"/>
                    <li class="nav-item">
                        <a class="nav-link" href="profile?id=${acc.id}"><i class="fa-solid fa-user"></i>${acc.email}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                </c:if>
            </ul>
            
        </div>
    </div>
</nav>
