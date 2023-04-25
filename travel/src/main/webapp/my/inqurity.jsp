<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="${pageContext.request.contextPath}/css/footer.css"
	rel="stylesheet" />
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지</title>
</head>
<style>
@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 400;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
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
a:visited{
	color: black;
}

.askDiv {
    margin-bottom: 15px;
}

.askP {
	margin-bottom: 5px;
}

.askSpan {
    margin-left: 10px;
}
#sibal a {
	font-size: 18px;
	font-weight: bold;
	letter-spacing: 2px;
	color:black;
}
strong, b {
	font-size: 17px;
	color: black;
}
</style>

<body style="color: rgba(0, 0, 0, 0.56); font-family: 'NanumBarunGothic';">


	<%@include file="/header.jsp"%>
	<div style="height: 70px;"></div>
	<div id="intext"
		style="height: 150px; background-color: #3c9ac2d9; margin-top: 50px;">
		<a style="color: aliceblue; font-size: 35px; margin-left: calc(10%)">내정보</a>
	</div>
	<div id="contain" style="height: 535px;">
		<div
			style="width: 1000px; margin-left: calc(50% - 500px); margin-top: 50px; background-color: white">
			<div style="width: 200px; display: inline-block" id="sibal">
				<a style="text-decoration: none;" href="">예약내역</a><br/><br/>
				<a style="text-decoration: none;" href="${pageContext.request.contextPath }/likes">찜 목록</a><br/><br/>
				<a style="text-decoration: none; color: #3c9ac2d9;" href="${pageContext.request.contextPath }/my/inqurity">내 문의내역</a><br/> <br/> 
				<a style="text-decoration: none;" href="${pageContext.request.contextPath }/my/mypage">내 정보 관리</a>
			</div>
		<div style="width: 540px; margin-left: 241px; margin-top: -137px; position: absolute;">
			<div id="divHeader" style="width: 759px">
				<div id="answerDiv">
					<c:forEach items="${askList }" var="i">
						<div class="askDiv">
							<p class="askP"><strong>${i.iaskcategory}</strong><span class="askSpan">${i.iasktitle }</span></p>
							<p class="askTime">${i.idate } (${i.icheck })</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/footer.jsp"%>
</body>
</html>

