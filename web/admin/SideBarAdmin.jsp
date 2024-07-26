<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="main-menu">
    <div class="logo-container">
        <a href="#">
            <img src="img/logo.png" alt="Logo" class="logo"/>
            <h2 class="site-title">E-Learning</h2>
        </a>
    </div>

    <ul>
        <li>
            <a href="/SWP391/admin/dashboard">
                <i class="fa fa-home fa-2x"></i>
                <span class="nav-text">
                    Dashboard
                </span>
            </a>
        </li>
        <c:if test="${sessionScope.acc.roleID == 1}">
            <li class="has-subnav">
                <a href="#">
                    <i class="fa fa-globe fa-2x"></i>
                    <span class="nav-text">
                        Manage User
                    </span>
                </a>
                <ul class="subnav">
                    <li><a href="manageaccount?roleID=4">View Mentee</a></li>
                    <li><a href="manageaccount?roleID=3">View Mentor</a></li>
                    <li><a href="manageaccount?roleID=2">View Manager</a></li>
                    h
                </ul>
            </li>
            <li>
                <a href="/SWP391/admin/addmanager">
                    <i class="fa  fas fa-user-plus fa-2x"></i>
                    <span class="nav-text">
                        Add Manager
                    </span>
                </a>
            </li>
        </c:if>
        <c:if test="${sessionScope.acc.roleID == 2}">
            <li>
                <a href="/SWP391/manageMentor">
                    <i class="fa fas fa-blind fa-2x"></i>
                    <span class="nav-text">
                        Manage Mentor
                    </span>
                </a>
            </li>
            <li>
                <a href="/SWP391/manager">
                    <i class="fa fas fa-book fa-2x"></i>
                    <span class="nav-text">
                        Manage Course
                    </span>
                </a>
            </li>
        </c:if>
    </ul>

    <ul class="logout">
        <li>
            <a href="/SWP391/logout">
                <i class="fa fa-power-off fa-2x"></i>
                <span class="nav-text">
                    Logout
                </span>
            </a>
        </li>  
    </ul>
</nav>