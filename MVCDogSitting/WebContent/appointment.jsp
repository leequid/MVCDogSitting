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
	

	<form action="makeAppointment.do">
		<label>Enter start dateTime: <input type="text" value="yyyy-MM-dd HH:mm:ss" name="startDate"/></label>
		<label>Enter end dateTime: <input type="text" value="yyyy-MM-dd HH:mm:ss" name="endDate"/></label>
		
		<input type="submit" value="Edit Profile" name="editButton" />
	</form>
	<form action="viewSitters.do">
		<input type="hidden" name="userId" value="${user.id}" /> <input
			type="submit" value="View Sitters" name="viewSittersButton" />
	</form>
</body>
</html>