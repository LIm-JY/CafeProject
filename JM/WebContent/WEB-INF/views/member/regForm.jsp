<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INDEX</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">

<style>
.check_ok {
	color: blue;
}

.check_not {
	color: red;
}

#idchk {
	display: none;
}
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
			<div class="col-md-9">
				<div style="">
					<h1 class="subtitle">회원 가입</h1>
					<hr>
					<form id="regForm" action="memberReg.do" method="post"
						enctype="multipart/form-data">
						<table>
							<tr>
								<td>아이디(email)</td>
								<td><input type="email" name="uid" id="uid"> <span
									id="checkmsg"></span> <input type="checkbox" name="idchk"
									id="idchk"></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="upw" required></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="uname" required></td>
							</tr>
							<tr>
								<td>닉네임</td>
								<td><input type="text" name="nickname" required></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email" required></td>
							</tr>
							<tr>
								<td>연락처</td>
								<td><input type="text" name="contact" required></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" name="address" required></td>
							</tr>
							<tr>
								<td>사진</td>
								<td><input type="file" name="photo"></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" name="회원가입"> <input
									type="reset"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script type="text/javascript" src="<c:url value="/js/regform.js" />">
</script>
</html>









