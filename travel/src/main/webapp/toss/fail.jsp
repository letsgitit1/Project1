<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// failUR에 반환되는 에러코드와 메시지 확인 
String code = request.getParameter("code");
String message = request.getParameter("message");

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>결제 실패</title>
    <meta charset="UTF8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

</head>
<body>
<section>
    <h1>결제 실패</h1>
    <p><%= message %></p>
    <span><%= code %></span>
</section>
</body>
</html>