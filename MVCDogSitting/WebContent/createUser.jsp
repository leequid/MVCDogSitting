<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<jsp:include page="_head.jsp"/>
		<title>Register New User</title>
	</head>
	<body>
		<jsp:include page="_nav.jsp" />
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