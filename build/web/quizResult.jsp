<%-- 
    Document   : quizResult
    Created on : JAN 30, 2021, 15:15:38 PM
    Author     : AVITA
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resource/css/quizPage.css">
        <link rel="stylesheet" href="resource/css/index.css" >
        <link rel="stylesheet" href="resource/css/common.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="navbar.jsp" />   
            <p>Your score: 
                <span class="bold ${requestScope.className}">
                    ${requestScope.result} ${requestScope.percent} - ${requestScope.status}
                </span>
            </p>
            <form action="takeQuiz" method="post">
                <label> Choose Subject : 
                <select name="subId">
                    <option value="1">PRJ311 </option>
                    <option value="2">PRJ213</option>
                </select> 
                <input type="submit" value="Start Now">
            </form>
        </div>
    </body>
</html>
