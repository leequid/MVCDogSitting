<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<jsp:include page="_head.jsp"/>
		<script src="js/bark.js" type="text/javascript"></script>
		<title>Edit Profile Page</title>
	</head>
	<body>
		<jsp:include page="_nav.jsp" />
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