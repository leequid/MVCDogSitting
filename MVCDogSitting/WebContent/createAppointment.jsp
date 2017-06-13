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
		<title>Set Appointment</title>
	</head>
	<body>
		<jsp:include page="_nav.jsp" />

		<br>
		<br>
		<br>
		<br> Sitter: ${sitter.user.contact.firstName}
		${sitter.user.contact.lastName}
		<form action="makeAppointment.do" method="POST">
			<label>Enter Start Date: <input type="date" name="startDate" /></label>
			<label>Enter Start Time: <input type="time" name="startTime" /></label><br>
			<label>Enter End Date: <input type="date" name="endDate" /></label> <label>Enter
				End Time: <input type="time" name="endTime" /><br>
			</label> <label>Select Dog<select name="dogId">
					<c:forEach var="dog" items="${sessionScope.user.dogs}">
						<option value="${dog.id}">${dog.name}</option>
					</c:forEach><br>

			</select></label> <input type="hidden" value="${sitter.id}" name="sitterId" /> <input
				type="submit" value="Save Appointment" />
		</form>
	</body>
</html>