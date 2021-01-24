<%-- 
    Document   : navbar
    Created on : Jan 19, 2021, 8:48:33 PM
    Author     : AVITA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resource/css/index.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="nav-bar">
            <ul>
                    <c:if test="${not empty sessionScope.USER}">
                    <li><a href="userIf">Home</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.USER && sessionScope.USER.type == 0}">
                    <li><a href="quizPrepare">Take Quiz</a></li>
                    </c:if>
                    <c:if test="${empty sessionScope.USER}">
                    <li><a href="login.jsp">Login Here</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.USER && sessionScope.USER.type == 0}">
                    <li><a href="hisUser">History Quiz</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.USER && sessionScope.USER.type == 1}">
                    <li><a href="makeQuestionPage">Make Question</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.USER && sessionScope.USER.type == 1}">
                    <li><a href="managerQuestion">Manage Quiz</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.USER}">
                    <li><a href="Logout">LogOut</a></li>
                    </c:if>
            </ul>
        </div>
    </body>
</html>
