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
<title>1:1문의</title>
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
#sibal a {
	font-size: 18px;
	font-weight: bold;
	letter-spacing: 2px;
	    color: black;
}
</style>

<body style="color: rgba(0, 0, 0, 0.56); font-family: 'NanumBarunGothic';">


	<%@include file="header.jsp"%>
	<div style="height: 70px; "></div>
	<div id="intext"
		style="height: 150px; background-color: #3c9ac2d9; margin-top: 50px; position:relative;">
		<a
			style="color: aliceblue; font-size: 35px; margin-left: calc(10%); position: absolute; top: bott; bottom: 40%; left: 14%;">더보기</a>
	</div>
	<div
		style="width: 1000px; margin-left: calc(50% - 500px); margin-top: 50px">
		<div style="width: 200px; display: inline-block" id="sibal">
			<a style="text-decoration: none;" 
				href="${pageContext.request.contextPath}/notice.jsp">공지사항</a><br />
			<br /> <a style="text-decoration: none; "
				href="${pageContext.request.contextPath}/Service"> 자주 묻는 질문</a><br />
			<br /> <a style="text-decoration: none; color: #3c9ac2d9;">1대1 문의</a><br />
			<br /> <a style="text-decoration: none;"
				href="${pageContext.request.contextPath}/">메인으로</a>
		</div>
		<div
			style="width: 540px; margin-left: 241px; margin-top: -137px; position: absolute;">
			<div id="divHeader" style="width: 759px">
				<div onclick="headermenu('1aa')" id="1aa"
					style="border-bottom: solid 2px red; padding-bottom: 10px; width: 115px; display: inline-block; cursor: pointer;">
					나의 문의 내역</div>
				<div onclick="headermenu('2aa')" id="2aa"
					style="border-bottom: solid 2px #e9e2e2; cursor: pointer; padding-bottom: 10px; width: 105px; display: inline-block; text-align: center;">
					새 문의 작성</div>
			</div>




			<!-- 로그인 시에만 자기가 쓴 글 보기에 예외처리 해야함  관리자만 글 수정 삭제 가능하게 해야 함 1:1문의는 일단 사용자가 글 수정삭제 할지말지 고민 -->
			<div id="divbody">
				<c:forEach var="vov" varStatus="status" items="${list}">
					<c:set var="suc" value="a"></c:set>
					<c:if test="${vov.mid==user.id }">

						<c:if test="${vo.auth != admin }">

							<div onclick="javascript:doDisplay('${status.count}')"
								style="width: 759px; border-bottom: inset 3px; padding-top: 5px; padding-bottom: 5px; line-height: 2; cursor: pointer;">

								<img alt="" src="../image/button.png" id="${status.count}${suc}"
									style="height: 15px; float: right; display: block; transform: rotate(0.5turn); width: 15px; height: 15px;" />
								<p>
									<Strong><c:out value="${vov.iaskcategory }"></c:out></Strong>

									<c:out value="${vov.iasktitle}"></c:out>
									<br /> <a style="opacity: 0.5; margin-top: 10px;"> 작성일 <fmt:formatDate
											value="${vov.idate}" />
									</a><a
										style="margin-left: 10px; padding: 0.5px; border: solid 1px; border-radius: 3px; display: inline; background: rgba(246, 247, 242);">
										<c:if test="${vov.icheck=='미답변' }">
											<c:out value="미답변"></c:out>
										</c:if> <c:if test="${vov.icheck!='미답변' }">
											<c:out value="답변완료"></c:out>
										</c:if>
									</a>
								</p>

							</div>

							<div id="${status.count}"
								style="display: none; width: 759px; background-color: rgba(246, 247, 242); padding: 10px;">
								<p>
									<c:out value="${vov.icontent}"></c:out>
								</p>
								<p style="color: #96ddff">
									<c:out value="${vov.admincontent}"></c:out>
								</p>


							</div>
						</c:if>
					</c:if>
				</c:forEach>












				<div id="divbodyforadmin">
					<c:forEach var="vov" varStatus="status" items="${list}">
						<c:set var="suc" value="a"></c:set>
						<c:if test="${vo.auth == 'admin' }">

							<div onclick="javascript:doDisplay('${status.count}')"
								style="width: 759px; border-bottom: inset 3px; padding-top: 5px; padding-bottom: 5px; line-height: 2; cursor: pointer;">

								<a style=""><c:out value="${vov.mid } 님"></c:out></a> <img
									alt="" src="../image/button.png" id="${status.count}${suc}"
									style="height: 15px; float: right; display: block; transform: rotate(0.5turn); width: 15px; height: 15px;" />
								<p>
									<Strong><c:out value="${vov.iaskcategory }"></c:out></Strong>

									<c:out value="${vov.iasktitle}"></c:out>
									<br /> <a style="opacity: 0.5; margin-top: 10px;"> 작성일 <fmt:formatDate
											value="${vov.idate}" />
									</a> <a
										style="margin-left: 10px; padding: 0.5px; border: solid 1px; border-radius: 3px; display: inline; background: rgba(246, 247, 242);">
										<c:if test="${vov.icheck=='미답변' }">
											<c:out value="미답변"></c:out>
										</c:if> <c:if test="${vov.icheck!='미답변' }">
											<c:out value="답변완료"></c:out>
										</c:if>
									</a>
								</p>

							</div>
							<div id="${status.count}"
								style="display: none; width: 759px; background-color: rgba(246, 247, 242); padding: 10px;">


								<!--지호한테 보내줘야 할 부분 form 태그 하나 추가됐습니다 -->
								<form action="ask1v1" method="POST" id="reply">

									<p>
										<c:out value="${vov.icontent}"></c:out>
									</p>
									<br> <br>

									<p style="color: #96ddff">
										<c:out value="${vov.admincontent}"></c:out>
									</p>




									<input type="hidden" value="${vov.ino }" name="ino">

									<textarea
										style="height: 150px; width: 100%; margin-top: 30px; padding: 32px; border-radius: 4px; font-size: 18px; line-height: 29px; border: 1px solid rgba(0, 0, 0, 0.08);"
										name="admincontent"></textarea>
									<br> <br> <input id="btnn"
										style="color: #fff; background-color: #ff0055; border-radius: 4px; text-align: center; vertical-align: top; width: 150px; height: 38px; padding-top: 5px;"
										value='<c:out value="${vov.mid }님께 답장"></c:out>'
										onclick="submit()" />


								</form>
							</div>
						</c:if>
					</c:forEach>







				</div>
				<c:if test="${vo.auth =='admin'}">
					<div
						style="width: 759px; margin: auto; padding: 10px; text-align: center;">
						전체 글 개수 :
						<c:out value="${paging.totalCount }" />
						<br> <a class="pagenum" href="?page=1">&lt;&lt;</a> <a
							class="pagenum" href="?page=${paging.startPage-1 }"
							style='<c:if test="${paging.startPage==1 }">display:none;</c:if>'>&lt;</a>

						<c:forEach var="i" begin="${paging.startPage }"
							end="${paging.endPage }">
							<a class="pagenum ieach" href="?page=${i }"><c:out
									value="${i }" /></a>
						</c:forEach>

						<a class="pagenum" href="?page=${paging.endPage+1 }"
							style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'>&gt;</a>

						<a class="pagenum" href="?page=${paging.totalPage }">&gt;&gt;</a>
					</div>
				</c:if>
			</div>











			<form action="write" method="POST" id="write">
				<input type="hidden" name="id" value="${id }">
				<div id="divbody2" style="display: none;">


					<!--  파라미터 값 넘겨주려고 이부분 추가 했슴다-->
					<input type="hidden" value="${vov.admincontent }">




					<div style="margin-top: 25px;">트레비 이용 중 불편하신 점을 문의주시면 최대한 빠른
						시일내에 답변 드리겠습니다.</div>
					<div style="margin-top: 30px;">카테고리유형</div>

					<input id="realcategory" type="text" name="icategory"
						style="display: none;"> <select id="category"
						name="hidden1" class="selectbox" onchange="categoryval();">

						<option value="">카테고리유형을 선택하세요</option>
						<option value="모텔">모텔</option>
						<option value="호텔·리조트">호텔·리조트</option>
						<option value="펜션">펜션</option>
					</select> <input id="realcategory2" type="text" name="iaskcategory"
						style="display: none;">
					<div style="margin-top: 30px;">문의유형</div>
					<select id="category2" name="hidden2" class="selectbox"
						onchange="categoryval2();">
						<option value="">문의유형을 선택하세요</option>
						<option value="이용문의">이용문의</option>
						<option value="가격문의">가격문의</option>
						<option value="이벤트문의">이벤트문의</option>
					</select>

					<div style="margin-top: 50px;">
						문의 제목 <input type="text" name="iasktitle"
							style="height: 35px; width: 673px; margin-top: 10px">
					</div>

					<div style="margin-top: 30px;">문의내용</div>
					<div>
						<textarea name="icontent" id=""
							style="height: 272px; padding: 32px; border-radius: 4px; font-size: 18px; line-height: 29px; border: 1px solid rgba(0, 0, 0, 0.08); resize: none; width: 672px; margin-top: 30px;"
							placeholder="문의 내용을 작성해 주세요"></textarea>
					</div>
					<input id="btn"
						style="color: #fff; background-color: #ff0055; border-radius: 4px; text-align: center; vertical-align: top; width: 144px; height: 38px; padding-top: 5px;"
						value="작성완료" onclick="execption()" readonly />
				</div>
			</form>



		</div>
	</div>

	<div style="height: 1200px;"></div>

	<%@include file="footer.jsp"%>
