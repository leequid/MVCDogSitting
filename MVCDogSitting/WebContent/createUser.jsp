<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register New User</title>
</head>
<body>
	<form:form action="createUser.do" method="POST" modelAttribute="user">
		<label>Enter your email: <form:input path="email" /></label>
		<br />
		<label>First Name: <form:input path="firstName" /></label>
		<br />
		<label>Last Name: <form:input path="lastName" /></label>
		<br />
		<label>Street Address: <form:password path="password" /></label>
		<br />
		<label>City: <form:input path="city" /></label>
		<br />
		<label>State: <form:input path="state" /></label>
		<br />
		<label>ZipCode: <form:input path="zipcode" /></label>
		<br />
		<label>Phone Number: <form:input path="phone" /></label>
		<br />
		<hr>
		<label>Enter a User Name: <form:input path="userName" /></label>
		<br />
		<label>Create password: <form:password path="password" /></label>
		<br />
		<input type="submit" value="Register" />
	</form:form>
</body>
</html>