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
<link href="https://fonts.googleapis.com/css?family=Permanent+Marker" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Sitters</title>
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
	<h1 align="center">Available Dog Sitters</h1>
	<div class="sitterlist">
	<c:forEach var="sitter" items="${sitters}">
		<hr>
		<p>${sitter.user.contact.firstName}
			${sitter.user.contact.lastName}</p>
		<p>${sitter.user.contact.street}${sitter.user.contact.city},
			${sitter.user.contact.state} ${sitter.user.contact.zipCode}</p>
			<div class="bottomlist" >
		<div>
			<table id="rating_table">
				<tr>
					<td id="shrink">Average Rating:</td>
					<td><span class="star-ratings-css"> <span
							class="star-ratings-css-top"
							style="width:${sitter.averageRating*25}%"> <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</span> <span class="star-ratings-css-bottom"> <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</span>

					</span>
				</td>
				<td>${sitter.averageRating} Stars!</td>
				<td>[sitter.availability goes here]</td>
				<td>Sitter Rate: <fmt:formatNumber value="${sitter.rate}" type="currency" /> 
				<c:if test="${sitterid != null && sitterid == sitter.id }">
				"${balanceError}"
				</c:if>
				</td>
				<td>
					<form action="setAppointment.do" method="GET">
						<input type="hidden" value="${sitter.id}" name="sitterId" /> <input
							type="submit" value="Set Appointment" />
					</form>
				</td>
			</tr>
		</table>

		</div>
		</div>
	</c:forEach>
	</div>
</body>
</html>