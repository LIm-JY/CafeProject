<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 게시판</title>
<link rel="stylesheet" href="<c:url value="/css/default.css"/>">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/navigationTest.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<!-- 3단길이의 첫번째 열 -->
			<div class="col-md-3">
				<%@ include file="/WEB-INF/views/include/header.jsp"%>
			</div>
			<!-- 9단길이의 첫번째 열 -->
			<div class="col-md-9">
				<h1>판매게시판</h1>
				<hr>
				<c:if test="${article ne null}">
					<div class="document_container">
						<div class="title_container" style="size: 80%">
							<div class="title_container_leftside" style="float: left; size: 35%">
								<div class="title_title">${article.title}</div>
								<div class="title_category">${article.item_category}</div>
								<div class="title_regdate">${article.reg_date}</div>
							</div>
							<div class="title_container_rightside" style="float: right; margin-right: 25%; size: 65%">
								<div class="">${article.view_count}</div>
							</div>
						</div>
						<div class="article_container" style="size: 80%">
							<div class="article_body">
								${article.content}
							</div>
						</div>
					</div>
				</c:if>
				
				<c:if test="${article eq null}">
					<hr>
					<h1>출력 할 게시물이 없습니다!</h1>
					<hr>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>