/**
 * 
 */
 
 /** 
-회원번호 6자리 필수입력
-회원성명 필수입력
-회원전화번호 필수입력 -> 이후**정규표현식 적용도 테스트
-주소 필수입력
-가입일자 오늘날짜가 자동으로 8자리 표시
-고객등급은 A,B,C 중 하나만 허용
-도시코드 2자리 필수
form action ='list.html' 로 합시다.
제출은 hrd 폴더에 변경된 파일만 올리세요.
 */
let isValid = true;

$("#checkid").keyup( function(){
   let a = $("#checkid").val();
   if(a == ""){
      $("#idcheck").text("");
   }else{
      checkId(a);
   }
})

function checkId(val){
   $.ajax({
      url: conp + '/checkId?val=' + val,
      method: "post",
      dataType: "json",
      success: function(result){
         if(result == 0){
            $("#idcheck").text("아이디 사용가능합니다.");
            $("#idcheck").css("color", "green");
            isValid = true;
         }else{
            $("#idcheck").text("사용중인 아이디가 있습니다.");
            $("#idcheck").css("color", "red");
            isValid = false;
         }
      } ,
      error: function(){
         console.log("ㅗㅗ");
      }
   })
}


function func_reg()
{
   const frm = document.forms[1]
   const id = frm.id
   const name = frm.name
   const pw = frm.pw
   const phone = frm.phone
   const gender = frm.gender
   
   
   /*let retCustno = /^[0-9]{6}$/
   if(retCustno.test(custno.value)===false)
   {
      alert('회원번호는 숫자 6자리 입니다.')
      custno.focus()
      isValid = false
   }*/
   
   
   let regTel = /^010-[0-9]{4}-[0-9]{4}$/
   if(name.value=='')
   {
      alert('이름은 필수 입력입니다.')
      name.focus()
      isValid = false
   } else if(id.value==''){
      alert('전화번호는 필수 입력입니다.')
      id.focus()
      isValid = false
   }else if(pw.value==''){
      alert('주소는 필수 입력입니다.')
      pw.focus()
      isValid = false
   }else if(regTel.test(phone.value)===false){
      alert('전화번호 형식이 틀렸습니다.')
      phone.focus()
      isValid = false
   }
    if(isValid) {
      alert('회원가입에 성공했습니다.');
        frm.submit();
    }
    /*else 
   {alert('유효성 통과 실패!!!')}*/
}