<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<meta charset="utf-8">



<ul class="list-unstyled components mb-5">
<li class="active">
<!-- <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">홈</a> -->

<ul class="collapse list-unstyled" id="homeSubmenu">
</ul>

<li>
<a href="${pageContext.request.contextPath}/">홈</a>
</li>

<li>
<a href="${pageContext.request.contextPath}/member/memberRegForm.do">회원가입</a>
</li>
<li>
<a href="<%=request.getContextPath() %>/member/memberList.do">회원리스트</a>
<%-- <a href="<c:url value="/member/memberList.do"/>">List</a> --%>
</li>
<li>
	<c:if test="${empty info}">
		<a href="<%=request.getContextPath() %>/member/memberLogin.do"/>로그인</a>
	</c:if>
	<c:if test="${!empty info}">
		<a href="<%=request.getContextPath() %>/member/memberLogout.do"/>로그아웃</a>
	</c:if>
</li>
<li>
<a href="<%=request.getContextPath() %>/member/memberMypage.do"/>마이페이지</a>
</li>
</li>
<li>
<a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">게시판</a>
<ul class="collapse list-unstyled" id="pageSubmenu">
 <a href="<%=request.getContextPath() %>/board/buyerBoardForm.do"/>구매게시판</a>
<%--  <a href="<%=request.getContextPath() %>/board/buyerBoard.do"/>구매게시판</a> --%>
   <a href="<%=request.getContextPath() %>/board/sellerBoard.do"/>판매게시판</a>
   <a href="<%=request.getContextPath() %>/board/temp.do"/>임시게시판</a>
</ul>
</li>
</ul>