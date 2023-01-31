<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <link rel="stylesheet" href="/ajax/style.css" type="text/css">
</head>
<body>
	<div id="wrap" >
		<jsp:include page="header.jsp" />
			<section class="text-center">
				<h2 class="my-4">예약 목록 보기</h2>
				<table class="table text-center" id="reserveTable">
					<thead>
						<tr>
							<th onclick="javascript:sortTable(0)">이름</th>
							<th onclick="javascript:sortTable(1)">예약날짜</th>
							<th onclick="javascript:sortTable(2)">숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th onclick="javascript:sortTable(5)">예약상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="booking" items="${bookings}">
							<tr>
								<td>${booking.name}</td>
								<td><fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일"/></td>
								<td>${booking.day}</td>
								<td>${booking.headcount}</td>
								<td>${booking.phoneNumber}</td>
								<c:choose>
									<c:when test="${booking.state eq '확정'}">
										<td class="text-success">${booking.state}</td>
									</c:when>
									<c:otherwise>
										<td class="text-info">${booking.state}</td>
									</c:otherwise>
								</c:choose>
								<td><button type="button" class="btn btn-danger delete-btn" data-id="${booking.id}">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		<jsp:include page="footer.jsp" />
	</div>
	
	<script>
		var sort = true;
	
		function sortTable(n) {
			var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
			table = document.getElementById("reserveTable");
			switching = true;
			// Set the sorting direction to ascending:
			dir = "asc";
			/* Make a loop that will continue until
			no switching has been done: */
			while (switching) {
				// Start by saying: no switching is done:
			    switching = false;
			    rows = table.rows;
			    /* Loop through all table rows (except the
			    first, which contains table headers): */
			    for (i = 1; i < (rows.length - 1); i++) {
			    	// Start by saying there should be no switching:
			      	shouldSwitch = false;
			      	/* Get the two elements you want to compare,
			      	one from current row and one from the next: */
			      	x = rows[i].getElementsByTagName("TD")[n];
			      	y = rows[i + 1].getElementsByTagName("TD")[n];
			      	/* Check if the two rows should switch place,
			      	based on the direction, asc or desc: */
			      	if (dir == "asc") {
			        	if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
			          	// If so, mark as a switch and break the loop:
			          	shouldSwitch = true;
			          	break;
			        	}
			      	} else if (dir == "desc") {
			        	if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
			          		// If so, mark as a switch and break the loop:
			          		shouldSwitch = true;
			          		break;
			        	}
			      	}
			    }
			    if (shouldSwitch) {
			      	/* If a switch has been marked, make the switch
			      	and mark that a switch has been done: */
			      	rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			      	switching = true;
			      	// Each time a switch is done, increase this count by 1:
			      	switchcount ++;
			    } else {
			      	/* If no switching has been done AND the direction is "asc",
			      	set the direction to "desc" and run the while loop again. */
			      	if (switchcount == 0 && dir == "asc") {
			        	dir = "desc";
			        	switching = true;
			      	}
			    }
			}
		}
	
		$(document).ready(function() {
			
			$(".delete-btn").on("click", function() {
				let id = $(this).data("id");
				
				$.ajax({
					type: "post"
					, url: "/pension/deleteList"
					, data: {"id":id}
					, success:function(data) {
						if(data.result){
							location.reload();
						} else {
							alert("삭제 실패");
						}
					}
					, error:function() {
						alert("오류 발생");
					}
				})
			});
			
		});
	</script>
</body>
</html>