<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
      integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="${pageContext.request.contextPath }/css/index.css" rel="stylesheet" />
</head>
<%@ include file="./header.jsp" %>
<body>
    <!--header끝-->
    <!--main 시작-->
    <main id="list_main_product">
      <!--banner-->
      <div id="container">	
        <section id="banner">
        <i class="fa-solid fa-chevron-right" id="prevBtn" ></i>
          <div id="bannerBox">
            <ul>
              <li class="banner_item"></li>
              <li class="banner_item"></li>
              <li class="banner_item"></li>
            </ul>
          </div>
          <i class="fa-solid fa-chevron-right" id="nextBtn" ></i>
        </section>
      </div>
      <!--banner끝-->
      <div id="main_item_category">
        <ul id="main_item_cateogry_ul">
          <li class="main_category">
          <a href="product/list2?pcategory=Hotel">
            <div class="category_img"></div>
            <div class="category_text">Hotel</div>
            </a>	
          </li>
          <li class="main_category">
          <a href="product/list2?pcategory=Motel">
            <div class="category_img"></div>
            <div class="category_text">Motel</div>
            </a>
          </li>
          <li class="main_category">
          <a href="product/list2?pcategory=Camping">
            <div class="category_img"></div>
            <div class="category_text">Camping</div>
            </a>
          </li>
          <li class="main_category">
          <a href="product/list2?pcategory=Pension">
            <div class="category_img"></div>
            <div class="category_text">Pension</div>
            </a>
          </li>
        </ul>
      </div>
      <!--category끝-->
      <!--second_Banner 시작-->
      <div id="main_second_banner">
        <div id="second_banner_area">
          <div id="first_banner"></div>
          <div id="second_banner"></div>
        </div>
      </div>
      <!--second_Banner 끝-->
      <!--main_content시작-->
      <div id="main_content">
        <div class="main_content_item">
          <div class="content_main">
            <div class="content_main_text">갈매기와 함께 떠나는 부산여행!</div>
            <div class="content_main_img"></div>
          </div>
          <div id="content_sub">
            <div class="content_sub_item">
              <div class="content_sub_img"></div>
              <div class="content_sub_detail">
                <p>뷰먼트 풀빌라</p>
                <br />
                <p>#서면 #부산으로 여행</p>
                <br />
                <p>78900 <span>원</span></p>
              </div>
            </div>
            <div class="content_sub_item">
              <div class="content_sub_img"></div>
              <div class="content_sub_detail">
                <p style="font-size: 18px;">마린 케이풀빌라 펜션</p>
                <br />
                <p>#문래동 #수영장 준비</p>
                <br />
                <p>90900<span>원</span></p>
              </div>
            </div>
            <div class="content_sub_item">
              <div class="content_sub_img"></div>
              <div class="content_sub_detail">
                <p style="font-size: 20px">송정 스카이 풀빌라</p>
                <br />
                <p>#서면 #부산으로가장</p>
                <br />
                <p>59900 <span>원</span></p>
              </div>
            </div>
          </div>
        </div>
        <!--두번째 메인아이템-->
        <div class="main_content_item">
          <div class="content_main">
            <div class="content_main_text">벚꽃 구경하러 서울로와!</div>
            <div class="content_main_img" id="content_main2"></div>
          </div>
          <div id="content_sub2">
            <div class="content_sub_item">
              <div class="content_sub_img"></div>
              <div class="content_sub_detail">
                <p>뷰먼트 풀빌라</p>
                <br />
                <p>#명동 #서울로 벚꽃구경</p>
                <br />
                <p>129900 <span>원</span></p>
              </div>
            </div>
            <div class="content_sub_item">
              <div class="content_sub_img"></div>
              <div class="content_sub_detail">
                <p style="font-size: 18px" ;>마린 케이풀빌라 펜션</p>
                <br />
                <p>#강남 #먹거리 많음</p>
                <br />
                <p>29900<span>원</span></p>
              </div>
            </div>
            <div class="content_sub_item">
              <div class="content_sub_img"></div>
              <div class="content_sub_detail">
                <p style="font-size: 20px">송정 스카이 풀빌라</p>
                <br />
                <p>#서면 #부산으로가장</p>
                <br />
                <p>78900 <span>원</span></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <%@ include file="footer.jsp" %>
    <script src="js/banner.js"></script>
  </body>
</html>