</body>
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

	function headermenu(headerId) {
		let con = document.getElementById(headerId);
		if (headerId == "1aa") {
			let con2 = document.getElementById("2aa");
			con2.style.borderBottom = "solid 2px #e9e2e2";
			con.style.borderBottom = "solid 2px red";
			let con3 = document.getElementById("divbody2");
			con3.style.display = "none"
			let con4 = document.getElementById("divbody");
			con4.style.display = ""

		} else {
			let con2 = document.getElementById("1aa");
			con2.style.borderBottom = "solid 2px #e9e2e2";
			con.style.borderBottom = "solid 2px red";
			let con3 = document.getElementById("divbody2");
			con3.style.display = ""
			let con4 = document.getElementById("divbody");
			con4.style.display = "none"
		}
	}
	function categoryval() {
		let categoryval = document.getElementById('category').value;
		let realcategory = document.getElementById('realcategory');
		realcategory.value = categoryval;

	}
	function categoryval2() {
		let categoryval2 = document.getElementById('category2').value;
		let realcategory2 = document.getElementById('realcategory2');
		realcategory2.value = categoryval2;
	}

	let id = "${id}"
	let iid = "${vo.auth}"

	function execption() {

		const frm = document.getElementById('write');
		const icategory = frm.icategory
		const iaskcategory = frm.iaskcategory
		const iasktitle = frm.iasktitle
		const icontent = frm.icontent

		let isValid = true

		console.log(icategory);

		if (iid == 'admin') {
			alert('관리자는 글 쓰기가 제한됩니다 답장만 하세요 답장만 ')
			isValid = false

		} else if (icategory.value == '') {
			alert('카테고리유형 입력 해 주세요 ')
			icategory.focus()
			isValid = false

		} else if (icategory.value == '') {
			alert('카테고리유형 입력 해 주세요 ')
			icategory.focus()
			isValid = false

		} else if (iaskcategory.value == '') {
			alert('문의 유형을 입력 해 주세요')
			icategory.focus()
			isValid = false
		} else if (iasktitle.value == '') {
			alert('문의 제목을 입력 해 주세요')
			iasktitle.focus()
			isValid = false
		} else if (icontent.value == '') {
			alert('내용을 입력 해 주세요')
			icontent.focus()
			isValid = false
		} else if (icontent.value.length < 10) {
			alert('문의 내용은 10문자 이상 작성 하셔야 합니다')
			isValid = false
		} else if (icontent.value.length > 100) {
			alert('문의 내용은 100자 이하로 작성 부탁드립니다')
			isValid = false

		} else if (iasktitle.value.length > 40) {
			alert('제목이 너무 깁니다 자세한 내용은 본문 내용에 작성해주세요')
			isValid = false
		}

		if (isValid) {
			frm.submit()
		}
	}
</script>
</html>


