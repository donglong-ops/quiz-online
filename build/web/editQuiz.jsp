<%-- 
    Document   : editQuiz
    Created on : JAN 25, 2021, 9:00:21 AM
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
            <c:if test="${not empty UPDATEFAIL}">
                <span class="failed">${requestScope.UPDATEFAIL}</span>
            </c:if>
            <c:set var="quesDto" value="${requestScope.DTO}"/>
            <form action="updateQuestion" method="post" class="form-action" >
                <input type="hidden" name="questionID" value="${quesDto.id}" />
                <table>
                    <tbody>
                        <tr>
                            <td>Question: </td>
                            <td><textarea id="content" name="content">${quesDto.content}</textarea></td>
                        </tr>
                        <tr>
                            <td>Option 1</td>
                            <td><textarea name="opt1" required>${quesDto.option1}</textarea></td>
                        </tr>
                        <tr>
                            <td>Option 2</td>
                            <td><textarea name="opt2" required>${quesDto.option2}</textarea></td>
                        </tr>
                        <tr>
                            <td>Option 3</td>
                            <td><textarea name="opt3" required >${quesDto.option3}</textarea></td>
                        </tr>
                        <tr>
                            <td>Option 4</td>
                            <td><textarea name="opt4" required>${quesDto.option4}</textarea></td>
                        </tr>
                        <tr>
                            <td>Answer(s)</td>
                            <td>
                                <input type="radio" name="ans" value="1" required
                                       <c:if test="${quesDto.answer == 1}"> 
                                           checked="checked"
                                       </c:if>> Option 1
                                <input type="radio" name="ans" value="2" required
                                       <c:if test="${quesDto.answer == 2}"> 
                                           checked="checked"
                                       </c:if>> Option 2
                                <input type="radio" name="ans" value="3" required
                                       <c:if test="${quesDto.answer == 3}"> 
                                           checked="checked"
                                       </c:if>> Option 3
                                <input type="radio" name="ans" value="4" required
                                       <c:if test="${quesDto.answer == 4}"> 
                                           checked="checked" 
                                       </c:if>> Option 4
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Update"></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
