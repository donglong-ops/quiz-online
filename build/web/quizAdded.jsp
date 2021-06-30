<%-- 
    Document   : quizAdded
    Created on : JAN 26, 2021, 11:38:28 AM
    Author     : AVITA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="resource/css/quizPage.css">
        <link rel="stylesheet" href="resource/css/index.css" type="text/css">
        <link rel="stylesheet" href="resource/css/common.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="navbar.jsp" />   
            <h2>Question added successfully</h2>
            <a href="makeQuestionPage">Add another question</a>
        </div>
    </body>
</html>
