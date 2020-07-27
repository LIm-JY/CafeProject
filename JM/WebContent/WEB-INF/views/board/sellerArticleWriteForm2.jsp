<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 게시판 - 매물 등록</title>
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
				<h1>매물 등록</h1>
				<hr>
				<form method="post" enctype="multipart/form-data"
					action="<c:url value="/board/sellerArticlWriteResult.do"/>">
					<!-- The toolbar will be rendered in this container. -->
					<div id="toolbar-container"></div>

					<!-- This container will become the editable. -->
					<textarea name="content" id="editor" rows="15">
					</textarea>
				</form>
			</div>
			<div class="col-md-1">
				<!-- Null Area -->
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script src="https://cdn.ckeditor.com/ckeditor5/20.0.0/classic/ckeditor.js"></script>
<script>
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        } );
</script>
</html>