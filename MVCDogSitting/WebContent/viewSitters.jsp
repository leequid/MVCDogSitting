<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="master.css">
<link rel="stylesheet" type="text/css" href="rating.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Sitters</title>
</head>
<body>
	<section class="navbar">
	<div class="grid-row row">
		<c:if test="${sessionScope.user.userName == null}">
			<div class="col">
				<a class="button" href="welcomePage.do">Home</a>
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
				<a class="button" href="welcomePage.do">Home</a>
			</div>
			<div class="col">
				<a class="button" href="logout.do">Logout</a>
			</div>
			<div class="col">Hi ${sessionScope.user.contact.firstName}!</div>
			<div class="col">
				<a class="button" href="profilePage.do">Profile</a>
			</div>
		</c:if>
	</div>
	</section>
	<c:forEach var="sitter" items="${sitters}">
	<hr>
		<p>${sitter.user.contact.firstName}
			${sitter.user.contact.lastName}</p>
		<p>${sitter.user.contact.street} ${sitter.user.contact.city},
			${sitter.user.contact.state} ${sitter.user.contact.zipCode}</p>
<div >
		<table id="rating_table">
			<tr>
				<td id="shrink">Average Rating:</td>
				<td>
					<span class="star-ratings-css">
						<span class="star-ratings-css-top"
							style="width:${sitter.averageRating*25}%">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</span>
						<span class="star-ratings-css-bottom">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</span>
					</span>
				</td>
				<td>${sitter.averageRating} Stars!</td>
				<td>
					<form action="setAppointment.do" method="GET">
						<input type="hidden" value="${sitter.id}" name="sitterId" /> <input
							type="submit" value="Set Appointment" />
					</form>
				</td>
			</tr>
		</table>
		</div>
		<hr>
	</c:forEach>
</body>
</html>