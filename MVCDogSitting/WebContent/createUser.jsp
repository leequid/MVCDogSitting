<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="master.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Permanent+Marker" rel="stylesheet">
<title>Register New User</title>
</head>
<body>
	<section class="navbar">
	<div class="grid-row row">
		<c:if test="${sessionScope.user.userName == null}">
			<div class="col">
			<p class="wagly">WAGLY</p>
			<img class ="doggy" src="https://tailwagphotography.com/images/tailwag-logo.png">
				<a class="button" href="viewSitters.do">Home</a>
			</div>
			<div class="col">
				<a class="button" href="loginPage.do">Login</a>
			</div>
			<div class="col">
				<a class="button" href="profilePage.do">Profile</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.user.userName != null}">
			<div class="col">
			<p class="waglysession">WAGLY</p>
			<img class ="doggysession" src="https://tailwagphotography.com/images/tailwag-logo.png">
				<a class="button" href="viewSitters.do">Home</a>
			</div>
			<div class="col">
				<a class="button buttonlogout" href="logout.do">Logout</a> <img
					class="sad"
					src="https://s3-us-west-1.amazonaws.com/studyladder-prod/public/cdn/materials-library/sl-plus/800/r265q2634a2639.png" />
			</div>
			<div class="col"><div id="balance">Hi ${sessionScope.user.userName}!<br/>
				Your balance is :
			<fmt:formatNumber value="${sessionScope.user.balance}" type="currency" /></div>
			</div>
			<div class="col">
				<a class="button" href="profilePage.do">Profile</a>
			</div>
		</c:if>
	</div>
	</section>

	<br>
	<br>
	<br>
	<br>
	<form:form action="createUser.do" method="POST" modelAttribute="user">
		<label>Enter a User Name: <form:input path="userName" /></label>
		<form:errors path="userName" />
		<br />
		<label>Create password: <form:password path="password" /></label>
		<form:errors path="password" />
		<br />

		<label>Do you want to be a sitter? <form:checkbox path="activeSitter"
			 value="true"/>
		</label>
		<label>When are you available?
 		<select name="availability">
			<option value="ANYTIME">ANYTIME</option>
			<option value="WEEKENDS">WEEKENDS</option>
			<option value="WEEKDAYS">WEEKDAYS</option>
			<option value="EVENINGS">EVENINGS</option>
			<option value="OVERNIGHTS">OVERNIGHTS</option>
		</select> 

		</label> 
		<input type="submit" value="Register" />
	</form:form>
</body>
</html>