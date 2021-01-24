<%-- 
    Document   : registerAccount
    Created on : Jan 19, 2021, 8:46:59 PM
    Author     : AVITA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resource/css/common.css">
        <link rel="stylesheet" href="resource/css/loginForm.css">
        <title>Register Account Page</title>
    </head>
    <body>
        <div id="main-panel" style="text-align: center">
            <jsp:include page="navbar.jsp" />
            <c:if test="${not empty requestScope.CREATEFAIL}" >
                <span class="failed">${requestScope.CREATEFAIL}</span>
            </c:if>
            <div id="main-content" >
                <h2 class="loginFornTitle">Registration form</h2>
                <form action="createAccountServlet" method="post">
                    <input type="hidden" name="request" value="register">
                    <table>
                        <tbody>
                            <tr>
                                <td>Email: </td>
                                <td><input type="email" name="email" value="${param.email}"required></td>
                            </tr>
                            <tr>
                                <td>Password: </td>
                                <td><input type="password" name="password" required></td>
                            </tr>
                            <tr>
                                <td>Type</td>
                                <td>
                                    <select name="roleType" >
                                        <option value='0'>Student</option>
                                        <option value='1'>Teacher</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Full Name: </td>
                                <td><input type="text" name="username" value="${param.username}" required></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Register">
                                    <input type="reset" value="Reset"></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
