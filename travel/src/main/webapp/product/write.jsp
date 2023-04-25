<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Administrator's Accommodation Registration Page</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <style>
  h1 {
  text-align: center;
  color: #333;
}

form {
  width: 800px;
  margin: 0 auto;
}

label {
  display: block;
      font-size: 20px;
  margin-bottom: 5px;
}

input[type="text"],
input[type="number"],
select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-bottom: 10px;
}

input[type="file"] {
  margin-bottom: 20px;
}

input[type="submit"] {
  background-color: #9d9d9dee;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}
#imageEx{
	display:flex;
	flex-wrap:wrap;
}

input[type="submit"]:hover {
  background-color: #3c9ac2d9;
}
#postcodify_search_button{
    width: 50px;
    height: 25px;
    font-size: 16px;
    transform: translateY(-2px);
    color: #fff;
    background-color: #79c2e1;
    border: none;
    border-radius: 4px;
  }
.files img {
    transform: translate(0px, 29px);
    width: 120px;
    height: 120px;	
}  

  </style>
  <body style="margin-top:120px;">
  <%@ include file="../header.jsp" %>
    <h1>관리자 숙소 등록 페이지</h1>
    <form action="write" method="POST" enctype="multipart/form-data">
      <label for="name">숙소 이름</label>
      <input type="text" id="Aname" name="pname" required><br><br>

      <label for="price">숙소 가격</label>
      <input type="number" id="Aprice" name="price" required><br><br>

      <label for="rooms">숙소 방 개수</label>
      <input type="number" id="roomcnt" name="roomcnt" required><br><br>
		
      <label for="address" style="display:inline-block">주소</label>
      <button type="button" id="postcodify_search_button">검색</button><br/>
      <input type="text" name="" class="postcodify_postcode5" value=""/>
      <input type="text" name="address" class="postcodify_address" value="" /><br/>
      <input type="text" name="" class="postcodify_details" value="" placeholder="상세 주소를 입력해주세요"/><br/>
      <input type="text" name="" class="postcodify_extra_info" value="" /><br/>

      <label for="type">숙소 타입</label>
      <select id="type" name="pcategory" required>
        <option value="">숙소 형태를 선택해 주세요</option>
        <option value="hotel">호텔</option>
        <option value="motel">모텔</option>
        <option value="camping">캠핑</option>
        <option value="pension">펜션</option>
      </select><br><br>

      <label for="images">숙소 이미지</label>
        <div id="imageEx">
 	<div class="files">
               <div class="div0">
                  <label for="board_file1" style="display: inline;"> <img
                     id="board_file3Img"
                     src="${pageContext.request.contextPath}/img/no-photo.png"
                     width="110px" height="110px" style="display: inline;">
                   <input type="file" name="productImage1" id="board_file1" class="maindiv_img" value=""></label>
               </div>
            </div>
            <div class="files">
               <div class="div0">
                  <label for="board_file1" style="display: inline;"> <img
                     id="board_file3Img"
                     src="${pageContext.request.contextPath}/img/no-photo.png"
                     width="110px" height="110px" style="display: inline;">
                   <input type="file" name="productImage2" id="board_file1" class="maindiv_img" value=""></label>
               </div>
            </div>
            <div class="files">
               <div class="div0">
                  <label for="board_file1" style="display: inline;"> <img
                     id="board_file3Img"
                     src="${pageContext.request.contextPath}/img/no-photo.png"
                     width="110px" height="110px" style="display: inline;">
                   <input type="file" name="productImage3" id="board_file1" class="maindiv_img" value=""></label>
               </div>
            </div>
            <div class="files">
               <div class="div0">
                  <label for="board_file1" style="display: inline;"> <img
                     id="board_file3Img"
                     src="${pageContext.request.contextPath}/img/no-photo.png"
                     width="110px" height="110px" style="display: inline;">
                   <input type="file" name="productImage4" id="board_file1" class="maindiv_img" value=""></label>
               </div>
            </div>
            <div class="files">
               <div class="div0">
                  <label for="board_file1" style="display: inline;"> <img
                     id="board_file3Img"
                     src="${pageContext.request.contextPath}/img/no-photo.png"
                     width="110px" height="110px" style="display: inline;">
                   <input type="file" name="productImage5" id="board_file1" class="maindiv_img" value=""></label>
               </div>
            </div>
            </div>
 	 <input type="submit" value="Upload File" name="submit">
	</form>

<script>
   $(".files").change(function(e) {
      let file = e.target.files[0];
      let filesArr = Array.prototype.slice.call(file);
      let img = $(this).find("img");

      if (!file.type.match("image.*")) {
         img.attr("src", "${pageContext.request.contextPath}/img/no-photo.png");
      } else {
         let reader = new FileReader();
         reader.onload = function(e) {
            img.attr("src", e.target.result)
         }
         reader.readAsDataURL(file);
      }
   })
   $(function() { $("#postcodify_search_button").postcodifyPopUp(); });
</script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
   $(".files").change(function(e) {
      let file = e.target.files[0];
      let filesArr = Array.prototype.slice.call(file);
      let img = $(this).find("img");

      if (!file.type.match("image.*")) {
         img.attr("src", "${pageContext.request.contextPath}/img/no-photo.png");
      } else {
         let reader = new FileReader();
         reader.onload = function(e) {
            img.attr("src", e.target.result)
         }
         reader.readAsDataURL(file);
      }
   })
   $(function() { $("#postcodify_search_button").postcodifyPopUp(); });
</script>
    <%@ include file="../footer.jsp" %>
  </body>
</html>
