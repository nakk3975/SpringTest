<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 추가하기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		
		<label>제목</label>
		<input type="text" name="name" id="nameInput" class="form-control"><br>
		
		<label>주소</label>
		<div class="d-flex justify-content-between">
			<input type="text" name="url" id="urlInput" class="form-control col-11">
			<button type="button" id="checkBtn" class="btn btn-info">중복확인</button>
		</div>
		<span id="urlOver" style="display:none;" class="text-danger">중복된 url 입니다</span>
		<br>
		
		<button type="button" id="insertBtn" class="btn btn-block btn-success">추가</button>
	</div>
	
	<script>
		$(document).ready(function() {
			$("#checkBtn").on("click", function() {
				let url = $("#urlInput").val();
				$.ajax({
					type: "post"
					, url: "/ajax/favorite/urlCheck"
					, data:{"url":url}
					, success:function(data) {
						if(data >= 1){
							$("#urlOver").show();
						} else {
							$("#urlOver").hide();
						}
					}
					, error:function() {
						alert("에러발생");
					}
				});
			});
				
			
			$("#insertBtn").on("click", function() {
				let name = $("#nameInput").val();
				let url = $("#urlInput").val();
				let regex = /(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
				
				if(name == "") {
					alert("제목을 입력해주세요");
					return;
				}
				
				if(url == "") {
					alert("주소를 입력해 주세요.");
					return;
				}
			
				if(!regex.test(url)){
					alert("주소가 올바르지 않습니다.");
					return;
				}
				
				$.ajax({
					type: "post"
					, url: "/ajax/favorite/add"
					, data: {"name":name, "url":url}
					, success:function(data) {
						if(data.result == "success"){
							location.href="/ajax/favorite/list";
						} else {
							alert("저장 오류");
						}
					}
					, error:function() {
						alert("에러 발생");
					}
				});
			});
		});
	</script>
</body>
</html>