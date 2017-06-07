<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="master.css" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register New User</title>
</head>
<body>
<section>
<div class="grid-row row">
<c:if test="${sessionScope.user.userName == null}">
<div class="col"><a class="button" href="welcomePage.do">Home</a></div>
<div class="col"><a class="button" href="loginPage.do">Login</a></div>
<div class="col"><a class="button" href="profilePage.do">Profile</a></div>
 </c:if>

 <c:if test="${sessionScope.user.userName != null}">
<div class="col"><a class="button" href="welcomePage.do">Home</a></div>
<div class="col"><a class="button" href="logout.do">Logout</a></div>
 <div class="col">Hi ${sessionScope.user.contact.firstName}!</div>
<div class="col"><a class="button" href="profilePage.do">Profile</a></div>
 </c:if>
  </div>
</section>
	<form:form action="createUser.do" method="POST" modelAttribute="user">
		<label>Enter a User Name: <form:input path="userName" /></label>
		<form:errors path="userName" />
		<br />
		<label>Create password: <form:password path="password" /></label>
		<br />
		<input type="submit" value="Register" />
	</form:form>
</body>
</html>