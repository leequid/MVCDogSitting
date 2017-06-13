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
		<title>Profile Page</title>
	</head>
	<body>
		<jsp:include page="_nav.jsp" />

		<br>
		<br>
		<br>
		<br>


		<p>${user.contact.firstName}${user.contact.lastName}</p>
		<p>User Name: ${user.userName}</p>
		<p>Address: ${user.contact.street} ${user.contact.city},
			${user.contact.state} ${user.contact.zipCode}</p>

		<c:if test="${user.activeSitter == true}">
			<p>Sitter status: I'm a sitter :-)</p>
			<form action="updateSitterAvailability.do" method="POST">
				When are you available to dog-sit?: <select name="availability">
					<option value="1">Any time</option>
					<option value="2">Weekends</option>
					<option value="3">Weekdays</option>
					<option value="4">Evenings</option>
					<option value="5">Overnights</option>
				</select> <input type="submit" value="Submit">
			</form> Currently available: ${user.sitter.availability}
					<form action="updateSitterRate.do" method="POST">
				<label>Set your rate:$ <input type="number" name="rate" /> <input
					type="submit" value="Set Rate" /> Current Rate is: <fmt:formatNumber
						value="${user.sitter.rate}" type="currency" />
				</label>
			</form>
			<form action="updateSitterStatus.do" method="POST">
				<input type="checkbox" name="activeSitter" value="false"> I
				don't want to be a sitter! <input type="submit" value="Submit" />
			</form>
		</c:if>
		<c:if test="${user.activeSitter == false }">
			<p>Sitter status: I'm not a sitter :-(</p>
			<form action="updateSitterStatus.do" method="POST">
				<input type="checkbox" name="activeSitter" value="true"> Make
				me a sitter! <input type="submit" value="Update Status">
			</form>
		</c:if>
		<br>
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

		<table class="dogscroll">

			<tbody>
				<tr>
					<th colspan="3" align="center" class="dogheader">Dogs</th>
				</tr>
				<tr>
					<th>Name</th>
					<th></th>
					<th>Weight</th>
					<th></th>
				</tr>
				<c:forEach var="dog" items="${sessionScope.user.dogs}">
					<tr>
						<td>${dog.name}</td>
						<td><img class="dogpic" src="${dog.imageUrl}" width="200em" /></td>
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
	</body>
</html>