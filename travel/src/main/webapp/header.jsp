<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html>
    <html lang="ko" class="no-js">
    <head>
	<meta charset="UTF-8">
<link
     rel="stylesheet"
     href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
     integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
     crossorigin="anonymous"
     referrerpolicy="no-referrer"/>
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath }/css/header.css" rel="stylesheet"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
	</head>  
<style>
.search_icon_img{
	width: 16px;
    transform: translateY(3px);
    margin-right: 5px;
    margin-left: 20px;
    margin-right: 10px;
}
	#searchdiv {
		margin-top: 90px;
    width: 680px;
    position: relative;
	}
	#searchinfo {
	width: 662px;
    list-style: none;
    background-color: #ffffff8c;

    position: absolute;
    right: 57px;
    top: -8px;
	}
	
	.itemli {
	    position: relative;
    	z-index: 1;
	}
	.itemli:first-child{
		margin-top:20px;
	}
	.itemli a {
		text-decoration: none;
		color: black;
	}
</style>
<header>
  <div id="main_header_logo">
    <a href="${pageContext.request.contextPath }"><div id="main_header_img"></div></a>
  </div>
  <div id="hader_search_bar">
    <div class="container_1">
      <input
        type="search"
        name="header_search"
        id="search"
        placeholder="Search.."/>
    </div>
    <div id="searchdiv">
       <ul id="searchinfo">
       
       </ul>
    </div>
  </div>

        <script>let conpathh = "${pageContext.request.contextPath}"</script>
<script>
$("#search").on('keyup', function() {
   checkSearch($(this).val());
});

function checkSearch(val) {
   if(val == "" || val == " ") {
      $('#searchinfo').children().remove();
   }
   $.ajax({
      url: conpathh + "/checksearch?key=" + val,
      type: "get",
      dataType: "json",
      success: function(result) {
         $('#searchinfo').children().remove();
         let item = result.item;
         let li = "";
         for(let e of item) {
            li += "<li class='itemli'>"
            li += "<img src='${pageContext.request.contextPath}/img/searchIcon.png' class='search_icon_img'/><a href='${pageContext.request.contextPath}/product/detail?pno=" + e.pno + "'>";
            li += "[" + e.address + "] " + e.pname + "</a>";
            li += "</li><br>";
         }         
         $("#searchinfo").append(li);
      },
      error: function() {
         console.log('실패');
      }
   })
}
</script>
   
  <nav class="cd-main-nav ">
  <div id="main_header_info">
    <a href="${pageContext.request.contextPath }">
    <div class="main_header_info_icon" id="info_icon1"></div>
      <div class="main_header_info_text"  onmouseover="this.innerHTML='홈'" onmouseout="this.innerHTML='Home'">Home</div>
    </a>
    <a href="${pageContext.request.contextPath }/ask1v1">
    <div class="main_header_info_icon" id="info_icon2"></div>
      <div class="main_header_info_text"  onmouseover="this.innerHTML='더보기'" onmouseout="this.innerHTML='More'">More</div>
    </a>
   	<c:if test="${user.id!=null }">
    <a href="${pageContext.request.contextPath }/my/mypage">
    <div class="main_header_info_icon" id="info_icon3"></div>
      <div class="main_header_info_text" onmouseover="this.innerHTML='마이페이지'" onmouseout="this.innerHTML='MyPage'">MyPage</div>
    </a></c:if>
    
    	<c:if test="${user.id==null }">
    <a href="${pageContext.request.contextPath }/fail2.jsp">
    <div class="main_header_info_icon" id="info_icon3"></div>
      <div class="main_header_info_text" onmouseover="this.innerHTML='마이페이지'" onmouseout="this.innerHTML='MyPage'">MyPage</div>
    </a></c:if>
    <!-- -------------------------로그인 모달------------------------- -->
    
         <c:if test="${sessionScope.user==null && sessionScope.user1==null}">
     <a class="cd-main-nav__item cd-main-nav__item--signin" href="#" data-signin="login">
    <div class="main_header_info_icon" id="info_icon4"></div>
   	<div class="btn btn-primary" data-toggle="modal" data-target="#myModal">
      <div class="main_header_info_text" id="asd" onmouseover="this.innerHTML='로그인'" onmouseout="this.innerHTML='Login'" >Login</div>
      </div>
      </c:if>
      
      
      
      <c:if test="${sessionScope.user!=null}">
      <a class="cd-main-nav__item cd-main-nav__item--signin" href="#" data-signin="login">
    <div class="main_header_info_icon" id="info_icon5"></div>
    	<div class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                    <div class="main_header_info_text" id="asd" onmouseover="this.innerHTML='Logout'" onmouseout="this.innerHTML='로그아웃'" onclick="Logout()">Logout </div>
                    </div>
                    </a>
                      </c:if>
                    <script>
                    function Logout() {
                    	const path="${pageContext.request.contextPath }";
                    	//const ask = ${pageContext.request.contextPath};
                    	location.href=path+"/logout";
                    }
                    </script>
      <c:if test="${sessionScope.user1.id!=null}">
       <a class="cd-main-nav__item cd-main-nav__item--signin" href="#" data-signin="login">
       <div class="main_header_info_icon" id="info_icon5"></div>
      <div class="btn btn-primary" data-toggle="modal" data-target="#myModal">
      <form action="apiLogout" method="GET" id="apifom">
      <div class="main_header_info_text" id="asd" onmouseover="this.innerHTML='Logout'" onmouseout="this.innerHTML='Logout'" onclick="kakaoLogout('8660378ccb077720965e390bfdbd757f')">Logout</div>
                        </form>
                        </div>
                        </a>
                        </c:if>
      <script>
         function kakaoLogout(kakaokey){
            /* Kakao.init(kakaokey); */
            Kakao.isInitialized();
            if(!Kakao.Auth.getAccessToken()){ //토큰이 있는지 확인
               console.log('Not logged in');
               return;
            }
            Kakao.Auth.logout(function(){
               console.log(Kakao.Auth.getAccessToken());
               document.forms['apifom'].submit();
               location.href="https://kauth.kakao.com/oauth/logout?client_id=b477900977080b3092f56703eb12dba3&logout_redirect_uri=http://localhost:8082/travel/apiLogout";
            })
         }
