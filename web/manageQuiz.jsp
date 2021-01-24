<%-- 
    Document   : manageQuiz
    Created on : JAN 25, 2021, 11:02:57 AM
    Author     : AVITA
--%>

<%@page import="vanlt.dtos.QuestionDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resource/css/index.css" type="text/css">
        <link rel="stylesheet" href="resource/css/common.css" type="text/css">
        <link rel="stylesheet" href="resource/css/loginForm.css" type="text/css">
        <link rel="stylesheet" href="resource/css/manageQuiz.css">
        <script src="resource/js/manageQuiz.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main-panel">
            <jsp:include page="navbar.jsp" />  
            <c:set var="listQuestion" value="${requestScope.quizData}"/>
            <c:set var="numOfPage" value="${requestScope.numOfPage}"/>
            <Form action="managerQuestion" method="Post">
                <input type="text" placeholder="Search Question..." name="txtSearch" value="${param.txtSearch}" />
                <select name="subId">
                    <option value="0">ALL </option>
                    <option value="1">PRJ311 </option>
                    <option value="2">PRJ213</option>
                </select> 
                <button>Search</button>
            </Form>
            <c:if test="${not empty listQuestion }">
                <h3>Number of question: <span class="blue">${requestScope.numOfQuiz}</span></h3>
                <table>
                    <colgroup>
                        <col class="labelCol1">
                        <col class="labelCol">
                        <col class="fieldCol">
                        <col class="fieldAction">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Question</th>
                            <th>Date Created</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${listQuestion}" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${dto.content}</td>
                                <td>${dto.created}</td>
                                <td><a href="managerQuestion?id=${dto.id}" onclick="return confirm('Are you sure to Delete Question?');">Delete</a>
                                    <a href="editQuestion?id=${dto.id}">Edit</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="pageList">
                    <div class="form-inline">
                        <c:forEach begin="1" end="${numOfPage}" varStatus="counter" step="1">
                            <form action="managerQuestion" method="POST">
                                <input type="hidden" name="pageNum" value="${counter.count}" />
                                <input id="page" type="submit" value="${counter.count}"/>
                            </form>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty listQuestion }">   
                <h5>No question available</h5>
            </c:if>
        </div>
    </body>
</html>
