<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	LoginInfo info = (LoginInfo) request.getAttribute("info");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매게시판</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">

<style>
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<c:if test="${empty info}">
		<script>
			alert('로그인이 필요합니다');
		</script>
	</c:if>
	<c:if test="${!empty info}">
		<h1>구매게시판</h1>
		<script>
			location.href('/index.do');
		</script>
	</c:if>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>