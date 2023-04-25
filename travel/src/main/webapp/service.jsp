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

	<%@include file="header.jsp"%>
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
			<a style="text-decoration: none;"
				href="${pageContext.request.contextPath}/notice.jsp" style="color: red">공지사항</a><br />
			<br /> <a style="text-decoration: none; color: #3c9ac2d9;"
				href="${pageContext.request.contextPath}/Service">자주 묻는 질문</a><br /> <br />
			<a style="text-decoration: none;"
				href="${pageContext.request.contextPath}/ask1v1">1대1 문의</a><br /> <br />
			<a style="text-decoration: none;" href="${pageContext.request.contextPath}/">메인으로</a>
		</div>
		<div
			style="width: 540px; margin-left: 241px; margin-top: -137px;">

			<div id="divHeader" style="width: 759px">
				<div
					style="border-bottom: solid 2px red; padding-bottom: 10px; width: 105px; cursor: pointer; margin-bottom: 20px;">
					자주 묻는 질문</div>
				<c:forEach var="co" items="${categories}">
					<div
						style="padding-bottom: 10px; width: 105px; cursor: pointer; display: inline-block;"
						onclick="categoryfun('${co.scategory}')">
						<c:out value="${co.scategory }"></c:out>
					</div>
				</c:forEach>





				<div id="divbody">
					<c:forEach var="svo" varStatus="status" items="${listlist}">
						<c:set var="suc" value="a"></c:set>
							<div onclick="javascript:doDisplay('${status.count}')"
								style="width: 759px; border-bottom: inset 3px; padding-top: 5px; padding-bottom: 5px; line-height: 2; cursor: pointer;">
								<img alt="" src="../image/button.png" id="${status.count}${suc}"
									style="height: 15px; float: right; display: block; transform: rotate(0.5turn); width: 15px; height: 15px;" />
								<p>
									<Strong><c:out value="${svo.scategory }"></c:out></Strong>
									<c:out value="${svo.stitle}"></c:out>
									<br /> <a style="opacity: 0.5; margin-top: 10px;"> 작성일 <fmt:formatDate
											value="${svo.sdate}" />
									</a>
								</p>
							</div>
							<div id="${status.count}"
								style="display: none; width: 759px; background-color: rgba(246, 247, 242); padding: 10px;">
								<p>
									<c:out value="${svo.scontent}"></c:out>
								</p>
							</div>
							</c:forEach>



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

				</div>
			</div>

		</div>


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

	function categoryfun(categoryname) {
		location.href = "Service?category=" + categoryname;
	}

	window.onload = function() {
		var params = new URLSearchParams(location.search);
		var sch_keyword = params.get('category');
		
	}
	
</script>
</html>
