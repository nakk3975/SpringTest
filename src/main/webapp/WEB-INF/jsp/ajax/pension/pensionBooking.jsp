<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <link rel="stylesheet" href="/ajax/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="header.jsp" />
		<div id="booking-section" class="d-flex justify-content-center">
			<section class="col-6">
				<h2 class="my-4 text-center">예약 하기</h2>
				<label>이름</label>
				<input type="text" class="form-control mb-2" id="name">
				
				<label>예약날짜</label>
				<input type="text" class="form-control mb-2" id="datepicker">
				
				<label>숙박일수</label>
				<input type="number" class="form-control mb-2" id="day">
				
				<label>숙박인원</label>
				<input type="number" class="form-control mb-2" id="headcount">
				
				<label>전화번호</label>
				<input type="text" class="form-control mb-2" id="phoneNumber">
				
				<button type="button" class="btn btn-block btn-warning" id="bookingBtn">예약하기</button>
			</section>
		</div>
		<jsp:include page="footer.jsp" />
		
		<script>
			function valueCheck(value, alertString){
				if(value.val() == ""){
					alert(alertString + "을(를) 입력하세요.");
					value.focus();
					return false;
				}
				return true;
			}
		
			$(document).ready(function() {
				$(function() {
				    $("#datepicker").datepicker({
				    	dateFormat: "yy-mm-dd"
				    });
				});
				
				$("#bookingBtn").on("click", function() {
					let name = $("#name").val();
					let date = new Date($("#datepicker").val());
					let day = $("#day").val();
					let headcount = $("#headcount").val();
					let phoneNumber = $("#phoneNumber").val();
					let regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/
					
					if(!valueCheck($("#name"), "이름")){
						return;
					}
					
					if(!valueCheck($("#datepicker"), "날짜")){
						return;
					}
					
					if(!valueCheck($("#day"), "숙박일수")){
						return;
					}
					
					if(!valueCheck($("#headcount"), "숙박인원")){
						return;
					}
					
					if(!valueCheck($("#phoneNumber"), "전화번호")){
						return;
					}
					
					if(!regPhone.test(phoneNumber)) {
						alert("010-****-**** 형식으로 입력해 주세요.");
						return;
					}
					
					$.ajax({
						type:"post"
						, url:"/pension/insert"
						, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
						, success:function(data) {
							if(data.result){
								alert("예약이 완료되었습니다.");
								location.href="/pension/main"
							} else {
								aler("저장 실패");
							}
						}
						, error:function() {
							alert("에러");
						}
					});
					
				});
			});
		</script>
	</div>
</body>
</html>