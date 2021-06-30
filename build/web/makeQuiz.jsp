<%-- 
    Document   : makeQuiz
    Created on : JAN 23, 2021, 11:00:21 AM
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
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="navbar.jsp" />   
            <c:if test="${not empty requestScope.message}">
                <span class="failed">${requestScope.message}</span>
            </c:if>
            <form action="createQuestion" method="post" class="form-action" >
                <table>
                    <tbody>
                        <tr>
                            <td>Question: </td>
                            <td><textarea id="content" name="content" required>${param.content}</textarea></td>
                        </tr>
                        <tr>
                            <td>Option 1</td>
                            <td><textarea name="opt1" required>${param.opt1}</textarea></td>
                        </tr>
                        <tr>
                            <td>Option 2</td>
                            <td><textarea name="opt2" required>${param.opt2}</textarea></td>
                        </tr>
                        <tr>
                            <td>Option 3</td>
                            <td><textarea name="opt3" required>${param.opt3}</textarea></td>
                        </tr>
                        <tr>
                            <td>Option 4</td>
                            <td><textarea name="opt4" required>${param.opt4}</textarea></td>
                        </tr>
                        <tr>
                            <td>Answer(s)</td>
                            <td>
                                <input type="radio" name="ans" value="1" required> Option 1
                                <input type="radio" name="ans" value="2" required> Option 2
                                <input type="radio" name="ans" value="3" required> Option 3
                                <input type="radio" name="ans" value="4" required> Option 4
                            </td>
                        </tr>
                        <tr>
                            <td>Subject</td>
                            <td>   
                                <select name="subId" style="width: 180px">
                                    <option value="1">PRJ311 </option>
                                    <option value="2">PRJ321</option>
                                </select> 
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td> <input type="submit" value="Save" style="width: 150px; margin-right:  10%"></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
