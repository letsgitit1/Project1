<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/likes.css">
</head>
<body>
	<jsp:include page="/header.jsp" />
	<main id="likes_main">
		<div id="zzimlist" class="container">
			<div class="likes_list_wrap">
				<c:forEach var="item" items="${wishList}" varStatus="i">

					<div class="likes_item_wrap">
						<div class="likes_item_img">
							<img src="product_img/${item.photofile[0]}" alt="">
						</div>
						<div class="likes_item_info">
							<div class="likes_item_info_top">
								<a
									href="${pageContext.request.contextPath }/product/detail?pno=${item.pno}"><span
									class="likes_item_title">${item.pname}</span></a>
								<div>
									<span class="star"> <span class="active"></span>
									</span> <span class="txt bold score">${item.rcount}</span> <span
										class="txt">()</span>
								</div>
								<span class="txt"> <c:if
										test="${item.category == 'hotel'}">
                            호텔 &middot; 일반호텔
                        </c:if> <c:if test="${item.category == 'motel'}">
                            모텔 &middot; 일반모텔
                        </c:if> <c:if test="${item.category == 'Pension'}">
                            펜션
                        </c:if>
								</span>
							</div>
							<div class="likes_item_info_bottom">
								<span class="txt big">${item.price}</span> <span class="txt">원</span>
							</div>
						</div>
					</div>
				</c:forEach>
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
	</main>
</body>
</html>