<%-- 
    Document   : login
    Created on : Nov 26, 2017, 4:19:51 PM
    Author     : a_bas
--%>



<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
	
	<title>Login Form</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>    <body>
        
        
        <div class="generic-container">
	<div class="well lead">Login Form</div>
 	<form:form method="POST" modelAttribute="login" class="form-horizontal">
		<form:input type="hidden" path="id" id="id"/>
		
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="ssoId">SSO ID</label>
				<div class="col-md-7">
				<form:input type="text" path="ssoId" id="ssoId" class="form-control input-sm"/>			
				
                                
                                </div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="password">Password</label>
				<div class="col-md-7">
					<form:input type="password" path="password" id="password" class="form-control input-sm" />
				
				</div>
			</div>
		</div>

		
		
		<div class="row">
			<div class="form-actions floatRight">
				
				<input type="submit" value="login" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
			
			</div>
		</div>
	</form:form>
	</div>
        
        
        
    </body>
</html>
