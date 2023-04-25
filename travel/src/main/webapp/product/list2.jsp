<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- nav글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto+Condensed&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&family=Noto+Sans+KR&family=Roboto+Condensed&display=swap"
	rel="stylesheet">
</head>
<!-- main 글골 -->
<link href="${pageContext.request.contextPath  }/css/list.css"
	rel="stylesheet" />
<%@ include file="../header.jsp"%>
<body>
	<main>
		<nav id="list_nav">
			<ul class="menu">
				<li class="menu-item">
					<div id="menu_category">
						<div class="nav_main_menu">${koreanType1 }인기숙소</div>
						<i class="fa-solid fa-chevron-right" id="nav_icon"></i>
						<c:if test="${type3!=null }">
							<div id="main_sub_address">${koreanType2 }</div>
						</c:if>
						<div id="line"></div>
					</div>
					<ul class="sub-menu">
						<c:forEach items="${addressAll }" var="addr">
							<li class="sub-menu-item"><a href="#">${addr.key }</a>
								<ul class="sub-sub-menu">
									<c:forEach var="sub" items="${addr.value }">
										<li class="sub-sub-menu-item"><a
											href="?pcategory=${type1 }&address=${addr.key }&subaddress=${sub}">${sub }</a></li>
									</c:forEach>
								</ul></li>
						</c:forEach>
					</ul>

				</li>
			</ul>
			<c:if test="${user.auth eq 'admin' }">
				<div style="transform: translate(230px, -90px);">
					<form action="write">
						<button id="insertButton"
							style="width: 123px; height: 55px; border: none; font-size: 16px; font-weight: bold; color: #000; border-radius: 10px; background-color: #9adfff;">숙소등록</button>
					</form>
				</div>
			</c:if>
		</nav>
		<div id="list_main_product">
			<c:forEach var="vo" items="${list}">
				<div class="list_item">
					<div id="list_product_img">
						<a href="detail?pno=${vo.pno}"><img
							src="/product_img/${vo.photofiles[0] }" width="500px"
							height="400px">
							<div id="main_product_text">
								<div id="main_product_detail">
									<p id="main_product_text_title">${vo.pname }</p>
									<p>${vo.rcount }</p>
									<p>${vo.address }${vo.subaddress }</p>
								</div>
								<div id="main_product_etc_area1">
									<div>
										<p>숙박 빠른입실</p>
									</div>
									<div>
										<p>예약</p>
									</div>
								</div>
								<div id="main_product_price">
									<p>
										<span style="color: rgb(255, 75, 75);">${vo.price }</span>원
									</p>
								</div>
								<div id="main_product_etc_area2">
									<div>
										<p>대실</p>
									</div>
									<div>
										<p>예약</p>
									</div>
								</div>
								<div id="main_product_price2">
									<fmt:parseNumber var="price" value="${vo.price/2 }"
										integerOnly="true" />
									<p>
										<span style="color: rgb(255, 75, 75);">${price }</span>원
									</p>
								</div>
							</div> </a>
					</div>
				</div>
			</c:forEach>
		</div>
		<div
			style="width: 700px; margin: auto; padding: 10px; text-align: center; clear: both;">



			<c:if test="${type2==null }">
				<a class="pagenum" href="?pcategory=${type1 }&page=1"><i class="fa-solid fa-backward" style="color:#737188"></i></a>
				<!--(1) 첫번째 페이지 1번으로 이동 -->
				<!--(2) 이 부분이 제일 복잡합니다. 실행하면서 파악해보세요. -->
				<!-- 요청은 ListController가 받음. page파라미터 변경됨 -->
				<a class="pagenum"
					href="?pcategory=${type1 }&page=${paging.startPage-1 }"
					style='<c:if test="${paging.startPage==1 }">display:none;</c:if>'><i class="fa-solid fa-play" style="transform: rotate(180deg); color:#65bbdf;"></i></a>
				<!--(3) 페이지 범위 startPage 부터 endPage 까지 반복 -->
				<c:forEach var="i" begin="${paging.startPage }"
					end="${paging.endPage }">
					<a class="pagenum ieach" href="?pcategory=${type1 }&page=${i }"><c:out
							value="${i }" /></a>
				</c:forEach>
				<!--(4) 이 부분이 제일 복잡합니다. 실행하면서 파악해보세요. -->
				<a class="pagenum"
					href="?pcategory=${type1 }&page=${paging.endPage+1 }"
					style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'><i class="fa-solid fa-play" style="color:#65bbdf;"></i></a>
				<a class="pagenum"
					href="?pcategory=${type1 }&page=${paging.totalPage }"><i class="fa-solid fa-forward" style="color:#737188"></i></a>
				<!--(5) 가장 마지막 페이지로 이동 -->
			</c:if>

			<c:if test="${type2 != null}">
				<a class="pagenum"
					href="?pcategory=${type1 }&address=${type2 }&subaddress=${type3}&page=1"><i class="fa-solid fa-backward" style="color:#737188"></i></a>
				<a class="pagenum"
					href="?pcategory=${type1 }&address=${type2 }&subaddress=${type3}&page=${paging.startPage-1 }"
					style='<c:if test="${paging.startPage==1 }">display:none;</c:if>'><i class="fa-solid fa-play" style="transform: rotate(180deg); color:#65bbdf;"></i></a>
				<!--(3) 페이지 범위 startPage 부터 endPage 까지 반복 -->
				<c:forEach var="i" begin="${paging.startPage }"
					end="${paging.endPage }">
					<a class="pagenum ieach" style="color:#817e7e;"
						href="?pcategory=${type1 }&address=${type2 }&subaddress=${type3}&page=${i }"><c:out
							value="${i }" /></a>
				</c:forEach>
				<!--(4) 이 부분이 제일 복잡합니다. 실행하면서 파악해보세요. -->
				<a class="pagenum"
					href="?pcategory=${type1 }&address=${type2 }&subaddress=${type3}&page=${paging.endPage+1 }"
					style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'><i class="fa-solid fa-play" style="color:#65bbdf;"></i></a>
				<a class="pagenum"
					href="?pcategory=${type1 }&address=${type2 }&subaddress=${type3}&page=${paging.totalPage }"><i class="fa-solid fa-forward" style="color:#737188"></i></a>
				<!--(5) 가장 마지막 페이지로 이동 -->
			</c:if>
		</div>
	</main>
	<script type="text/javascript">
		const pnums = document.querySelectorAll('.ieach');
		pnums.forEach(function(item) {
			console.log(item);
			/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
			if (item.innerHTML == '${paging.currentPage}') {
				item.style.color = '#65bade';
				item.style.fontWeight = 'bold';
			} else {
				item.style.color = '#817e7e';
			}
		});
	</script>
	<%@ include file="../footer.jsp"%>

</body>
</html>