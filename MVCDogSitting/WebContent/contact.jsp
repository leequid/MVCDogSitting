<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<jsp:include page="_head.jsp"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Contact Information</title>
	</head>
	<body>
		<jsp:include page="_nav.jsp" />
		<br>
		<br>
		<br>
		<br>
		<form:form action="createContact.do" method="POST"
			modelAttribute="contact">
			<label>First Name: <form:input path="firstName" /></label>
			<form:errors path="firstName" />
			<br />
			<label>Last Name: <form:input path="lastName" /></label>
			<form:errors path="lastName" />
			<br />

			<label>Email: <form:input path="email" /></label>
			<form:errors path="email" />
			<br />
			<label>Phone Number: <form:input path="phone" /></label>
			<form:errors path="phone" />
			<br />
			<label>Street Address: <form:input path="street" /></label>
			<br />
			<label>City: <form:input path="city" /></label>
			<br />
			<label>State: <form:input path="state" /></label>
			<br />
			<label>ZipCode: <form:input path="zipCode" /></label>
			<form:errors path="zipCode" />
			<br />
			<form:hidden path="id" value="${contactId}" />
			<input type="submit" value="Register" />
		</form:form>
	</body>
</html>