</script>
       <!-- The Modal -->
  <div class="modal fade" id="myModal" style="display:none;">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
       <main id="app">
        <div class="modal-header">
          <h3 class="modal-title">로그인</h3>
          <button type="button" class="close " data-dismiss="modal">×</button>
        </div>
        <!-- Modal body -->
        
        <div class="modal-body">
    <section class="user-input">
      <form action="${pageContext.request.contextPath }/login" method="POST"> 
      <label for="id"></label>
      <input class="inp-id" type="text" id="id" required placeholder="아이디" name="id">
      <label for="pw"></label>
      <input class="inp-pw" type="password" id="pw" required placeholder="비밀번호" name="pw">
      <button class="log-btn">로그인</button>
      </form>

      <ul class="join-find">
        <a data-toggle="modal" data-target="#SignupModal">회원가입</a>
      </ul>
    </section>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
           <section class="other-log">
      <h3 class="blind">간편 로그인</h3>
      <div class="other-btn">
        <a class="log-glg btn glg" href="https://www.google.com" target="_blank">
          <img src="${pageContext.request.contextPath }/img/Google.png" alt="">
          <div class="log-txt">구글 계정으로 로그인</div></a>

        <a class="log-face btn face" href="https://www.facebook.com" target="_blank">
          <img src="${pageContext.request.contextPath }/img/facebook.png" alt="">          
          <div class="log-txt">페이스북 계정으로 로그인</div></a>

        <a class="log-naver btn naver" href="https://www.naver.com" target="_blank">
          <img src="${pageContext.request.contextPath }/img/naver.png" alt="">          
          <div class="log-txt">네이버 계정으로 로그인</div></a>

        <a class="log-kao btn kao" target="_blank" style="cursor:pointer;">
  <img src="${pageContext.request.contextPath }/img/message.png" alt="" >
  <div class="log-txt" id="login-btn">카카오톡 계정으로 로그인</div>
</a>

