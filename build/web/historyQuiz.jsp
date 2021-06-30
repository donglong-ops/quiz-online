<%-- 
    Document   : historyQuiz
    Created on : JAN 25, 2021, 8:01:38 PM
    Author     : AVITA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="vanlt.dtos.QuizHistoryDto"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <c:set var="history" value="${sessionScope.quizHistoryById}"/>
            <c:if test="${not empty sessionScope.USER}">
                <li><p style="color: red">Welcome, ${sessionScope.USER.userName}</p></li>
                </c:if>
            <Form action="searchQ" method="Post">
                <select name="status">
                    <option value="0">Status </option>
                    <option value="1">Passed </option>
                    <option value="2">Failed </option>
                </select> 
                <select name="subjectID">
                    <option value="0">All </option>
                    <option value="1">PRJ311 </option>
                    <option value="2">PRJ213 </option>
                </select> 
                <button>Search</button>
            </Form>
            <c:if test="${not empty history }">
                <table class="tableHis"style="margin-left: 10%">
                    <h3>Quiz history<br></h3>
                    <thead>
                        <tr>
                            <th>Student</th>
                            <th>Total Question</th>
                            <th>Correct Question</th>
                            <th>Mark</th>
                            <th>Status Quiz</th>
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
