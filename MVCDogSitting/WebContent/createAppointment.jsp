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
<section class="navbar">
<div class="grid-row row">
<c:if test="${sessionScope.user.userName == null}">
<div class="col"><a class="button" href="viewSitters.do">Home</a></div>
<div class="col"><a class="button" href="loginPage.do">Login</a></div>
<div class="col"><a class="button" href="profilePage.do">Profile</a></div>
 </c:if>
 
 <c:if test="${sessionScope.user.userName != null}">
<div class="col"><a class="button" href="viewSitters.do">Home</a></div>
<div class="col"><a class="button" href="logout.do">Logout</a></div>
 <div class="col">Hi ${sessionScope.user.contact.firstName}!</div>
<div class="col"><a class="button" href="profilePage.do">Profile</a></div>
 </c:if>
  </div>
</section>
	Sitter: ${sitter.user.contact.firstName} ${sitter.user.contact.lastName}
	<form action="makeAppointment.do" method="POST">
		<label>Enter Start Date: <input type="date" name="startDate" /></label> 
		<label>Enter Start Time: <input type="time" name="startTime" /></label> 
		<label>Enter End Date: <input type="date" name="endDate" /></label> 
		<label>Enter End Time: <input type="time" name="endTime" /></label> 
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