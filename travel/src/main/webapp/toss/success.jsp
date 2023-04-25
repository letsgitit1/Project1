<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Success</title>
<link href="${pageContext.request.contextPath }/css/success.css"
	rel="stylesheet" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
</head>
<body>
	<%@ include file="../header.jsp"%>
	<fmt:setLocale value="ko_KR" />
	<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${KstartDate}"
		var="formattedStartDate" />
	<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${KendDate}"
		var="formattedEndDate" />
	<fmt:formatDate pattern="yyyy년 MM월 dd일 HH시mm분" value="${ts}" var="Ats" />

	var="KstartDate" />
	<div id="success_header">
		<h1 class="success_title">숙소 예약/결제내역</h1>
	</div>
	<div class="success_container">
		<div id="success_container_header">
			<div id="success_container_textArea">
				<div>
					<span class="container_header_text">예약 번호:<span>${orderId }</span></span>
				</div>
				<div>
					<span class="container_header_text">예약 일자:<span>${Ats }</span></span>
				</div>
			</div>
		</div>
		<table class="success_table">
			<thead>
				<tr>
					<th>객실 정보</th>
					<th>체크인/체크아웃</th>
					<th>숙소 위치</th>
					<th>결제 금액</th>
					<th>예약 상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img
						src="../product_img/16556913569959XzITrQfT0oo2DN5Zpt.jpg">
						<p style="margin: 30px 0px;" class="ttst">숙소 이름:<span>${vo.pname }</span></p></td>
					<td><p style="margin-bottom:20px;" class="ttst">체크인:<span>${formattedStartDate}</span></p>
						<p class="ttst">체크아웃: <span>${formattedEndDate}</span></p></td>
					<td><span class="ttst">${vo.address }</span><span class="ttst">${vo.subaddress }</span></td>
					<td><p class="ttst">${amount }<span>원</span>
						</p></td>
					<td><p>예약완료</p> <span><button
								style="width: 90px; height: 40px; border: none; border-radius: 10px;">예약
								취소</button></span></td>
				</tr>
			</tbody>
		</table>
		<div id="bottom_button_t">
		<button onclick="location.href='${pageContext.request.contextPath }'" class="Shome_button">Home</button>
		<button class="Shome_button" onclick="location.href='${pageContext.request.contextPath }/my/mypage'">MyPage</button>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>