<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
  Kakao.init('8660378ccb077720965e390bfdbd757f');
  console.log(Kakao.isInitialized());

  // Add click event listener to login button
  document.getElementById('login-btn').addEventListener('click', function() {
    // Call Kakao.Auth.login() to initiate login process
    Kakao.Auth.login({
      success: function(obj) {
        console.log(obj);
        Kakao.Auth.setAccessToken(obj.access_token);
        console.log(obj.access_token);
        login();
      },
      fail: function(err) {
        console.log(err);
      }
    });
  });

  function login() {
    Kakao.API.request({
      url: '/v2/user/me',
      success: function(res) {
        console.log(res);
        let email = res.kakao_account.email;
        let id = res.id;
        let name = res.properties.nickname;
        console.log(email + ", " + id + ", " + name);

        // Create a new form element and append the input fields
        let form = document.createElement('form');
        form.action = 'apiLogin';
        form.method = 'post';

        let idInput = document.createElement('input');
        idInput.type = 'hidden';
        idInput.name = 'apiId';
        idInput.value = id;
        form.appendChild(idInput);

        let emailInput = document.createElement('input');
        emailInput.type = 'hidden';
        emailInput.name = 'apiEmail';
        emailInput.value = email;
        form.appendChild(emailInput);

        let nameInput = document.createElement('input');
        nameInput.type = 'hidden';
        nameInput.name = 'apiName';
        nameInput.value = name;
        form.appendChild(nameInput);

        let pwInput = document.createElement('input');
        pwInput.type = 'hidden';
        pwInput.name = 'apiPassword';
        pwInput.value = id + '159#';
        form.appendChild(pwInput);

        // Append the form to the document and submit it
        document.body.appendChild(form);
        form.submit();
      }
    });
  }
</script>


   
          
   
      </div>
    </section>
  </main>
        </div>
        
      </div>
    </div>
  </div>
   <!-- -------------------------로그인 모달 끝------------------------- -->
   <!-- -------------------------회원가입 모달------------------------- -->


       <!-- The Modal -->
  <div class="modal fade" id="SignupModal" style="display:none;">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
       <main id="app">
        <div class="modal-header">
          <h3 class="modal-title">회원가입</h3>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
          <!-- Modal body -->
        
        <div class="modal-body">
    <section class="user-input">
      <form action="${pageContext.request.contextPath }/reg" method="POST"> 
      <label for="id"></label>
      <input class="inp-id" type="text" id="name"  placeholder="이름" name="name">
      <label for="id"></label>
      <input class="inp-id" type="text" id="checkid"  placeholder="아이디" name="id">
      <label for="pw"></label>
      <input class="inp-pw" type="password" id="pw"  placeholder="비밀번호" name="pw">
      <label for="id"></label>
      <input class="inp-id" type="text" id="phone"  placeholder="전화번호" name="phone" oninput="autoHyphen2(this)">
      <label for="id"></label>
            <input type="radio" name="gender" id="lblMale"> <label
               for="lblMale">남성</label> <input type="radio" name="gender"
               id="lblFemale"> <label for="lblFemale">여성</label>
               <br>
               <br>
      
      <button type="button" class="log-btn" onclick="func_reg()">회원가입</button>
      <span  id="idcheck"> </span>
    </section>
        </div>
      </form>
      <script>
      const autoHyphen2 = (target) => {
    	  target.value = target.value
    	    .replace(/[^0-9]/g, "") //공백 제거 ^안에있으면 0-9 아닌 값
    	    .replace(/^(\d{3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3") //전화번호 부분
    	    //d는 숫자로 시작
    	    //{0,4}은 숫자로만 4자리 0은 시작 지점 ex) 2로 바꾸면 두 번째 자리 칠 때 부터 가능
    	    // 두 번째 replace는 -붙혀주는거
    	    .replace(/(\-{1,2})$/g, ""); //
    	};
      </script>
     
        <!-- Modal footer -->
        <div class="modal-footer">
           <section class="other-log">
      <h3 class="blind">다른계정으로 회원가입</h3>
      <div class="other-btn">
        <a class="log-glg btn glg" href="https://www.google.com" target="_blank">
          <img src="${pageContext.request.contextPath }/img/Google.png" alt="">
          <div class="log-txt">구글 계정으로 회원가입</div></a>

        <a class="log-face btn face" href="https://www.facebook.com" target="_blank">
          <img src="${pageContext.request.contextPath }/img/facebook.png" alt="">          
          <div class="log-txt">페이스북 계정으로 회원가입</div></a>

        <a class="log-naver btn naver" href="https://www.naver.com" target="_blank">
          <img src="${pageContext.request.contextPath }/img/naver.png" alt="">          
          <div class="log-txt">네이버 계정으로 회원가입</div></a>

        <a class="log-kao btn kao" href="https://www.kakaocorp.com" target="_blank">
          <img src="${pageContext.request.contextPath }/img/message.png" alt="" >
          <div class="log-txt">카카오톡 계정으로 회원가입</div></a>
      </div>
    </section>
  </main>
        </div>
        
      </div>
    </div>
   <!-- -------------------------회원가입 모달 끝------------------------- -->
    </nav>
</header>
      <script>let conp = "${pageContext.request.contextPath}"</script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/reg.js"></script> 
