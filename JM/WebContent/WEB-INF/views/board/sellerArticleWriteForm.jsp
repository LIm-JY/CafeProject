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
				<form method="post" enctype="multipart/form-data" action="<c:url value="/board/sellerArticlWriteResult.do"/>">
					<input type="hidden" name="user_id" value=""> 
					<div class="form-group">
						<label for="title">제목</label> 
						<input type="text" class="form-control" name="title" id="title" placeholder="제목">
					</div>
					<div class="form-group">
						<label for="item_category">물품 대분류</label> 
						<select class="form-control" name="item_category" id="item_category">
							<option value="가전제품">가전제품</option>
							<option value="컴퓨터/노트북/부품">컴퓨터/노트북/부품</option>
							<option value="태블릿/모바일기기">태블릿/모바일기기</option>
							<option value="아웃도어/스포츠">아웃도어/스포츠</option>
							<option value="자동차용품/공구">자동차용품/공구</option>
							<option value="가구/침구류">가구/침구류</option>
							<option value="유아용품">유아용품</option>
							<option value="식품">식품</option>
							<option value="생활/주방/건강용품">생활/주방/건강용품</option>
							<option value="패션/화장품">패션/화장품</option>
							<option value="사무용품">사무용품</option>
						</select>
					</div>
					<div class="form-group">
   						<label for="content">본문</label>
   						<textarea class="form-control" name="content" id="content" rows="15"></textarea>
 					</div>
 					<div class="form-group">
 						<label for="file_content">본문</label>
 						<input type="file" class="form-control" name="file_content" id="file_content">
 					</div>
 					<div class="form-group">
 						<div class="col-md-3" style="float: right;">
 							<input type="button" onclick="history.back()" class="form-control" id="reset" value="돌아가기">
 						</div>
 						<div class="col-md-3" style="float: right;">
 							<input type="submit" class="form-control" id="submit" value="작성하기">
 						</div>
 					</div>
				</form>
			</div>
			<div class="col-md-1">
				<!-- Null Area -->
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>