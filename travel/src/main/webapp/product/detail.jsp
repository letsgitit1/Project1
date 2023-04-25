<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소상세정보</title>
<jsp:include page="/header.jsp" />
<link href="${pageContext.request.contextPath }/css/star.css"
	rel="stylesheet">
<link href="../css/detail.css" rel="stylesheet" />
</head>
<style>
input[type="checkbox"]+label {
	float: right;
	width: 50px;
	height: 50px;
	border: none;
	border-radius: 0px;
	position: static;
}

input[type="checkbox"] {
	display: none;
}
</style>
<body>
	<div id="mindiv_main">
		<div class="maindiv">
			<c:forEach items="${vo.photofile }" var="photo" varStatus="i">
				<div class="div${i.index }">
					<img src="/product_img/${photo }" class="maindiv_img">
				</div>
			</c:forEach>
		</div>
		<div class="info">
			<hr>
			<p class="first">${vo.address }&nbsp;<span>${vo.pname }</span>
				<c:if test="${user.id != null }">
					<c:if test="${hcount == 1 }">

						<input type="checkbox" id="myCheck" onclick="b()" />
						<label for="myCheck" id="laCheck"
							style="background: url('../img/heartAfter1.png') no-repeat 0 0px/contain;"></label>
					</c:if>
					<c:if test="${hcount == 0 }">
						<input type="checkbox" id="myCheck" onclick="b()" />
						<label for="myCheck" id="laCheck"
							style="background: url('../img/heartBefore.png') no-repeat 0 0px/contain;"></label>
					</c:if>
				</c:if>
			<p class="second">
				<em>평점</em> <span>추천해요</span> 리뷰(${vo.rcount }개)
			</p>
			<p class="third">
				<span>${vo.subaddress }</span> ${vo.detailadd }
			</p>
			<p class="four" style="margin-bottom: 20px; float: left;">
				분류:
				<c:choose>
					<c:when test="${vo.pcategory eq 'Pension'}">
      펜션
   </c:when>
					<c:when test="${vo.pcategory eq 'Hotel'}">
      호텔
   </c:when>
					<c:otherwise>
      모텔
   </c:otherwise>
				</c:choose>
			</p>
			<c:if test="${user.auth eq 'admin' }">
			<form action="${pageContext.request.contextPath }/product/delete" method="POST">
			<input type="hidden" name="address" value="">
			<input type="hidden" value="${vo.pno }" name="pno">
						<span
				style="text-align: center; display: flex; justify-content: end;"><button
					style="width: 100px; background-color: #59a9cb; border: none; border-radius: 5px; height: 30px; margin-bottom: 5px;">삭제</button></span>
					</form>
					</c:if>
			<script type="text/javascript">
				let conpage = "${pageContext.request.contextPath}";
				let pno = "${vo.pno}";
				let mid = "${user.id}";
				function b() {
					let a = document.getElementById('myCheck');
					let la = document.getElementById('laCheck');
					if (a.value == 'off') {
						console.log(a.value);
						la.style.backgroundImage = "url('../img/heartBefore.png')";
						$.ajax({
							url : conpage + '/likes/delete?pno=' + pno
									+ '&mid=' + mid,
							method : 'GET'
						});
						a.value = 'on';
					} else {
						console.log(a.value);
						la.style.backgroundImage = "url('../img/heartAfter1.png')";
						$.ajax({
							url : conpage + '/likes/insert?pno=' + pno
									+ '&mid=' + mid,
							method : 'GET'
						});
						a.value = 'off';
					}
				}
			</script>
			<div id="product_choose" style="clear:both;">
				<div id="product_choose_img">
					<img src="/product_img/${vo.photofiles[1] }" />
				</div>
				<fmt:parseNumber var="test" value="${vo.price/2}" integerOnly="true" />
				<p class="five">남은 방 개수: ${vo.roomcnt }개</p>
				<div class="addad" id="jproduct_item1">
					<div id="ahffk">
						<p class="jproduct_type1">대실</p>

					</div>
					<p class="jprice1">
						₩
						<fmt:formatNumber value="${test}" type="number" />
					</p>
					<div id="tiem_info_Area1">
						<p class="first_time_info">마감시간</p>
						<p class="second_time_info">22:00까지</p>
					</div>
					<div id="tiem_info_Area2">
						<p class="first_time_info">이용시간</p>
						<p class="second_time_info">최대 4시간</p>
					</div>
					<button id="half_checkIn_button" onclick="PayMentView1()">대실
						예약</button>
				</div>
				<div id="jleft_border"></div>
				<div class="addad" id="jproduct_item2">
					<div id="ahffk2">
						<p class="jproduct_type2">숙박</p>
						<p class="jprice2">
							₩
							<fmt:formatNumber value="${vo.price }" type="number" />
						</p>
						<button id="full_checkIn_button" onclick="PayMentView2()">숙박예약</button>
					</div>
					<div id="tiem_info_Area1">
						<p class="first_time_info">입실시간</p>
						<p class="second_time_info">15시부터</p>
					</div>
					<div id="tiem_info_Area2">
						<p class="first_time_info">퇴실시간</p>
						<p class="second_time_info">익일12시</p>
					</div>
				</div>
			</div>
		</div>
		<script>
			const path = "${pageContext.request.contextPath }";
			function PayMentView1() {
				location.href = path + "/toss/payment?pno=" + pno + '&type='
						+ 1;
			}
			function PayMentView2() {
				location.href = path + "/toss/payment?pno=" + pno + '&type='
						+ 2;
			}
		</script>
		<div id="map" style="width: 1000px; height: 500px; margin: 0 auto;"></div>
		<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=58b7f7f1223b1914b77c46c8f98fc9ca"></script> -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8660378ccb077720965e390bfdbd757f&libraries=services,clusterer,drawing"></script>
		<script>
			let wherepro = "${vo.address} ${vo.pname}"
		</script>
		<script>
			// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
			var infowindow = new kakao.maps.InfoWindow({
				zIndex : 1
			});

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();

			// 키워드로 장소를 검색합니다
			console.log(wherepro);
			ps.keywordSearch(wherepro, placesSearchCB);

			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
				if (status === kakao.maps.services.Status.OK) {

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
					// LatLngBounds 객체에 좌표를 추가합니다
					var bounds = new kakao.maps.LatLngBounds();

					for (var i = 0; i < data.length; i++) {
						displayMarker(data[i]);
						bounds.extend(new kakao.maps.LatLng(data[i].y,
								data[i].x));
					}

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					map.setBounds(bounds);
				}
			}

			// 지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {

				// 마커를 생성하고 지도에 표시합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : new kakao.maps.LatLng(place.y, place.x)
				});

				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event
						.addListener(
								marker,
								'click',
								function() {
									// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
									infowindow
											.setContent('<div style="padding:5px;font-size:12px;">'
													+ place.place_name
													+ '</div>');
									infowindow.open(map, marker);
								});
			}
		</script>


		<div id="reviewbox">
			<c:forEach items="${review }" var="re" varStatus="e">
				<div class="reviewinfo">
					<p class="rtitle">${re.rtitle }<span>&nbsp;(${re.mid })</span>
					</p>
					<span class="starcnt" id="s${e.index }"> <c:if
							test="${re.star != 0 }">
							<c:forEach begin="1" end="${re.star }">
								<img src="${pageContext.request.contextPath }/img/star.png">
							</c:forEach>
						</c:if> <c:if test="${re.star == 0 }">
							<img src="${pageContext.request.contextPath }/img/emptystar.png">
						</c:if>
					</span>
					<p class="rstar">${re.star }</p>
					<p class="rcontent">${re.rcontent }</p>
					<c:forEach items="${re.rphoto}" var="pt">
						<div class="reviewimg" style="display: inline-block;">
							<img src="/review_img/${pt}" class="rimages">
						</div>
					</c:forEach>
				</div>
				<br>
			</c:forEach>
			<hr>
		</div>
		<div style="width: 1000px; margin: 0 auto;">
			<h2>후기작성</h2>
			<form action="${pageContext.request.contextPath }/review"
				id="writeForm" method="post" enctype="Multipart/form-data">
				<div class="star-rating" id="star">
					<input type="radio" id="5-stars" name="rating" value="5.0" /> <label
						for="5-stars" class="star"><img
						src="${pageContext.request.contextPath }/img/emptystar.png"></label>
					<input type="radio" id="4-stars" name="rating" value="4.0" /> <label
						for="4-stars" class="star"><img
						src="${pageContext.request.contextPath }/img/emptystar.png"></label>
					<input type="radio" id="3-stars" name="rating" value="3.0" /> <label
						for="3-stars" class="star"><img
						src="${pageContext.request.contextPath }/img/emptystar.png"></label>
					<input type="radio" id="2-stars" name="rating" value="2.0" /> <label
						for="2-stars" class="star"><img
						src="${pageContext.request.contextPath }/img/emptystar.png"></label>
					<input type="radio" id="1-star" name="rating" value="1.0" /> <label
						for="1-star" class="star"><img
						src="${pageContext.request.contextPath }/img/emptystar.png"></label>
				</div>
				<div class="reviewtitle">
					<input name="pno" type="hidden" value="${vo.pno }"> <input
						name="id" type="hidden" value="${user.id }"> 제목: <input
						id="rtitle" name="text">
				</div>
				<br>
				<div class="review">
					<textarea id="boardContent" name="boardContents"
						placeholder="내용 작성" style="resize: none;" rows="5" cols="136"></textarea>
				</div>
				<div class="reviewdiv">
					<div class="files">
						<div>
							<label for="board_file1" style="display: inline;"> <img
								id="board_file1Img"
								src="${pageContext.request.contextPath}/img/no-photo.png"
								width="110px" height="110px" style="display: inline;">
							</label>
						</div>
						<input id="board_file1" name="board_file1" type="file" value="">

					</div>
					<div class="files">
						<div>
							<label for="board_file2" style="display: inline;"> <img
								id="board_file2Img"
								src="${pageContext.request.contextPath}/img/no-photo.png"
								width="110px" height="110px" style="display: inline;">
							</label>
						</div>
						<input id="board_file2" name="board_file2" type="file">
					</div>
					<div class="files">
						<div>
							<label for="board_file3" style="display: inline;"> <img
								id="board_file3Img"
								src="${pageContext.request.contextPath}/img/no-photo.png"
								width="110px" height="110px" style="display: inline;">
							</label>
						</div>
						<input id="board_file3" name="board_file3" type="file">
					</div>
					<c:if test="${user.id!=null }">
						<input type="submit" value="글쓰기" class="primary" onclick="send()"
							id="ssssdd" />
					</c:if>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
<script>
	let page = "${pageContext.request.contextPath}"
</script>
<script>
	$(".files")
			.change(
					function(e) {
						let file = e.target.files[0];
						let filesArr = Array.prototype.slice.call(file);

						let img = $(this).find("img");

						if (!file.type.match("image.*")) {
							img
									.attr("src",
											"${pageContext.request.contextPath}/img/noImage.png");
						} else {
							let reader = new FileReader();
							reader.onload = function(e) {
								img.attr("src", e.target.result)
							}
							reader.readAsDataURL(file);
						}
					})
</script>
</html>