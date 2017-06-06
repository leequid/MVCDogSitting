<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="master.css" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Set Appointment</title>
</head>
<body>
	Sitter: ${sitter.user.contact.firstName} ${sitter.user.contact.lastName}
	<form action="makeAppointment.do" method="POST">
		<label>Enter Start Date: <input type="text" value="yyyy-MM-dd" name="startDate" /></label> 
		<label>Enter Start Time: <input type="text" value="HH:mm" name="startTime" /></label> 
		<label>Enter End Date: <input type="text" value="yyyy-MM-dd" name="endDate" /></label> 
		<label>Enter End Time: <input type="text" value="HH:mm" name="endTime" /></label> 
		<label>Select Dog<select name="dogId">
			<c:forEach var="dog" items="${sessionScope.user.dogs}">
				<option value="${dog.id}">${dog.name}</option>
			</c:forEach>
			
		</select></label>
		<input type="hidden" value="${sitter.id}" name="sitterId" />
		<input type="submit" value="Save Appointment" />
	</form>
</body>
</html>