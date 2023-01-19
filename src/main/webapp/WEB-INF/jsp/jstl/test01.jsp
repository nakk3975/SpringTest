<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 1</title>
</head>
<body>
	<h3>1. JSTL core 변수</h3>
	<c:set var="number1">36</c:set>
	<c:set var="number2">3</c:set>
	
	<b>첫번째 숫자 : ${number1}</b><br>
	<b>두번째 숫자 : ${number2}</b>
	
	<h3>2. JSTL core 연산</h3>
	<b>더하기 : <c:out value="${number1 + number2}" /> </b><br>
	<b>빼기 : <c:out value="${number1 - number2}" /> </b><br>
	<b>곱하기 : <c:out value="${number1 * number2}" /> </b><br>
	<b>나누기 : <c:out value="${number1 / number2}" /> </b>
	
	<h3>3. JSTL core out</h3>
	<b><c:out value="<title>core out</title>" /></b>
	
	<h3>4. JSTL core if</h3>
	<%--double average = (number1 + number2) / 2 --%>
	<c:set var="average" value="${(number1 + number2) / 2}" />
	<c:if test="${average >= 10}">
		<h1>${average}</h1>
	</c:if>
	
	<c:if test="${average < 10}">
		<h3>${average}</h3>
	</c:if>
	
	<h3>5. JSTL core if</h3>
	<c:if test="${(number1 * number2) > 100}">
		<c:out value="<script>alert('너무 큰 수 입니다.')</script>" escapeXml="false" />
	</c:if>
	
</body>
</html>