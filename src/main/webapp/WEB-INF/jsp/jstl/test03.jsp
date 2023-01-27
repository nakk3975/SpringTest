<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fmt 라이브러리</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div>
			<h2>1. 후보자 득표율</h2>
			<table class="table text-center">
				<thead>
					<tr>
						<th>기호</th>
						<th>득표 수</th>
						<th>득표 율</th>
					</tr>
				</thead>
					<c:forEach var="candidate" items="${candidates}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td><fmt:formatNumber value="${candidate}" /></td>
							<td><fmt:formatNumber value="${candidate / 1000000}" type="percent" /></td>
						</tr>
					</c:forEach>
				<tbody>
				</tbody>
			</table>
		</div>
		<div>
			<h2>2. 카드 명세서</h2>
			<table class="table text-center">
				<thead>
					<tr>
						<th>사용처</th>
						<th>가격</th>
						<th>사용 날짜</th>
						<th>할부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cardBill" items="${cardBills}">
						<tr>
							<td>${cardBill.store}</td>
							<td><fmt:formatNumber value="${cardBill.pay}" type="currency" /></td>
							<fmt:parseDate value="${cardBill.date}" pattern="yyyy-MM-dd" var="nowDate" />
							<td><fmt:formatDate value="${nowDate}" pattern="yyyy년 MM월 dd일" /> </td>
							<td>${cardBill.installment}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>