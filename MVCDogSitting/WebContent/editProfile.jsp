<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="bark.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="master.css">
<link href="https://fonts.googleapis.com/css?family=Permanent+Marker"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Profile Page</title>
</head>
<body>
	<section class="navbar">
	<div class="grid-row row">
		<c:if test="${sessionScope.user.userName == null}">
			<div class="col">
				<p class="wagly">WAGLY</p>
				<img class="doggy"
					src="https://tailwagphotography.com/images/tailwag-logo.png">
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
				<img class="doggysession"
					src="https://tailwagphotography.com/images/tailwag-logo.png">
				<a class="button" href="viewSitters.do">Home</a>
			</div>
			<div class="col">
				<a class="button buttonlogout" href="logout.do">Logout</a> <img
					class="sad"
					src="https://s3-us-west-1.amazonaws.com/studyladder-prod/public/cdn/materials-library/sl-plus/800/r265q2634a2639.png" />
			</div>
			<div class="col">
				<div id="balance">
					Hi ${sessionScope.user.userName}!<br /> Your balance is :
					<fmt:formatNumber value="${sessionScope.user.balance}"
						type="currency" />
				</div>
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
	<form:form action="updateProfile.do" method="POST" modelAttribute="user" class="form-style-9">
		<ul>
			<li><input type="text" value="${user.contact.firstName}"
				name="firstName" class="field-style field-full align-none"
				placeholder="First Name" /></li>
			<li><input type="text" value="${user.contact.lastName}"
				name="lastName" class="field-style field-full align-none"
				placeholder="Last Name" /></li>
			<li><input type="text" value="${user.contact.phone}"
				name="phone" class="field-style field-full align-none"
				placeholder="Phone" /></li>
			<li><input type="email" value="${user.contact.email}"
				name="email" class="field-style field-full align-none"
				placeholder="Email" /></li>
			<li><input type="text" value="${user.contact.street}"
				name="street" class="field-style field-full align-none"
				placeholder="Street Address" /></li>
			<li><input type="text" value="${user.contact.city}" name="city"
				class="field-style field-full align-none" placeholder="City" /></li>
			<li><input type="text" value="${user.contact.state}"
				name="state" class="field-style field-full align-none"
				placeholder="State" /></li>
			<li><input type="text" value="${user.contact.zipCode}"
				name="zipCode" class="field-style field-full align-none"
				placeholder="Zip Code" /></li>
			<li><input type="submit" value="Update profile" /></li>
		</ul>
	</form:form>
	<form:form action="createDog.do" method="POST" modelAttribute="newDog" class="form-style-9">
		<ul>
			<li><input type="text" name="name"
				class="field-style field-split align-left" placeholder="Dog's Name" />
				<input type="text" name="weight"
				class="field-style field-split align-right"
				placeholder="Dog's Weight" /> <input type="text" name="imageUrl"
				class="field-style field-full align-none" placeholder="Image URL" />
			</li>
			<li><input type="submit" value="Add Dog"
				onmouseover="playBark()" /></li>
		</ul>
	</form:form>
</body>
</html>