<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/default.css" rel="stylesheet">

</head>
<body>

	<%@include file="/include/header.jsp"%>
	<div class="container">
		<h1>방명록(비회원) 페이지</h1><hr>
	</div>
	
	
	<%@ include file="list_view.jsp" %>
	
	<%@include file="/bootstrap/ex/ex01.jsp" %>
	<%@include file="/include/footer.jsp"%>
</body>
</html>