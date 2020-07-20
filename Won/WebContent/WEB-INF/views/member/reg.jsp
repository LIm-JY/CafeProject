<%@page import="member.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
Member member=(Member)request.getAttribute("member");
int result=(int)request.getAttribute("result");

if(member!=null && result>0){
	session.setAttribute("member",member);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="<c:url value="/css/default.css" />">

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

	<div>
		<h1 class="subtitle">회원 가입</h1>
		<hr>
		<h3>
		
		<c:if test="${result gt 0 && member ne null}">
			<div>
				회원가입 완료
			</div>
					<!-- request.setAttribute("member", member);
				request.setAttribute("result", resultCnt); -->
			${member}
		</c:if>
		
		<c:if test="${not (result gt 0 && member ne null)}">
			회원가입 실패
		</c:if>
		
		
		
		</h3>
	</div>
      </div>
     </div>
     
     
     
     
     
     



</body>
</html>









