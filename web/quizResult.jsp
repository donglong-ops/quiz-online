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
        <title>Result Quiz Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="navbar.jsp" />   
            <form action="quizPrepare" method="post">
                    <div class="row justify-content-center">
                        No.Correct Answer: ${requestScope.correctAnswer} / ${requestScope.numOfQuiz}</br>
                        Point: ${requestScope.result}
                    </div>
                <input type="submit" value="Take Another Quiz">
            </form>
        </div>
    </body>
</html>
