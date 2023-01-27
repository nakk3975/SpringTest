<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
    
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    
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
				<h1>날씨 입력</h1>
				<form method="post" action="/jstl/test05_add">
					<div class="d-flex mt-5">	
						<div class="d-flex justify-content-around col-5">
							<label class="mt-2">날짜</label>
							<input type="text" class="form-control col-9" id="datepicker" name="date">
						</div>
						
						<div class="d-flex justify-content-around col-3">
							<label class="mt-2">날씨</label>
							<select class="form-control col-9" name="weather">
								<option selected>맑음</option>
								<option>구름조금</option>
								<option>흐림</option>
								<option>비</option>
							</select>
						</div>
						
						<div class="d-flex justify-content-around col-4">
							<label class="mt-2">미세먼지</label>
							<select class="form-control col-9" name="microDust">
								<option>좋음</option>
								<option>보통</option>
								<option>나쁨</option>
								<option>최악</option>
							</select>
						</div>
					</div>
					
					<div class="d-flex mt-5">
						<div class="input-group col-4">
							<label class="mt-2 col-3">기온</label>
						    <input type="text" class="form-control" name="temperatures">
						    <span class="input-group-text">°C</span>
						</div>
						
						<div class="input-group col-4">
							<label class="mt-2 col-4">강수량</label>
						    <input type="text" class="form-control" name="precipitation">
						    <span class="input-group-text">mm</span>
						</div>
						
						<div class="input-group col-4">
							<label class="mt-2 col-3">풍속</label>
						    <input type="text" class="form-control" name="windSpeed">
						    <span class="input-group-text">km/h</span>
						</div>
					</div>
					<button type="submit" class="btn btn-success float-right mt-2 mb-4 mr-3">저장</button>
				</form>
			</section>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
	
	<script>
	 $( function() {
		    $( "#datepicker" ).datepicker();
		  } );
	</script>
</body>
</html>