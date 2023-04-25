<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="${pageContext.request.contextPath }/css/success.css"
	rel="stylesheet" />
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지</title>
</head>
<style>
.success_table th{
	    padding: 12px 0px !important;
}
@font-face {
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix')
		format('embedded-opentype'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff')
		format('woff'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf')
		format('truetype');
}

.selectbox {
	min-width: 671px;
	height: 48px;
	appearance: none;
	background: rgb(250, 250, 250);
	url (https: //image.goodchoice.kr/images/web_v3/ico_arr_down_4.png)
		right 10px top 50% no-repeat;
	background-size: 18px auto;
	padding-left: 7px;
	margin-top: 15px;
}

#answerDiv {
	margin-bottom: 20px;
}

a:visited {
	color: black;
}

#sibal a {
	font-size: 18px;
	font-weight: bold;
	letter-spacing: 2px;
	color:black;
}

footer {
	position: relative;
	bottom: 0;
	left: 0;
}

#success_container_header{
	width:900px;
}
.success_table{
	width:900px;
}
</style>

<body
	style="color: rgba(0, 0, 0, 0.56); font-family: 'NanumBarunGothic';">


	<%@include file="/header.jsp"%>
	<div id="all_content" style="margin-bottom: 200px; height: 1200px;">
		<div style="height: 70px;"></div>
		<div id="intext"
			style="height: 150px; background-color: #3c9ac2d9; margin-top: 50px;">
			<a style="color: aliceblue; font-size: 35px; margin-left: calc(10%)">내정보</a>
		</div>
		<div id="contain" style="height: 535px;">
			<div
				style="width: 1000px; margin-left: calc(50% - 500px); margin-top: 50px; background-color: white">
				<div style="width: 200px; display: inline-block" id="sibal">
					<a
						style="text-decoration: none; font-size: 17px; color: #3c9ac2d9;"
						href="">예약내역</a><br /> <br /> <a
						style="text-decoration: none; font-size: 17px;"
						href="${pageContext.request.contextPath }/likes">찜 목록</a><br /> <br />
					<a style="text-decoration: none; font-size: 17px;"
						href="${pageContext.request.contextPath }/my/inqurity">내문의내역</a><br />
					<br /> <a style="text-decoration: none; font-size: 17px;"
						href="${pageContext.request.contextPath }/my/mypage">내 정보 관리</a>
				</div>
				<div
					style="width: 540px; margin-left: 241px; margin-top: -137px; position: absolute;">
					<div id="divHeader" style="width: 759px">
						<c:forEach items="${list }" var="i">
							<div class="success_container"></div>
							<div id="success_container_header">
								<div id="success_container_textArea">
									<div>
										<span class="container_header_text">예약 번호:<span>${i.orderid }</span></span>
									</div>
									<div>
										<span class="container_header_text">예약 일자:<span>${i.approvedAt }</span></span>
									</div>
								</div>
							</div>
							<table class="success_table">
								<thead>
									<tr>
										<th>객실 정보</th>
										<th>체크인/체크아웃</th>
										<th>결제 금액</th>
										<th>예약 상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><img
											src="../product_img/16556913569959XzITrQfT0oo2DN5Zpt.jpg">
											<p style="margin: 30px 0px;" class="ttst">
											<span>${i.pname }</span>
											</p></td>
										<td><p style="margin-bottom: 20px;" class="ttst">
												체크인:<span>${i.checkin}</span>
											</p>
											<p class="ttst">
												체크아웃: <span>${i.checkout}</span>
											</p></td>
										<td><p class="ttst">${i.amount }<span>원</span>
											</p></td>
										<td><p>예약완료</p> <span><button
													style="width: 90px; height: 40px; border: none; border-radius: 10px;">예약
													취소</button></span></td>
									</tr>
								</tbody>
							</table>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
<%@include file="/footer.jsp"%>
</html>

