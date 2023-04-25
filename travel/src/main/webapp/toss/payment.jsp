<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/payment.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
</head>


<body>
	<%@ include file="../header.jsp"%>

	<section class="reservation-form">
		<h1 id="check_pay">확인 및 결제하기</h1>
		<div class="customer-info">
			<h3>예약자 정보</h3>
			<label for="name">예약자 이름</label><br> <input type="text"
				id="name" name="name" value="${mvo.name }" required> <br>
			<label for="email">이메일</label><br> <input type="email"
				id="email" name="email" value="${mvo.id }" required> <br>
			<label for="phone">핸드폰 번호</label><br> <input type="tel"
				id="phone" name="phone" value="${mvo.phone }" required> <br>
		</div>
		<div class="reservation-date">
			<h3>예약 날짜</h3>
			<label for="start-date" class="check_date">체크인:</label> <input
				type="text" id="start-date" name="start-date" value=""
				onchange="change()"> <label for="end-date"
				class="check_date">체크아웃:</label> <input type="text" id="end-date"
				name="end-date" value="" onchange="change()"> <br> <input
				type="hidden" id="nights" name="nights">
		</div>
		<!-- Reservation Details -->
		<div class="reservation-details">
			<div>
				<div id="reservation_detail_img">
					<img src="/product_img/${vo.photofiles[0] }"
						class="reservation_detail_item">
				</div>
				<div id="reservation-name" class="reservation_detail_item">
					<p>숙소 이름</p>
					<p>${vo.pname }</p>
				</div>
			</div>
			<div id="reservation_detail_text">
				<div id="check_inout">
					<p class="ddd sss">체크인</p>
					<p id="check_in_date" class="ddd"></p>
					<p class="ddd sss">체크아웃</p>
					<p id="check_out_date" class="ddd"></p>
					<p class="ddd sss">총 숙박일수</p>
					<p id="check_nights" class="ddd"></p>
				</div>

			</div>
			<div id="reservation_price">
				<p class="ddd sss" style="margin-top: 140px;">
					총 결제금액<span>(VAT포함)</span>
				</p>
				<p id="total_price">₩0</p>
			</div>

		</div>
		<div class="payment-method" style="clear: both;">
			<h3 class="payment_bottom">결제수단</h3>
			<select id="city">
				<option class="payment_bottom" name="method" value="카드">신용/체크카드</option>
				<option class="payment_bottom" name="method" value="가상계좌">가상계좌</option>
			</select>


			<!-- Submit Button -->
			<br>
			<button id="payment-button" class="payment_bottom">결제하기</button>
		</div>
	</section>
	<input type="hidden" value="${vo.price }" id="hiddenPrice">
	<!-- Payment Method -->

	<%@ include file="../footer.jsp"%>


	<script src="https://js.tosspayments.com/v1/payment"></script>
	<script>
	let endDate=new Date();
	let startDate=new Date();
	let timeDiff;
	let nightCount;
	let nightCountInput;
	let tprice=0;
	  function change() {
		const options = {
	  locale: 'ko-KR',
	  dateStyle: 'full'
		};
	const today2=new Date(startDateInput.value);
	const today3=new Date(endDateInput.value);
	const formattedDate2=today2.toLocaleDateString('ko-KR',options);
	const formattedDate3=today3.toLocaleDateString('ko-KR',options);

	  check_in.innerText=formattedDate2;
	  check_out.innerText=formattedDate3;
		 
	 startDate = new Date(startDateInput.value); 
	 endDate = new Date(endDateInput.value);
	   timeDiff = endDate.getTime() - startDate.getTime();
	   nightCount = Math.round(timeDiff / (1000 * 3600 * 24));
	   nightCountInput = document.getElementById('nights');
	  nightCountInput.value = nightCount;
	  check_nights.innerText=nightCount+'박';
	  tprice=hiddenPrice*nightCount;
		if(${type}=='1') {tprice=tprice/2
		}
	  let formattedPrice = tprice.toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' });
	  total_price.innerHTML=formattedPrice;
	  console.log(${type})
		console.log(tprice);
	};   
	//초기화
    let tossPayments = TossPayments("test_ck_4vZnjEJeQVxO9apBvMP3PmOoBN0k");
    let button = document.getElementById("payment-button");
	/**************변수설정**************()*/
    let orderId = new Date().getTime();
	let orderName="${vo.pname}";
	let pno="${vo.pno}";
	let mid="${user.id}";
	let customerName="${mvo.name}";
	console.log(tprice);
	/*********************************/
    button.addEventListener("click", function () {
      	let select_v=document.getElementById('city');
		if(city.options[select_v.selectedIndex].value==='카드'){
			tossPayments.requestPayment('카드', { // 결제 수단 파라미터
				  // 결제 정보 파라미터
				  amount: tprice,
				  orderId: orderId,
				  orderName: orderName,
				  customerName: customerName,
				  customerEmail:"moonnetworkqq@naver.com",
				  successUrl: 'http://localhost:8082/travel/toss/success?mid=' + mid + '&pno=' + pno + '&startDate=' + encodeURIComponent(startDate.toISOString())+'&endDate='+encodeURIComponent(endDate.toISOString())+'&nighCount='+nightCount,
				  failUrl: 'http://localhost:8082/travel/toss/fail.jsp',
				})
				
				.catch(function (error) {
				  if (error.code === 'USER_CANCEL') {
				    // 결제 고객이 결제창을 닫았을 때 에러 처리
				  } else if (error.code === 'INVALID_CARD_COMPANY') {
				    // 유효하지 않은 카드 코드에 대한 에러 처리
				  }
				})
		}
  
        
        if (city.options[select_v.selectedIndex].value === '가상계좌') {
        	tossPayments.requestPayment('가상계좌', { // 결제 수단 파라미터
        		  // 결제 정보 파라미터
        		amount: tprice,
        		  orderId: orderId,
        		  orderName: orderName,
        		  customerName: customerName,
        		  successUrl: 'http://localhost:8082/success?mid='+mid+'&pno='+pno,
        		  failUrl: 'http://localhost:8082/fail',
        		  validHours: 24,
        		  cashReceipt: {
        		    type: '소득공제',
        		  },
        		})
        		.catch(function (error) {
        		  if (error.code === 'USER_CANCEL') {
        		    // 결제 고객이 결제창을 닫았을 때 에러 처리
        		  } else if (error.code === 'INVALID_CARD_COMPANY') {
        		    // 유효하지 않은 카드 코드에 대한 에러 처리
        		  }
        		})
        }

    });
</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- Include jQuery UI -->
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
	<script src="../js/payment.js"></script>
</body>

</html>