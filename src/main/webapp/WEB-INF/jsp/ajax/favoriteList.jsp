<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>

	<div class="container">
		<h1>즐겨 찾기 목록</h1>
		
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
				<c:forEach var="favorite" items="${favorites}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${favorite.name}</td>
						<td>${favorite.url}</td>
						<td><button type="button" class="btn btn-danger" id="deleteBtn">삭제</button></td>
					</tr>
				</c:forEach>
			<tbody>
			</tbody>
		</table>
	</div>
	
	
	<script>
		$(document).ready(function() {
			/*
			$("#deleteBtn").on("click", function() {
				$.ajax({
					type: "post"
					, url: "/ajax/favorite/deleteUrl"
					, data: {"id":id}
					, success:function(data) {
						if(data == 1){
							location.reload();
						} else {
							alert("삭제 실패");
						}
					}
					, error:function() {
						alert("오류 발생");
					}
				});
			});
			*/
		});
	</script>
</body>
</html>