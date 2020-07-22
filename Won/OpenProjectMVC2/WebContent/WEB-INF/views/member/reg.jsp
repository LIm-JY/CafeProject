<%@page import="member.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
완료
<%-- 
<%
Member member=(Member)request.getAttribute("member");
int result=(int)request.getAttribute("result");

if(member!=null && result>0){
	session.setAttribute("member",member);
}
%>


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

      --%>
     
     
     
     
  







