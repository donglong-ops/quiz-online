<%-- 
    Document   : quizPage.jsp
    Created on : May 25, 2018, 11:42:33 AM
    Author     : AVITA
--%>

<%@page import="vanlt.dtos.QuestionDto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    List<QuestionDto> questions = (List<QuestionDto>) request.getAttribute("quizData");
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="resource/css/quizPage.css">
        <link rel="stylesheet" href="resource/css/index.css" type="text/css">
        <link rel="stylesheet" href="resource/css/common.css" type="text/css">
        <script src="resource/js/quizPage.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}"/>
        <c:set var="listQuestion" value="${requestScope.quizData}"/>
        <div id="main-panel">
            <jsp:include page="navbar.jsp" />   
            <div id="quizContainer">
                <c:if test="${not empty listQuestion}"> 
                    <h3>Welcome <span class="userName">${sessionScope.USER.userName}</span></h3>
                    <h4 id="TimeSpan">Time remaining: <span id="timeDisplay">00:00</span></h4>
                    <h5 id="qustionPos">Question: 0/${listQuestion.size()}</h5>
                    <form id="quizForm" action="TakeQuiz" method="post">
                        <input type="hidden" name="req" value="quizResult">
                        <input type="hidden" name="numOfQuiz" value="${listQuestion.size()}">
                        ${listQuestion.get(currentQuiz).content}
                        <input type="submit" value="Finish">    
                        <button id="next" type="button" onclick="nextQuestion()">Next</button>
                    </form>
                </c:if>
                <c:if test="${empty listQuestion}">
                    <h3>No quiz found</h3>            
                </c:if>
            </div>
            <script>
            setNumOfQuiz(${requestScope.numOfQuiz});
            quizStart();
            </script>
        </div>
    </body>
</html>
