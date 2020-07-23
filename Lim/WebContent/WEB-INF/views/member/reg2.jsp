<%@page import="member.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%
Member member=(Member)request.getAttribute("member1");
int result=(int)request.getAttribute("result");

if(member!=null && result>0){
	session.setAttribute("member1",member);
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



	<div>
		<h1 class="subtitle">회원 가입</h1>
		<hr>
		<h3>
		<c:if test="${result gt 0 && member1 ne null}">
				<div>
					회원가입 완료			
				</div>
				${member1}		
			</c:if>		
		
			<c:if test="${not (result gt 0 && member1 ne null)}">
				회원가입 실패		
			</c:if>
		
		
		</h3>
	</div>
     
     
     
     



</body>
</html>









