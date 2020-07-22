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
			<div class="col-md-2">
				<%@ include file="/WEB-INF/views/include/header.jsp"%>
			</div>
			<!-- 9단길이의 첫번째 열 -->
			<div class="col-md-10">
				<h1>판매게시판</h1>
				<table class="table table-boderless">
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>대분류</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:if test="${sortArticles ne null}">
						<tbody>
							<c:forEach items="${sortArticles.articleList}" var="at">
								<tr>
									<td>${at.idx}</td>
									<td>${at.user_id}</td>
									<td>${at.item_category}</td>
									<td>
										<a href="<c:url value="/board/sellerBoardViewer.do"/>?idx=${at.idx}">${at.title}</a>
									</td>
									<td>${at.reg_date}</td>
									<td>${at.view_count}</td>
								</tr>
							</c:forEach>	
						</tbody>
					</c:if>
					<c:if test="${sortArticles eq null}">
						<tr>
							<td>
								<h1>출력 할 게시물이 없습니다!</h1>
							</td>
						</tr>
					</c:if>
				</table>
				<c:if test="${sortArticles ne null}">
					<div style="float: right; padding-right: 20%">
						<button>글 작성</button>
					</div>
					<br>
					<br>
					<div style="padding-left: 50%">
					<c:forEach begin="1" end="${sortArticles.pageTotalCount}" var="num">
						<a href="sellerBoard.do?pNum=${num}">${num}</a>
					</c:forEach>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>