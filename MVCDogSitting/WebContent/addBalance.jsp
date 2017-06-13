<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <jsp:include page="_head.jsp"/>
      <title>Add Balance</title>
   </head>
<body>
	<form:form action="addBalance.do" method="POST" modelAttribute="user">
		<label>Name on card: <form:input path="" /></label><br />
		<label>Credit card number: <form:input path="" /></label><br />
		<label>CVV: <form:input path="" /></label><br />

      <select id="month" name="month">
         <option value="">--- Select ---</option>
         <option value="1">1 JAN</option>
         <option value="2">2 FEB</option>
         <option value="3">3 MAR</option>
         <option value="4">4 APR</option>
         <option value="5">5 MAY</option>
         <option value="6">6 JUN</option>
         <option value="7">7 JUL</option>
         <option value="8">8 AUG</option>
         <option value="9">9 SEP</option>
         <option value="10">10 OCT</option>
         <option value="11">11 NOV</option>
         <option value="12">12 DEC</option>
      </select>
      <select id="year" name="year">
         <option value="">--- Select ---</option>
         <option value="17">2017</option>
         <option value="18">2018</option>
         <option value="19">2019</option>
         <option value="20">2020</option>
         <option value="21">2021</option>
         <option value="22">2022</option>
         <option value="23">2023</option>
         <option value="24">2024</option>
         <option value="25">2025</option>
         <option value="26">2026</option>
         <option value="27">2027</option>
         <option value="28">2028</option>
      </select>
		<br />
		<label>Add Balance: <input type="text" name="balance"  /></label>
		<input type="submit" value="Add balance!" />
	</form:form>
</body>
</html>