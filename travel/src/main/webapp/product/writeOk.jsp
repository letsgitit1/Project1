<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${result != 1 }">
		<script>
			alert('작성실패!');
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('작성성공!');
			location.href='detail?pno=${vo.pno}';
		</script>
	</c:otherwise>
</c:choose>