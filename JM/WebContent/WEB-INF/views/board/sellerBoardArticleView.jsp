<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 게시판 - 게시글 조회</title>
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
			<!-- 8단길이의 첫번째 열 -->
			<div class="col-md-8">
				<c:if test="${article ne null}">
				<div class="form-group">
					<h1><label for="title">제목 : ${article.title }</label></h1>
				</div>
				<div class="form-group">
					<h2><label for="user_id">작성자 : ${article.user_id}</label></h2>
					<h3><label for="item_category">물품분류 : ${article.item_category}</label></h3>
				</div>
				<div class="form-group">
					<label for="content">본문</label>
					<textarea class="form-control" name="content" id="content"
						rows="15" disabled="disabled">${article.content}</textarea>
				</div>
				<div class="form-group">
					<label for="file_content">첨부파일</label>
					<c:if test="${article.file_content_addr ne null}">
						<c:forEach items="${article.file_content_addr}" var="files">
							<div>
								파일 : <a href="<c:url value="${files}" />">${files}</a>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<div class="form-group">
					<div class="col-md-2" style="float: right;">
						<input type="button" onclick="history.back()" class="form-control"
							id="reset" value="돌아가기">						
					</div>
					<div class="col-md-2" style="float: right;">
						<input type="button" onclick="deleteArticle()" class="form-control"
							id="reset" value="삭제하기">
					</div>
					<div class="col-md-2" style="float: right;">
						<input type="button" onclick="modifyArticle()" class="form-control"
							id="reset" value="수정하기">
					</div>
				</div>
				</c:if>
			</div>
			<div class="col-md-1">
				<!-- Null Area -->
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script type="text/javascript">
	function deleteArticle(){
			location.href = "<c:url value="/board/sellerArticleDeleteResult.do?idx=${article.idx}"/>";
	}
	
	function modifyArticle(){
		location.href = "<c:url value="/board/modifyArticle.do?idx=${article.idx}"/>";
	}
</script>
</html>