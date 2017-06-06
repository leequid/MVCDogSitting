<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Set Appointment</title>
</head>
<body>
	Sitter: ${sitter.user.contact.firstName} ${sitter.user.contact.lastName}
	<form action="makeAppointment.do" method="POST">
		<label>Enter Your Dog's Name: <input type="text" name="name" /></label> 
		<label>Enter Your Dog's Weight: <input type="text" name="weight" /></label> 
		<label>Enter Start Date: <input type="text" value="yyyy-MM-dd" name="startDate" /></label> 
		<label>Enter Start Time: <input type="text" value="HH:mm" name="startTime" /></label> 
		<label>Enter End Date: <input type="text" value="yyyy-MM-dd" name="endDate" /></label> 
		<label>Enter End Time: <input type="text" value="HH:mm" name="endTime" /></label> 
		<input type="hidden" value="${sitter.id}" name="sitterId" />
		<input type="submit" value="Save Appointment" />
	</form>
</body>
</html>