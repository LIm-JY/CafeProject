<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${articleList eq null }">
		<h1>
			게시판에 작성 된 게시글이 없습니다. 게시글을 작성해주세요!
		</h1>
	</c:if>
	<c:if test="${articleList ne null }">
		${articleList}
	</c:if>
</body>