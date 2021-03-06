<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제결과</title>
<link rel="stylesheet" href="/css/default.css">
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
			<div class="col-md-8">
				<c:if test="${deleteResult eq 0}">
					<h1>게시글 삭제가 <font style="color: red;">실패</font>하였습니다.</h1>
					<h3>상세 사유는 관리자에게 문의해주세요.</h3>
					<p><a href="<c:url value="/board/sellerBoard.do"/>">돌아가기</a></p>
				</c:if>
				<c:if test="${deleteResult eq 1}">
					<script type="text/javascript">
						console.log(${deleteResult} + " 삭제가 정상적으로 되었습니다.");
					</script>
					<c:redirect url="<c:url value="/board/sellerBoard.do"/>"/>
				</c:if>
			</div>
			<div class="col-md-1">
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>