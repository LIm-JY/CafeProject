<%@page import="member.model.MemberListView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


MemberListView listView=(MemberListView)request.getAttribute("listView");

<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">

</head>
<body>
    	
	<%
		if (session.getAttribute("uid") == null) { //세션이 설정되지 않을 경우
	
	%>
<%-- 	<form method="post" action="<%=request.getContextPath()%>/WEB-INF/views/member/loginCheck.jsp">
 --%>	<form method="post" action="memberLoginSuccess.do"> 
	<table>
	<tr>
	<td><label for="uid">아이디</label></td>
	<td><input type="text" name="uid" id="uid" placeholder="아이디" required></td>
	</tr>
	<tr>
	<td><label for="upw">비밀번호</label></td>
	<td><input type="password" name="upw" id="upw" placeholder="비밀번호" required></td>
	</tr>
	<tr>
	<td><input type="submit" value="로그인"></td>
	<td><input type="reset" value="초기화"></td>
	</tr>
	
	</table>
	
		
		
	</form>
	<%
		} else {
	%>
	<form method="post" action="logout.jsp">
		<%=session.getAttribute("uid")%>님 환영합니다~
		<input type="submit" value="로그아웃">
	</form>
	<%
		}
	%>




	


</body>
</html>



