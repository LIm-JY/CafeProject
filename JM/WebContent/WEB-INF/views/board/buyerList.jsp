<%@page import="login.LoginInfo"%>
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
<body><%@ include
		file="/WEB-INF/views/include/navigationTest.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<!-- 3단길이의 첫번째 열 -->
			<div class="col-md-2">
				<%@ include file="/WEB-INF/views/include/header.jsp"%>
			</div>
			<!-- 9단길이의 첫번째 열 -->
			<div class="col-md-10">
				s
				<c:if test="${empty info}">
					<script>
						alert('로그인이 필요합니다');
					</script>
				</c:if>
				<c:if test="${!empty info}">
					<h1>구매게시판</h1>
					<%@ include file="/WEB-INF/views/board/list.jsp"%>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>