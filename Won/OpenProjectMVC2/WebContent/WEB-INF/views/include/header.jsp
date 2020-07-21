<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ page import="java.sql.*"%>
<h1 id="header">Open Project</h1>

<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">임시</h3>
		</div>
	 <li class="list-group-item"><a href="${pageContext.request.contextPath}/member/memberRegForm.do">회원가입</a></li>

	 <li class="list-group-item"><a href="<c:url value="/member/memberList.do"/>">회원 리스트</a></li>

	<c:if test="${empty info}">
		 <li class="list-group-item"><a href="<c:url value="/member/memberLogin.do"/>">로그인</a></li>
	</c:if>
	<c:if test="${!empty info}">
		 <li class="list-group-item"><a href="<c:url value="/member/memberLogout.do"/>">로그아웃</a></li>
	</c:if>

	 <li class="list-group-item"><a href="<c:url value="/member/memberMypage.do"/>">마이페이지</a></li>
</div>
	
	<!-- 패널 타이틀(optional) -->
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">게시판</h3>
		</div>
		<!-- 메뉴목록 -->
  <ul class="list-group">
   <li class="list-group-item"><a href="<c:url value="/board/sellerBoard.do"/>">판매게시판</a></li>
   <li class="list-group-item"><a href="<c:url value="/board/buyerBoard.do"/>">구매게시판</a></li>
   <li class="list-group-item"><a href="<c:url value="/board/temp.do"/>">게시판(임시)</a></li>
  </ul>
</div>
<!-- 
</ul>


 -->



