<%-- 
    Document   : quizPrepare
    Created on : JAN 30, 2021, 11:21:56 AM
    Author     : AVITA
--%>

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
            <h3>Welcome <span class="userName">${sessionScope.USER.userName}</span></h3>
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
