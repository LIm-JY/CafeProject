<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">

<style>

</style>

</head>
<body>


     	<%@ include file="/WEB-INF/views/include/navigationTest.jsp" %>
     
  <div class="container-fluid">
    <div class="row">
     <!-- 3단길이의 첫번째 열 -->
      <div class="col-md-2">
     <%@ include file="/WEB-INF/views/include/header.jsp" %>
      </div>
      <!-- 9단길이의 첫번째 열 -->
      <div class="col-md-10">
	로그인 실패

      </div>
     </div>
	
	<!-- <div class="container">

		index
	</div> -->

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
<script>alert("로그인 정보가 일치하지 않습니다.")</script>









