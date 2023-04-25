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

.infoDiv {
	margin-bottom: 20px;
}

a:visited {
	color: black;
}

#buttonDiv, #buttonDiv2, #buttonDiv3, #buttonDiv4 {
	width: 220px;
}

.changeButton {
	font-size: 16px;
	font-weight: bolder;
	background-color: rgb(59, 155, 218);
	border: 0px;
	border-radius: 5px;
	padding: 5px;
	width: 75px;
	height: 40px;
	text-align: center;
	color: white;
}

.myinput {
	width: 40%;
	height: 35px;
	margin: 10px 0 10px 0;
	border-radius: 5px;
	margin-top: 5px;
	font-size: 18px;
	color: rgb(167 41 41/ 56%);
}

.myinput::placeholder {
	font-size: 14px;
	font-family: 'NanumBarunGothic';
	padding-left: 7px;
}

strong, b {
	font-size: 17px;
	color: black;
}

.marginDiv {
	margin-bottom: 10px;
}

.rightButton {
	float: right;
}

#sibal a {
	font-size: 18px;
	font-weight: bold;
	letter-spacing: 2px;
	color: black;
}
</style>

<body
	style="color: rgba(0, 0, 0, 0.56); font-family: 'NanumBarunGothic';">


	<%@include file="/header.jsp"%>
	<div style="height: 70px;"></div>
	<div id="intext"
		style="height: 150px; background-color: #3c9ac2d9; margin-top: 50px;">
		<a style="color: aliceblue; font-size: 35px; margin-left: calc(10%)">내정보</a>
	</div>
	<div id="contain" style="height: 680px;">
		<div
			style="width: 1000px; margin-left: calc(50% - 500px); margin-top: 50px">
			<div style="width: 200px; display: inline-block" id="sibal">
				<a style="text-decoration: none;"
					href="${pageContext.request.contextPath }/my/paylist">예약내역</a><br />
				<br /> <a style="text-decoration: none;"
					href="${pageContext.request.contextPath }/likes">찜 목록</a><br /> <br />
				<a style="text-decoration: none;"
					href="${pageContext.request.contextPath }/my/inqurity">내 문의내역</a><br />
				<br /> <a style="text-decoration: none; color: #3c9ac2d9;"
					href="${pageContext.request.contextPath }/my/mypage"
					style="background-color: green;">내 정보 관리</a>
			</div>
			<div
				style="width: 540px; margin-left: 241px; margin-top: -137px; position: absolute;">
				<div id="divHeader" style="width: 759px">
					<strong>내 정보 수정</strong>
					<div style="width: 128px; height: 128px;">
						<div>
							<img
								src="${pageContext.request.contextPath }/img/main_hader_logo.png"
								style="width: 100%; height: 100%; margin: 0 0 26px -20px;">
						</div>
					</div>
					<div class="infoDiv">
						<div class="marginDiv">
							<b>예약자이름</b> <span> ${user.name }</span>
						</div>
						<div id="nameDiv" style="display: none;">
							<p>
								<input type="text" class="myinput" placeholder="바꾸실 이름을 입력해주세요">
							</p>
						</div>
						<div id="buttonDiv2">
							<button id="change2" class="changeButton" onclick="change(2)">수정</button>
							<button id="changeOk2" class="changeButton"
								style="display: none;">수정완료</button>
							&nbsp;&nbsp;&nbsp;
							<button id="cancle2" class="changeButton rightButton"
								style="display: none;" onclick="cancle(2)">수정취소</button>
						</div>
					</div>
					<div class="infoDiv">
						<div class="marginDiv">
							<b>휴대폰번호</b> <span> ${user.phone }</span>
						</div>
						<div id="phoneDiv" style="display: none;">
							<p>
								<input type="text" class="myinput" placeholder="바꾸실 번호을 입력해주세요">
							</p>
						</div>
						<div id="buttonDiv3">
							<button id="change3" class="changeButton" onclick="change(3)">수정</button>
							<button id="changeOk3" class="changeButton"
								style="display: none;">수정완료</button>
							&nbsp;&nbsp;&nbsp;
							<button id="cancle3" class="changeButton rightButton"
								style="display: none;" onclick="cancle(3)">수정취소</button>
						</div>
					</div>
					<div class="infoDiv">
						<div class="marginDiv">
							<b>회원정보수정</b>
						</div>
						<div id="memberDiv" style="display: none;">
							<form id="memberfrm" action="changemember" method="post">
								<p>
									현재 비밀번호<br> <input type="password" name="pw"
										placeholder="현재 비밀번호를 입력해주세요" class="myinput"><br>
									바꾸실 비밀번호<br> <input type="password" name="repw"
										placeholder="비밀번호를 입력해주세요" class="myinput"><br> <input
										type="password" name="repwcheck" placeholder="비밀번호 확인"
										class="myinput"><br>
								</p>
							</form>
						</div>
						<div id="buttonDiv4">
							<button id="change4" class="changeButton" onclick="change(4)">수정</button>
							<button id="changeOk4" class="changeButton"
								style="display: none;"
								onclick="document.getElementById('memberfrm').submit();">수정완료</button>
							&nbsp;&nbsp;&nbsp;
							<button id="cancle4" class="changeButton rightButton"
								style="display: none;" onclick="cancle(4)">수정취소</button>
						</div>
					</div>
					<form action="delete" method="POST">
					<div style="display: flex; justify-content: end;">
						<button
							style="width: 100px; height: 40px; border-radius: 5px; border: none; background-color: rgb(68, 173, 242); color: #fff; font-weight: bold; font-size: 15px;">회원
							탈퇴</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/footer.jsp"%>
