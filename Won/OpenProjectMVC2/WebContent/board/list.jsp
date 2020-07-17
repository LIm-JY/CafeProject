<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">

<style>
</style>
</head>
<body>

	<%@ include file="/include/header.jsp" %>

	<div class="container">
		<h1>게시판</h1>
	</div>

	<%@ include file="/include/footer.jsp" %>
</body>
</html>

