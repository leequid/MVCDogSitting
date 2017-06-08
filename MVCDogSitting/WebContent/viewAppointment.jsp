<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="master.css">
<link rel="stylesheet" type="text/css" href="rating.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Appointment</title>
</head>
<body>
	<section class="navbar">
	<div class="grid-row row">
		<c:if test="${sessionScope.user.userName == null}">
			<div class="col">
				<a class="button" href="viewSitters.do">Home</a>
			</div>
			<div class="col">
				<a class="button" href="loginPage.do">Login</a>
			</div>
			<div class="col">
				<a class="button" href="profilePage.do">Profile</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.user.userName != null}">
			<div class="col">
				<a class="button" href="viewSitters.do">Home</a>
			</div>
			<div class="col">
				<a class="button buttonlogout" href="logout.do">Logout</a> <img
					class="sad"
					src="https://s3-us-west-1.amazonaws.com/studyladder-prod/public/cdn/materials-library/sl-plus/800/r265q2634a2639.png" />
			</div>
			<div class="col">Hi ${sessionScope.user.userName}!<br/>
				Your balance is :
			<fmt:formatNumber value="${sessionScope.user.balance}" type="currency" /></div>
			<div class="col">
				<a class="button" href="profilePage.do">Profile</a>
			</div>
		</c:if>
	</div>
	</section>

	<br>
	<br>
	<br>
	<br>

	<p>Dog Owner: ${appointment.dog.user.contact.firstName}
		${appointment.dog.user.contact.lastName}</p>
	<p>Sitter: ${appointment.sitter.user.contact.firstName}
		${appointment.sitter.user.contact.lastName} prefers
		${appointment.sitter.sizePreference} dogs</p>
	<p>
		Dog: ${appointment.dog.name} <img src="${appointment.dog.imageUrl}"
			height="150em" width="200em" />
	</p>
	<p>Start Date and Time: ${strStart}</p>
	<p>End Date and Time: ${strEnd}</p>
	
	<p>Previous balance: <fmt:formatNumber value="${prevBalance}" type="currency" /></p>
	<p>Rate: <fmt:formatNumber value="${rate}" type="currency" /></p>
	<p>=========================</p>
	<p>Final Balance<fmt:formatNumber value="${sessionScope.user.balance}" type="currency" /></p>
	

	<c:if test="${appointment.rating == NULL}">
		<form action="setRating.do" method="POST">
			<fieldset class="rating">
				<input type="radio" id="star5" name="rating" value="5" /><label
					class="full" for="star5" title="Awesome - 5 stars"></label> <input
					type="radio" id="star4half" name="rating" value="4.5" /><label
					class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				<input type="radio" id="star4" name="rating" value="4" /><label
					class="full" for="star4" title="Pretty good - 4 stars"></label> <input
					type="radio" id="star3half" name="rating" value="3.5" /><label
					class="half" for="star3half" title="Meh - 3.5 stars"></label> <input
					type="radio" id="star3" name="rating" value="3" /><label
					class="full" for="star3" title="Meh - 3 stars"></label> <input
					type="radio" id="star2half" name="rating" value="2.5" /><label
					class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				<input type="radio" id="star2" name="rating" value="2" /><label
					class="full" for="star2" title="Kinda bad - 2 stars"></label> <input
					type="radio" id="star1half" name="rating" value="1 and a half" /><label
					class="half" for="star1half" title="Meh - 1.5 stars"></label> <input
					type="radio" id="star1" name="rating" value="1" /><label
					class="full" for="star1" title="Sucks big time - 1 star"></label> <input
					type="radio" id="starhalf" name="rating" value="0.5" /><label
					class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
			</fieldset>
			<input type="hidden" value="${appointment.id}" name="apptId" /> <input
				type="submit" value="Rate Sitter" />
		</form>
	</c:if>
</body>
</html>