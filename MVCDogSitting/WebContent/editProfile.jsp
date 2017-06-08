<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="bark.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="master.css" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Profile Page</title>
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

<form:form action="updateProfile.do" method="POST" modelAttribute="user">
	
	<label>First Name: <input type="text" value="${user.contact.firstName}" name="firstName"/></label>
	<label>Last Name: <input type="text" value="${user.contact.lastName}" name="lastName"/></label>
	<label>Street Address: <input type="text" value="${user.contact.street}" name="street"/></label>
	<label>City: <input type="text" value="${user.contact.city}" name="city"/></label>
	<label>State: <input type="text" value="${user.contact.state}" name="state"/></label>
	<label>ZipCode: <input type="text" value="${user.contact.zipCode}" name="zipCode"/></label>
	<label>Email: <input type="text" value="${user.contact.email}" name="email"/></label>
	<label>Phone Number: <input type="text" value="${user.contact.phone}" name="phone"/></label>
	
<%-- 	<input type="hidden" value="${user.id}" name="userId"/>
 --%>	<%-- <input type="hidden" value="${user.contact.id} name="contactId"/> --%>
	<input type="submit" value="Update Profile"/>
	

</form:form>
 <form:form action="createDog.do" method="POST" modelAttribute="newDog">
	
	<label>Dog's Name: <input type="text" name="name"/></label>
	<label>Weight: <input type="text" name="weight"/></label>
	<label>Image URL: <input type="text" name="imageUrl"/></label>
	<input type="submit" value="Add Dog" onmouseover="playBark()"/>

</form:form> 
</body>
</html>