<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<jsp:include page="_head.jsp"/>
		<title>View Sitters</title>
	</head>
	<body>
		<jsp:include page="_nav.jsp"/>

		<br>
		<br>
		<br>
		<br>
		<h1 align="center">Available Dog Sitters</h1>
		<div class="sitterlist">
		<c:forEach var="sitter" items="${sitters}">
			
			<p>${sitter.user.contact.firstName}
				${sitter.user.contact.lastName}</p>
			<p>${sitter.user.contact.street} ${sitter.user.contact.city},
				${sitter.user.contact.state} ${sitter.user.contact.zipCode}</p>
				<div class="bottomlist" >
			<div>
				<table id="rating_table">
					<tr>
						<td id="shrink">Average Rating:</td>
						<td><span class="star-ratings-css"> <span
								class="star-ratings-css-top"
								style="width:${sitter.averageRating*20}%"> <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</span> <span class="star-ratings-css-bottom"> <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</span>

						</span>
					</td>
					<td>${sitter.averageRating} Stars!</td>
					<td>${sitter.user.contact.firstName} is available ${sitter.availability}</td>
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