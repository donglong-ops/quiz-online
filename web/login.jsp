<%-- 
    Document   : login
    Created on : JAN 22, 2021, 10:57:43 AM
    Author     : AVITA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="resource/css/index.css" type="text/css">
        <link rel="stylesheet" href="resource/css/common.css" type="text/css">
        <link rel="stylesheet" href="resource/css/loginForm.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Form</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="navbar.jsp" />   
            <c:if test="${not empty requestScope.ERRORLOGIN}" >
                <span class="failed">${requestScope.ERRORLOGIN}</span>
            </c:if>
            <div>
                <form action="login" method="post">
                    <div style="text-align: center">
                        <h2>Login Form</h2>
                        <label>Email</label>
                        <input id="test" type="text" name="username" value="${param.username}" required/><br/>
                        <label>Password</label>
                        <input id="test" type="password" name="password" required/><br/>
                        <input type="submit" value="Login"/>
                        <input type="reset" value="Reset"/> <br>  Or <br/>
                        <a href="createAccount">Click here to Sign-In</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
