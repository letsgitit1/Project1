<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/likes.css">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css">
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
.infoDiv {
	margin-bottom: 20px;
}
a:visited{
	color: black;
}
#ppage p, #ppage a {
	 font-size: 14px;
}
#sibal a {
	font-size: 18px;
	font-weight: bold;
	letter-spacing: 2px;
	margin: 5px 0;
}

.likes_item_title {
	font-size: 15px;
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
	<div style="width: 1000px; margin-left: calc(50% - 500px); margin-top: 50px; background-color: white">
		<div style="width: 200px; display: inline-block" id="sibal">
			<a style="text-decoration: none;" href="">예약내역</a><br /> <br />
			<a style="text-decoration: none; color: #3c9ac2d9;" href="${pageContext.request.contextPath }/likes">찜 목록</a><br /> <br />
			<a style="text-decoration: none;" href="${pageContext.request.contextPath }/my/inqurity">내 문의내역</a><br /> <br /> 
			<a style="text-decoration: none;" href="${pageContext.request.contextPath }/my/mypage" style="background-color: green;">내 정보 관리</a>
		</div>
		<div
			style="width: 540px; margin-left: 241px; margin-top: -137px; position: absolute;">
			<div id="divHeader" style="width: 759px">
				 <div id="zzimlist" class="container">
        <div class="likes_list_wrap">
            <c:forEach var="item" items="${wishList}" varStatus="i">

            <div class="likes_item_wrap">
                <div class="likes_item_img">
                    <img src="/product_img/${item.photofile[0]}" alt="">
                </div>
                <div class="likes_item_info">
                    <div class="likes_item_info_top">
                        <a href="${pageContext.request.contextPath }/product/detail?pno=${item.pno}"><span class="likes_item_title">${item.pname}</span></a>
                        <div>
					  <span class="star">
						<span class="active"></span>
					  </span>
                           <%--  <span class="txt bold score">${item.rcount/}</span> --%>
                            <span class="txt">(${item.rcount})</span>
                        </div>
                        <span class="txt">
						<c:if test="${item.category == 'Hotel'}">
                            호텔 &middot; 일반호텔
                        </c:if>
						<c:if test="${item.category == 'Motel'}">
                            모텔 &middot; 일반모텔
                        </c:if>
						<c:if test="${item.category == 'Pension'}">
                            펜션
                        </c:if>
						<c:if test="${item.category == 'Camping'}">
                            캠핑
                        </c:if>
					</span>
                    </div>
                    <div class="likes_item_info_bottom">
                        <span class="txt big">${item.price}</span>
                        <span class="txt">원</span>
                    </div>
                </div>
            </div>
            </c:forEach>
<div id="ppage" style="width:700px;margin: auto;padding: 10px;text-align: center;">
            <p>전체 찜 개수 : <c:out value="${heartPage.totalCount }"/></p> <br>
	<p style="display: inline">${heartPage.currentPage }/${heartPage.totalPage }</p>
	<hr>
	<a class="pagenum" href="?page=1&pageRows=${heartPage.pageSize}"><i class="fa-solid fa-backward" style="color:#737188"></i></a>   <!--(1) 첫번째 페이지 1번으로 이동 -->
	
	<!--(2) 이 부분이 제일 복잡합니다. 실행하면서 파악해보세요. -->
	<a class="pagenum" href="?page=${heartPage.startPage-1 }&pageRows=${heartPage.pageSize}"      
			style='<c:if test="${heartPage.startPage==1 }">display:none;</c:if>' ><i class="fa-solid fa-play" style="color:#65bbdf;"></i></a>
	
	<!--(3) 페이지 범위 startPage 부터 endPage 까지 반복 -->
	<c:forEach var="i" begin="${heartPage.startPage }" end="${heartPage.endPage }">
		<a class="pagenum ieach" style="color:#817e7e;" href="?page=${i }&pageRows=${heartPage.pageSize}"><c:out value="${i }"/></a>
	</c:forEach>
	
	<!--(4) 이 부분이 제일 복잡합니다. 실행하면서 파악해보세요. -->
	<a class="pagenum" href="?page=${heartPage.endPage+1 }&pageRows=${heartPage.pageSize}"
			style='<c:if test="${heartPage.endPage==heartPage.totalPage }">display:none;</c:if>'><i class="fa-solid fa-play" style="color:#65bbdf;"></i></a>
			
	<a class="pagenum" href="?page=${heartPage.totalPage }&pageRows=${heartPage.pageSize}"><i class="fa-solid fa-forward" style="color:#737188"></i></a>  <!--(5) 가장 마지막 페이지로 이동 -->
</div>
<script type="text/javascript">
	const pnums = document.querySelectorAll('.ieach');
	pnums.forEach(function(item){
		console.log(item);
		/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
		if(item.innerHTML=='${heartPage.currentPage}') {    
			item.style.color = 'black';
			item.style.fontWeight = 'bold';
		}else{
			item.style.color = '#37966f';
		}
	});
	
	$(function(){
		$("[name='pageRows']").change(function(){
			//alert($(this).val());
			let frm = $("[name='frmpageRows']");
			frm.attr("method", "GET");
			frm.attr("action", "list");
			frm.submit();
		});
	});
</script>
            
            <script>
                window.onload = function () {
                    setStarActive();
                }

                function setStarActive() {
                    const starList = document.querySelectorAll('.star');
                    const scoreList = document.querySelectorAll('.score');
                    scoreList.forEach((el, index) => {
                        const percentage = ratingToPercentage(el.innerText);
                        starList[index].children[0].style.width = `${percentage}%`
                    })
                }

                function ratingToPercentage(score) {
                    return Number(score) / 5 * 100;
                }
            </script>
        </div>
    </div>
			</div>
		</div>
	</div>
	</div>
	<%@include file="/footer.jsp"%>
</body>
</html>

