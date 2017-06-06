<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile Page</title>
</head>
<body>

	<p>${user.contact.firstName}${user.contact.lastName}</p>
	<p>User Name: ${user.userName}</p>
	<p>Address: ${user.contact.street} ${user.contact.city},
		${user.contact.state} ${user.contact.zipCode}</p>

	<table>
		<thead>
			<th colspan="3" align="center">Dags</th>
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
					<td><img src="${dog.imageUrl}" height="150em" width="200em" /></td>
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
</body>
</html>