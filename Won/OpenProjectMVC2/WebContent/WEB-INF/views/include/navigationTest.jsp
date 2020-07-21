<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

    <!-- 부트스트랩 -->
<!--     <link href="../css/bootstrap.min.css" rel="stylesheet">
 -->    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- <nav class="navbar navbar-dark bg-dark">
 -->
 
 </head>
 <body>
 
<nav class="navbar navbar-inverse">
 <div class="container-fluid">
 <div class="navbar-header"><a class="navbar-brand" href="${pageContext.request.contextPath}/index.do">Open Project</a></div>
 <div class="container">
 <ul class="nav navbar-nav">
<%--  	<li class="nav-item"><a class="nav-link active" href="<%=request.getContextPath() %>/member/memberRegForm.jsp">회원가입</a></li>
 --%> 	
 
  <c:if test="${empty loginInfo}">
 <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/member/memberRegForm.do">회원가입</a></li>
</c:if>
 <c:if test="${!empty loginInfo}">
 <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/member/memberRegFormAfterLogin.jsp">회원가입</a></li>
</c:if>


 <c:if test="${empty loginInfo}">
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/memberLoginForm.do">로그인</a></li>
</c:if>
 <c:if test="${!empty loginInfo}">
<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout.jsp">로그아웃</a></li>
</c:if>
<%-- 	<%
	if(loginOrNot){
		%>
		<li><a href="<%=request.getContextPath() %>/member/loginForm.jsp">로그인</a></li>
		<%
	}else{
		%>
		<li><a href="<%=request.getContextPath() %>/member/logout.jsp">로그아웃</a></li>
		<%
	}
	%> --%>
	<c:if test="${!empty loginInfo}">
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/memberMyPage.do">마이페이지</a></li>
	</c:if>
	<c:if test="${empty loginInfo}">
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/memberMyPage.do">마이페이지</a></li>
	</c:if>
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/memberGuest.do">방명록(비회원)</a></li>
	
	<c:if test="${!empty loginInfo}">
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/memberList.do">방명록(회원제)</a></li>
	</c:if>
	<c:if test="${empty loginInfo}">
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/memberList.do">방명록(회원제)</a></li>
	</c:if>
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/memberListPrint.do">회원목록</a></li>
</ul>



</div>
</nav>


    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>