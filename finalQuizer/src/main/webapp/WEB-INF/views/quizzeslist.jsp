<%-- 
    Document   : quizzeslist
    Created on : Nov 27, 2017, 9:29:58 PM
    Author     : a_bas
--%>



<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
	
	<title>Quizzes List</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
    <body>
    	<div class="generic-container">
		<div class="panel panel-default">
			  <!-- Default panel contents -->
		  	<div class="panel-heading"><span class="lead">Quizzes List </span></div>
			<table class="table table-hover">
	    		<thead>
		      		<tr>
				        <th>Quiz Id</th>
				        <th>Title</th>
				        <th>Description</th>
				        
				        <th width="100"></th>
				        <th width="100"></th>
					</tr>
		    	</thead>
	    		<tbody>
				<c:forEach items="${quizzes}" var="quiz">
					<tr>
                                                <td>${quiz.id}</td>
						<td>${quiz.title}</td>
						<td>${quiz.description}</td>
                                                
						<td><a href="<c:url value='/edit-quiz-${quiz.id}' />" class="btn btn-success custom-width">edit</a></td>
						<td><a href="<c:url value='/delete-quiz-${quiz.id}' />" class="btn btn-danger custom-width">delete</a></td>
					</tr>
				</c:forEach>
	    		</tbody>
	    	</table>
		</div>
	 	<div class="well">
	 		<a href="<c:url value='/newQuiz' />">Add New User</a>
                        <a href="<c:url value='/list' />">Logout</a>
	 	</div>
   	</div>
        
        
        
    
    
    </body>
</html>
