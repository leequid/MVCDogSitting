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
		<title>Login</title>
	</head>
	<body>
		<jsp:include page="_nav.jsp" />
		<br>
		<br>
		<br>
		<br>
		<!-- Don't use inline styles -->
		<p style="color: red;">Please login or create an account to continue</p>
		<form:form action="login.do" method="POST" modelAttribute="user">
			<form:label path="userName">User Name:</form:label>
			<form:input path="userName" />
			<form:errors path="userName" />
			<br />
			<form:label path="password">Password:</form:label>
			<form:input path="password" />
			<form:errors path="password" />
			<input type="hidden" value="${sitter.id}" name="sitterId" />
			<input type="submit" value="Login" />
		</form:form>
		<br>
		<form:form action="goToCreateUser.do" method="GET">
			<input type="submit" value="Sign Up" />
		</form:form>
			
		

	</body>
</html>