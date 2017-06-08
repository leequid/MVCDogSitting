<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="master.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile Page</title>
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
			<div class="col">Hi ${sessionScope.user.userName}!</div>
			<div class="col">
				<a class="button" href="profilePage.do">Profile</a>
			</div>
		</c:if>
	</div>
	</section>


	<p>${user.contact.firstName} ${user.contact.lastName}</p>
	<p>User Name: ${user.userName}</p>
	<p>Address: ${user.contact.street} ${user.contact.city},
		${user.contact.state} ${user.contact.zipCode}</p>
	<table>
		<thead>
			<tr>
				<th colspan="3" align="center">Dogs</th>
			</tr>
			<tr>
				<th>Name</th>
				<th>Picture</th>
				<th>Weight</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach var="dog" items="${sessionScope.user.dogs}">
				<tr>
					<td>${dog.name}</td>
					<td><img src="${dog.imageUrl}" width="200em" /></td>
					<td>${dog.weight}</td>
					<td>
						<form action="deleteDog.do" method="POST">
							<input type="hidden" name="id" value="${dog.id}" /> <input
								type="submit" value="Delete Dog" name="deleteDogButton" />
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<form action="editProfile.do">
		<input type="hidden" name="userId" value="${user.id}" /> <input
			type="submit" value="Edit Profile" name="editButton" />
	</form>
	<form action="viewSitters.do">
		<input type="hidden" name="userId" value="${user.id}" /> <input
			type="submit" value="View Sitters" name="viewSittersButton" />
	</form>
	<form action="addBalance.do">
		<input type="hidden" name="userId" value="${user.id}" /> <input
			type="submit" value="Add Balance" name="addBalanceButton" />
	</form>

</body>
</html>