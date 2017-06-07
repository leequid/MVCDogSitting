<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="master.css" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Sitters</title>
</head>
<body>
	<c:forEach var="sitter" items="${sitters}">
		<p>${sitter.user.contact.firstName} ${sitter.user.contact.lastName}</p>
		<p>${sitter.user.contact.street} ${sitter.user.contact.city}, ${sitter.user.contact.state} ${sitter.user.contact.zipCode}</p>
		<form action="setAppointment.do">
			<input type="hidden" value="${sitter.id}" name="sitterId"/>
			<input type="submit" value="Set Appointment"/>
		</form>
		<form action="setRating.do">
			<input type="hidden" value="${sitter.id}" name="sitterId"/>
			<input type="submit" value="Rate Sitter"/>
		</form>
		<hr>
	</c:forEach>
	
</body>
</html>