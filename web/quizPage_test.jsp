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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="listQuestion" value="${requestScope.quizData}"/>
        <div id="main-panel">
            <jsp:include page="navbar.jsp" />   

            <div class="container">
                <c:if test="${not empty listQuestion}">
                    <h3>Welcome <span class="userName">${sessionScope.USER.userName}</span></h3>
                    <div class="row justify-content-center">
                        <h4 class="col-8 text-center" id="TimeSpan">Time remaining: <span id="timeDisplay">00:00</span></h4>
                    </div>
                    <hr class="col-8">
                    <input type="hidden" name="numOfQuiz" value="${listQuestion.size()}">
                    <form id="quizForm" action="finishQuiz" method="post">  
                        <div class="row justify-content-center">
                            <h5 class="col-8 text-start" id="qustionPos">Question: 0/0</h5>
                        </div>
                        <%
                            for (int i = 0; i < questions.size(); i++) {
                                QuestionDto q = questions.get(i);
                        %>
                        <div id="q<%=i%>" class="hidden">
                            <div class="row justify-content-center">
                                <p class="col-8 text-start"><%=q.getContent()%></p>
                                <div class="col-8">
                                    <input type="hidden" name="q<%=i%>" value="<%=q.getId()%>"/>
                                    <ul style="text-align: left">
                                        <%
                                            for (int j = 0; j < q.getOption().size(); j++) {
                                                String ans = q.getOption().get(j);
                                        %>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="ans" value="<%= j + 1%>" id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">
                                                <%=ans%>
                                            </label>
                                        </div>
                                        <% } %>
                                    </ul>
                                    <hr>
                                    <div class="row">
                                        <input class="btn btn-success col-3" type="submit" value="Finish"> 
                                        <div class="col-6"></div>
                                        <button class="btn btn-outline-primary col-3 float-right" id="next" type="button" onclick="nextQuestion()">Next</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% }%>
                    </form>
                </c:if>
                <c:if test="${empty listQuestion}">
                    <h3>No quiz found</h3>            
                </c:if>
            </div>
            <script>
                setNumOfQuiz(<%=questions.size()%>);
                quizStart();
            </script>
        </div>
    </body>
</html>
