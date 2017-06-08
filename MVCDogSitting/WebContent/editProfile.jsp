<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="bark.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="master.css">
<link href="https://fonts.googleapis.com/css?family=Permanent+Marker" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Profile Page</title>
</head>
<body>
	<section class="navbar">
	<div class="grid-row row">
		<c:if test="${sessionScope.user.userName == null}">
			<div class="col">
			<p class="wagly">WAGLY</p>
			<img class ="doggy" src="https://tailwagphotography.com/images/tailwag-logo.png">
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
			<p class="waglysession">WAGLY</p>
			<img class ="doggysession" src="https://tailwagphotography.com/images/tailwag-logo.png">
				<a class="button" href="viewSitters.do">Home</a>
			</div>
			<div class="col">
				<a class="button buttonlogout" href="logout.do">Logout</a> <img
					class="sad"
					src="https://s3-us-west-1.amazonaws.com/studyladder-prod/public/cdn/materials-library/sl-plus/800/r265q2634a2639.png" />
			</div>
			<div class="col"><div id="balance">Hi ${sessionScope.user.userName}!<br/>
				Your balance is :
			<fmt:formatNumber value="${sessionScope.user.balance}" type="currency" /></div>
			</div>
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

	<form:form action="updateProfile.do" method="POST"
		modelAttribute="user">

		<label>First Name: <input type="text"
			value="${user.contact.firstName}" name="firstName" /></label>
		<label>Last Name: <input type="text"
			value="${user.contact.lastName}" name="lastName" /></label>
		<label>Street Address: <input type="text"
			value="${user.contact.street}" name="street" /></label>
		<label>City: <input type="text" value="${user.contact.city}"
			name="city" /></label>
		<label>State: <input type="text" value="${user.contact.state}"
			name="state" /></label>
		<label>ZipCode: <input type="text"
			value="${user.contact.zipCode}" name="zipCode" /></label>
		<label>Email: <input type="text" value="${user.contact.email}"
			name="email" /></label>
		<label>Phone Number: <input type="text"
			value="${user.contact.phone}" name="phone" /></label>

		<%-- 	<input type="hidden" value="${user.id}" name="userId"/>
 --%>
		<%-- <input type="hidden" value="${user.contact.id} name="contactId"/> --%>
		<input type="submit" value="Update Profile" />


	</form:form>
	<form:form action="createDog.do" method="POST" modelAttribute="newDog">

		<label>Dog's Name: <input type="text" name="name" /></label>
		<label>Weight: <input type="text" name="weight" /></label>
		<label>Image URL: <input type="text" name="imageUrl" /></label>
		<input type="submit" value="Add Dog" onmouseover="playBark()" />

	</form:form>
</body>
</html>