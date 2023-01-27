<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="/jstl/weather/style.css" type="text/css">
</head>
<body>
	<div class="container">
		<div class="d-flex">
			<div class="main col-2">
				<jsp:include page="header.jsp" />
				<jsp:include page="menu.jsp" />
			</div>
			<section class="col-10">
				<h1>과거 날씨</h1>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="weather" items="${weathers}">
							<tr>
								<fmt:formatDate value="${weather.date}" pattern="yyyy년 M월 d일" var="date"/>
								<td>${date}</td>
								<c:choose>
									<c:when test="${weather.weather eq '맑음'}">
										<td><img alt="맑음" src="/jstl/img/sunny.jpg"></td>
									</c:when>
									<c:when test="${weather.weather eq '구름조금'}">
										<td><img alt="구름조금" src="/jstl/img/partlyCloudy.jpg"></td>
									</c:when>
									<c:when test="${weather.weather eq '흐림'}">
										<td><img alt="흐림" src="/jstl/img/cloudy.jpg"></td>
									</c:when>
									<c:when test="${weather.weather eq '비'}">
										<td><img alt="비" src="/jstl/img/rainy.jpg"></td>
									</c:when>
								</c:choose>
								<td>${weather.temperatures}°C</td>
								<td>${weather.precipitation}mm</td>
								<td>${weather.microDust}</td>
								<td>${weather.windSpeed}km/h</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>