</body>
<script type="text/javascript">
	function change(val) {
		if (val == 1) {
			let nickNameDiv = document.getElementById('nickNameDiv');
			let change = document.getElementById('change');
			let changeOk = document.getElementById('changeOk');
			let cancle = document.getElementById('cancle');

			nickNameDiv.style.display = 'block';
			change.style.display = 'none';
			changeOk.style.display = 'inline-block';
			cancle.style.display = 'inline-block';
		} else if (val == 2) {
			let nameDiv = document.getElementById('nameDiv');
			let change2 = document.getElementById('change2');
			let changeOk2 = document.getElementById('changeOk2');
			let cancle2 = document.getElementById('cancle2');

			nameDiv.style.display = 'block';
			change2.style.display = 'none';
			changeOk2.style.display = 'inline-block';
			cancle2.style.display = 'inline-block';
		} else if (val == 3) {
			let phoneDiv = document.getElementById('phoneDiv');
			let change3 = document.getElementById('change3');
			let changeOk3 = document.getElementById('changeOk3');
			let cancle3 = document.getElementById('cancle3');

			phoneDiv.style.display = 'block';
			change3.style.display = 'none';
			changeOk3.style.display = 'inline-block';
			cancle3.style.display = 'inline-block';
		} else if (val == 4) {
			let memberDiv = document.getElementById('memberDiv');
			let change4 = document.getElementById('change4');
			let changeOk4 = document.getElementById('changeOk4');
			let cancle4 = document.getElementById('cancle4');

			memberDiv.style.display = 'block';
			change4.style.display = 'none';
			changeOk4.style.display = 'inline-block';
			cancle4.style.display = 'inline-block';
		}
	}

	function cancle(val) {
		if (val == 1) {
			let nickNameDiv = document.getElementById('nickNameDiv');
			let change = document.getElementById('change');
			let changeOk = document.getElementById('changeOk');
			let cancle = document.getElementById('cancle');

			nickNameDiv.style.display = 'none';
			change.style.display = 'block';
			changeOk.style.display = 'none';
			cancle.style.display = 'none';
		} else if (val == 2) {
			let nameDiv = document.getElementById('nameDiv');
			let change2 = document.getElementById('change2');
			let changeOk2 = document.getElementById('changeOk2');
			let cancle2 = document.getElementById('cancle2');

			nameDiv.style.display = 'none';
			change2.style.display = 'block';
			changeOk2.style.display = 'none';
			cancle2.style.display = 'none';
		} else if (val == 3) {
			let phoneDiv = document.getElementById('phoneDiv');
			let change3 = document.getElementById('change3');
			let changeOk3 = document.getElementById('changeOk3');
			let cancle3 = document.getElementById('cancle3');

			phoneDiv.style.display = 'none';
			change3.style.display = 'block';
			changeOk3.style.display = 'none';
			cancle3.style.display = 'none';
		} else if (val == 4) {
			let memberDiv = document.getElementById('memberDiv');
			let change4 = document.getElementById('change4');
			let changeOk4 = document.getElementById('changeOk4');
			let cancle4 = document.getElementById('cancle4');

			memberDiv.style.display = 'none';
			change4.style.display = 'block';
			changeOk4.style.display = 'none';
			cancle4.style.display = 'none';
		}
	}
</script>
</html>

