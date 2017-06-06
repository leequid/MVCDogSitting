<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="master.css" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<section>
  <div class="grid-row row">
    <div class="col">Grid Column 1</div>
    <div class="col">Grid Column 2</div>
    <div class="col">Grid Column 3</div>
    <div class="col">Grid Column 4</div>
    <div class="col">Grid Column 5</div>
  </div>
</section>

	<form:form action="login.do" method="POST" modelAttribute="user">
		<form:label path="userName">User Name:</form:label>
		<form:input path="userName" />
		<form:errors path="userName" />
		<br />
		<form:label path="password">Password:</form:label>
		<form:input path="password" />
		<form:errors path="password" />
		<input type="submit" value="Login" />
	</form:form>
	
	<a href="goToCreateUser.do">Create New Account</a>
	
		<c:forEach var="sitter" items="${sitters}">
		<p>${sitter.user.contact.firstName} ${sitter.user.contact.lastName}</p>
		<p>${sitter.user.contact.street} ${sitter.user.contact.city}, ${sitter.user.contact.state} ${sitter.user.contact.zipCode}</p>
		<form action="goToLogin.do" method="GET">
			<input type="hidden" value="${sitter.id}" name="sitterId"/>
			<input type="submit" value="Set Appointment"/>
		</form>
	</c:forEach>
</body>
</html>