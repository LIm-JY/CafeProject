<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INDEX</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<style>
</style>

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
			<div class="col-md-4">
				<h1>판매게시판</h1>
				<table class="table table-sm">
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>대분류</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:if test="${sortedSellerArticles ne null}">
						<tbody>
							<c:forEach items="${sortedSellerArticles.articleList}" var="at">
								<tr>
									<td>${at.idx}</td>
									<td>${at.user_id}</td>
									<td>${at.item_category}</td>
									<td>
										<a href="<c:url value="#"/>">${at.title}</a>
									</td>
									<td>${at.reg_date}</td>
									<td>${at.view_count}</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
					<c:if test="${sortedSellerArticles eq null}">
						<tr>
							<td>
								<h1>출력 할 게시물이 없습니다!</h1>
							</td>
						</tr>
					</c:if>
				</table>
				
			</div>
			<div class="col-md-4">
				<h1>구매게시판</h1>
				<table class="table table-sm">
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>대분류</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:if test="${sortedBuyerArticles ne null}">
						<tbody>
							<c:forEach items="${sortedBuyerArticles.articleList}" var="at">
								<tr>
									<td>${at.idx}</td>
									<td>${at.user_id}</td>
									<td>${at.item_category}</td>
									<td>
										<a href="<c:url value="#"/>">${at.title}</a>
									</td>
									<td>${at.reg_date}</td>
									<td>${at.view_count}</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
					<c:if test="${sortedBuyerArticles eq null}">
						<tr>
							<td>
								<h1>출력 할 게시물이 없습니다!</h1>
							</td>
						</tr>
					</c:if>
				</table>
			
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>









