<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 테스트</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<!-- <script language="javascript">
	// 자바 스크립트 시작

	function Insert() {
		var insertFrm = document.insertFrm;
		if (!insertFrm.board_title.value) {
			alert("글제목을 적어주세요");
			insertFrm.board_title.focus();
			return;
		}

		if (!insertFrm.board_content.value) {
			alert("글내용을 적어주세요");
			insertFrm.board_content.focus();
			return;
		}

		insertFrm.submit();
	}
</script> -->

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
				<form name="insertFrm" id="insertFrm" action="/board/tempService.do">
<%-- 				<form name="insertFrm" id="insertFrm" action="<%=request.getContextPath() %>/WEB-INF/views/temporary/insert.jsp"> --%>
					<table class="body">
						<tr>
							<th>글제목</th>
							<td><input type="text" id="board_title" name="board_title"></td>
						</tr>
						<tr>
							<th>글내용</th>
							<td><textarea id="board_content" name="board_content"></textarea></td>
						</tr>
					</table>
				</form>
				<div class="Btn">
				</div>
			</div>
		</div>

		<!-- <div class="container">

		index
	</div> -->

		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
