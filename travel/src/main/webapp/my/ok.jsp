<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${result != 0}">
		<script>
			alert('회원수정이완료되었습니다');
			location.href="${pageContext.request.contextPath}/my/mypage";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('수정실패');
			history.back();
		</script>
	</c:otherwise>
</c:choose>