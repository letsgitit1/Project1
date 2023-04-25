<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
</head>
<%@include file="header.jsp"%>
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
#sibal a {
	font-size: 18px;
	font-weight: bold;
	letter-spacing: 2px;
	    color: black;
}
</style>

<body style="color: rgba(0, 0, 0, 0.56); font-family: 'NanumBarunGothic';">
	<div style="height: 70px; "></div>
	<div id="intext"
		style="height: 150px; background-color: #3c9ac2d9; margin-top: 50px; position:relative;">
		<a
			style="color: aliceblue; font-size: 35px; margin-left: calc(10%); position: absolute; top: bott; bottom: 40%; left: 14%;">더보기</a>
	</div>
	<div
		style="width: 1000px; margin-left: calc(50% - 500px); margin-top: 50px">
		<div style="width: 200px; display: inline-block" id="sibal">
			<a style="color: #3c9ac2d9;">공지사항</a><br />
			<br /> <a style=" text-decoration: none; color: black" href="${pageContext.request.contextPath}/Service">자주 묻는 질문</a><br />
			<br /> <a style=" text-decoration: none; color: black"href="${pageContext.request.contextPath}/ask1v1">1대1 문의</a><br />
			<br /> <a style=" text-decoration: none; color: black" href="${pageContext.request.contextPath}/">메인으로</a>
		</div>
		<div style="width: 540px; margin-left: 241px; margin-top: -137px; height:40vh;">
			<div id="divHeader" style="width: 759px">
				<div
					style="border-bottom: solid 2px red; padding-bottom: 10px; width: 116px;">
					서비스 공지사항</div>
			</div>
			<div onclick="javascript:doDisplay(1)"
				style="width: 759px; border-bottom: inset 3px; padding-top: 20px; padding-bottom: 20px; line-height: 2; cursor: pointer;">
				<img alt="" id="1a" src="../image/button.png"
					style="height: 15px; float: right; display: block; transform: rotate(0.5turn);" />
				<a>[안내] 고객님께 올리는 감사의 말씀</a><br /> <a
					style="opacity: 0.5; margin-top: 10px">2023.02.14</a>
			</div>
			<div id="1"
				style="display: none; width: 759px; background-color: rgba(246, 247, 242); padding: 10px;">
				<p>안내말씀 드립니다 반갑습니다</p>
				<p>자주 이용해주시는 고객분들께 감사인사 올립니다
				<p\>
				<p>3월에도 많은 이벤트가 진행중이니</p>
				<p>많은 관심을 부탁드립니다</p>
				이상입니다 감사합니다 !
			</div>

			<div onclick="javascript:doDisplay(2)"
				style="width: 759px; border-bottom: inset 3px; padding-top: 20px; padding-bottom: 20px; line-height: 2; cursor: pointer;">
				<img alt="" id="2a" src="../image/button.png"
					style="height: 15px; float: right; display: block; transform: rotate(0.5turn);" />
				<a>[공지] 1월 포인트 이벤트 당첨자 발표 </a><br /> <a
					style="opacity: 0.5; margin-top: 10px">2023.02.11</a>
			</div>
			<div id="2"
				style="display: none; width: 759px; padding: 10px; background-color: rgba(246, 247, 242);">
				<p>1월 트레비 이벤트 당첨자 발표입니다</p>
				<p>당첨을 진심으로 축하드리며 앞으로도 많은 이용과</p>
				<p>관심 부탁 드리겠습니다 이상입니다 감사합니다 !</p>


				<span
					style="font-family: Arial; font-size: 10.3333; height: 50px; width: 50px;">

					<p>2023년 1월 26일 당첨자 성명 정X호</p>
					<p>2023년 1월 17일 당첨자 성명 한X인</p>
					<p>2023년 1월 12일 당첨자 성명 김X훈</p>
					<p>2023년 1월 5일 당첨자 성명 정X원</p>
					<p>2023년 1월 3일 당첨자 성명 조X현</p>
					<p>2023년 1월 2일 당첨자 성명 김X연</p> <b>참고하세요&nbsp;</b>
					<p>- 포인트는 당첨 발표일에 당첨자 회원 계정으로 지급됩니다.</p>
					<p>- 지급된 포인트는 지급일로부터 30일 이내 사용 가능합니다.</p>
					<p>- 본 이벤트는 당사의 사정에 의해 변경/중지될 수 있습니다.</p>
				</span>
			</div>

			<div onclick="javascript:doDisplay(3)"
				style="width: 759px; border-bottom: inset 3px; padding-top: 20px; padding-bottom: 20px; line-height: 2; cursor: pointer;">
				<img alt="" id="3a" src="../image/button.png"
					style="height: 15px; float: right; display: block; transform: rotate(0.5turn);" />
				<a>[안내] 서비스 점검 안내(2/10 3:30~05:00)</a><br /> <a
					style="opacity: 0.5; margin-top: 10px">2023.02.09</a>
			</div>
			<div id="3"
				style="display: none; width: 759px; background-color: rgba(246, 247, 242); padding: 10px;">


				<p>안녕하세요 트레비입니다</p>
				<p>서비스 점검 관련해서 안내드립니다</p>
				<p>더 나은 서비스를 제공하기 위해서 안내말씀 드리겠습니다</p>
				<p style="color: black;">- 일시 : 2023년 2월 10일 오전 3시 30분 ~ 5시(1시간
					30분)</p>
				<p>- 점검 사유 : 시스템 업그레이드</p>
				<p>- 점검 영향 : 점검 시간 동안 웹 서비스 이용 불가</p>
				<p>점검 시간은 변경될 수 있으며 변경 시 공지를 통해 안내 해 드리겠습니다</p>
				<p>감사합니다</p>

			</div>
			<div onclick="javascript:doDisplay(4)"
				style="width: 759px; border-bottom: inset 3px; padding-top: 20px; padding-bottom: 20px; line-height: 2; cursor: pointer;">
				<img alt="" id="4a" src="../image/button.png"
					style="height: 15px; float: right; display: block; transform: rotate(0.5turn);" />
				<a>[공지] 1월 호텔/모텔 쿠폰 이벤트 당첨자 발표 </a><br /> <a
					style="opacity: 0.5; margin-top: 10px">2023.01.14</a>
			</div>
			<div id="4"
				style="display: none; width: 759px; padding: 10px; background-color: rgba(246, 247, 242);">
				<p>안녕하세요 신년맞이 호텔/모텔 쿠폰 이벤트 당첨자 안내입니다</p>
				<p>새해를 맞이하며 즐기실 여행을 위해 1월10일까지 진행했던 이벤트인데요</p>
				<p>당첨을 진심으로 축하드리며 앞으로도 많은 이용과</p>
				<p>관심 부탁 드리겠습니다 이상입니다 감사합니다 !</p>


				<span
					style="font-family: Arial; font-size: 10.3333; height: 50px; width: 50px;">

					<p>2023년 1월 10일 당첨자 성명 정X호</p>
					<p>2023년 1월 8일 당첨자 성명 한X인</p>
					<p>2023년 1월 7일 당첨자 성명 김X훈</p>
					<p>2023년 1월 5일 당첨자 성명 정X원</p>
					<p>2023년 1월 3일 당첨자 성명 조X현</p>
					<p>2023년 1월 2일 당첨자 성명 김X연</p> <b>참고하세요&nbsp;</b>
					<p>- 본 쿠폰은 당첨 발표일에 당첨자 회원 계정으로 지급됩니다.</p>
					<p>- 지급된 포인트는 지급일로부터 30일 이내 사용 가능합니다.</p>
					<p>- 본 이벤트는 당사의 사정에 의해 변경/중지될 수 있습니다.</p>
				</span>
			</div>
			<div onclick="javascript:doDisplay(5)"
				style="width: 759px; border-bottom: inset 3px; padding-top: 20px; padding-bottom: 20px; line-height: 2; cursor: pointer;">
				<img alt="" id="5a" src="../image/button.png"
					style="height: 15px; float: right; display: block; transform: rotate(0.5turn);" />
				<a>[안내] 서비스 점검 안내(1/10 3:30~05:00) </a><br /> <a
					style="opacity: 0.5; margin-top: 10px">2023.01.09</a>
			</div>
			<div id="5"
				style="display: none; width: 759px; padding: 10px; background-color: rgba(246, 247, 242);">


				<span
					style="font-family: Arial; font-size: 10.3333; height: 50px; width: 50px;">

					<p>안녕하세요 트레비입니다</p>
					<p>서비스 점검 관련해서 안내드립니다</p>
					<p>더 나은 서비스를 제공하기 위해서 안내말씀 드리겠습니다</p>
					<p style="color: black;">- 일시 : 2023년 1월 10일 오전 3시 30분 ~ 5시(1시간
						30분)</p>
					<p>- 점검 사유 : 시스템 업그레이드</p>
					<p>- 점검 영향 : 점검 시간 동안 웹 서비스 이용 불가</p>
					<p>점검 시간은 변경될 수 있으며 변경 시 공지를 통해 안내 해 드리겠습니다</p>
					<p>감사합니다</p>
				</span>
			</div>
			<div onclick="javascript:doDisplay(6)"
				style="width: 759px; border-bottom: inset 3px; padding-top: 20px; padding-bottom: 20px; line-height: 2; cursor: pointer;">
				<img alt="" id="6a" src="../image/button.png"
					style="height: 15px; float: right; display: block; transform: rotate(0.5turn);" />
				<a>[공지] 12월 해외여행 패키지 당첨 안내문 </a><br /> <a
					style="opacity: 0.5; margin-top: 10px">2022.12.14</a>
			</div>
			<div id="6"
				style="display: none; width: 759px; padding: 10px; background-color: rgba(246, 247, 242);">
				<p>12월 트레비 이벤트 당첨자 발표입니다</p>
				<p>당첨을 진심으로 축하드리며 앞으로도 많은 이용과</p>
				<p>관심 부탁 드리겠습니다 이상입니다 감사합니다 !</p>


				<span
					style="font-family: Arial; font-size: 10.3333; height: 50px; width: 50px;">

					<p style="color: blue;">2022년 12월 7일 당첨자 성명 정X호</p> <b>참고하세요&nbsp;</b>
					<p>- 포인트는 당첨 발표일에 당첨자 회원 계정으로 지급됩니다.</p>
					<p>- 지급된 포인트는 지급일로부터 30일 이내 사용 가능합니다.</p>
					<p>- 본 이벤트는 당사의 사정에 의해 변경/중지될 수 있습니다.</p>
				</span>
			</div>
			<div onclick="javascript:doDisplay(7)"
				style="width: 759px; border-bottom: inset 3px; padding-top: 20px; padding-bottom: 20px; line-height: 2; cursor: pointer;">
				<img alt="" id="7a" src="../image/button.png"
					style="height: 15px; float: right; display: block; transform: rotate(0.5turn);" />
				<a>[공지] 11월 포인트 이벤트 당첨자 발표 </a><br /> <a
					style="opacity: 0.5; margin-top: 10px">2022.11.14</a>
			</div>
			<div id="7"
				style="display: none; width: 759px; padding: 10px; background-color: rgba(246, 247, 242);">
				<p>11월 트레비 이벤트 당첨자 발표입니다</p>
				<p>당첨을 진심으로 축하드리며 앞으로도 많은 이용과</p>
				<p>관심 부탁 드리겠습니다 이상입니다 감사합니다 !</p>


				<span
					style="font-family: Arial; font-size: 10.3333; height: 50px; width: 50px;">

					<p>2022년 11월 26일 당첨자 성명 정X호</p>
					<p>2022년 11월 17일 당첨자 성명 한X인</p>
					<p>2022년 11월 12일 당첨자 성명 김X훈</p>
					<p>2022년 11월 5일 당첨자 성명 정X원</p>
					<p>2022년 11월 3일 당첨자 성명 조X현</p>
					<p>2022년 11월 2일 당첨자 성명 김X연</p> <b>참고하세요&nbsp;</b>
					<p>- 포인트는 당첨 발표일에 당첨자 회원 계정으로 지급됩니다.</p>
					<p>- 지급된 포인트는 지급일로부터 30일 이내 사용 가능합니다.</p>
					<p>- 본 이벤트는 당사의 사정에 의해 변경/중지될 수 있습니다.</p>
				</span>
			</div>
			<div onclick="javascript:doDisplay(8)"
				style="width: 759px; border-bottom: inset 3px; padding-top: 20px; padding-bottom: 20px; line-height: 2; cursor: pointer;">
				<img alt="" id="8a" src="../image/button.png"
					style="height: 15px; float: right; display: block; transform: rotate(0.5turn);" />
				<a>[공지] 10월 펜션 이벤트 당첨자 발표 </a><br /> <a
					style="opacity: 0.5; margin-top: 10px">2022.10.20</a>
			</div>
			<div id="8"
				style="display: none; width: 759px; padding: 10px; background-color: rgba(246, 247, 242);">
				<p>10월 트레비 이벤트 당첨자 발표입니다</p>
				<p>당첨을 진심으로 축하드리며 앞으로도 많은 이용과</p>
				<p>관심 부탁 드리겠습니다 이상입니다 감사합니다 !</p>


				<span
					style="font-family: Arial; font-size: 10.3333; height: 50px; width: 50px;">

					<p>2022년 10월 26일 당첨자 성명 정X호</p>
					<p>2022년 10월 17일 당첨자 성명 한X인</p>
					<p>2022년 10월 12일 당첨자 성명 김X훈</p>
					<p>2022년 10월 5일 당첨자 성명 정X원</p>
					<p>2022년 10월 3일 당첨자 성명 조X현</p>
					<p>2022년 10월 2일 당첨자 성명 김X연</p> <b>참고하세요&nbsp;</b>
					<p>- 본 쿠폰은 당첨 발표일에 당첨자 회원 계정으로 지급됩니다.</p>
					<p>- 지급된 포인트는 지급일로부터 30일 이내 사용 가능합니다.</p>
					<p>- 본 이벤트는 당사의 사정에 의해 변경/중지될 수 있습니다.</p>
				</span>
			</div>

		</div>

	</div>
	
	<div style="height: 400px">
	
	</div>
	
</body>
<%@include file="footer.jsp"%>
<script>
	let hiddentext = true;

	function doDisplay(textId) {
		//id파라미터로 인자 전달 div(1),div(2)
		let con = document.getElementById(textId);
		let con2 = document.getElementById(textId + "a");
		if (con.style.display == "none") {
			con2.style.transform = "rotate(1turn)";
			con.style.display = "block";
		} else {
			con.style.display = "none";
			con2.style.transform = "rotate(0.5turn)";
		}
	}
</script>
</html>
