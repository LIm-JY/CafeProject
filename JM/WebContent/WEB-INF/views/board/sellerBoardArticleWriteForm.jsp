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
			<!-- 9단길이의 첫번째 열 -->
			<div class="col-md-9">
				<h1>매물 등록</h1>
				<hr>
				<form action="post" target="/board/sellerBoardArticlWriteResult.do">
					<table>
						<thead>
							<tr>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
							</tr>
						</tbody>
					</table>
					<input type="submit" value="작성하기">
					<input type="reset" value="초기화">
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>