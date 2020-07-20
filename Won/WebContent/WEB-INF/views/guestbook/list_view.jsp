<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 게시판</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">

<style>

</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<div>
<%@ include file="/WEB-INF/views/guest/list.jsp" %>

	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>









