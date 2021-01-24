<%-- 
    Document   : userInfo
    Created on : JAN 21, 2021, 12:01:38 PM
    Author     : AVITA
--%>

<%@page import="vanlt.dtos.QuizHistoryDto"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resource/css/index.css" type="text/css">
        <link rel="stylesheet" href="resource/css/common.css" type="text/css">
        <link rel="stylesheet" href="resource/css/loginForm.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="navbar.jsp" />  
            <c:set var="user" value="${sessionScope.USER}"/>
            <c:set var="history" value="${sessionScope.quizHistory}"/>
            <c:if test="${not empty sessionScope.USER}">
                <li><p style="color: red">Welcome, ${sessionScope.USER.userName}</p></li>
                </c:if>
            <h1>User Information</h1>
            Username: ${user.userName}<br>
            Email: ${user.email}<br>
            <c:if test="${user.type == 1}">
                Type: Teacher<br>
            </c:if>
            <c:if test="${user.type == 0}">
                Type: Student<br>
            </c:if>
            <c:if test="${not empty history && user.type == 1 }">
                <table style="margin-left: 15%">
                    <h3>Quiz history<br></h3>
                    <thead>
                        <tr>
                            <th>Student</th>
                            <th>Total Question</th>
                            <th>CorrectQuestion</th>
                            <th>Mark</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="hisDto" items="${history}" varStatus="counter">
                            <c:set var="mark" value="${hisDto.getMark(hisDto.correctAnswer, hisDto.numOfQuiz)}"/>
                            <tr>
                                <td>${hisDto.studentName}</td>
                                <td>${hisDto.numOfQuiz}</td>
                                <td>${hisDto.correctAnswer}</td>
                                <td>${mark}</td>
                                <td>${hisDto.getStatusQuiz(mark)}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty history}">
                <h1 style="color: red">No quiz history found</h1>
            </c:if>
        </div>
    </body>
</html>
