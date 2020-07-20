<%@page import="member.model.MemberListView"%>
<%@page import="login.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
/*     	LoginInfo info=(LoginInfo)request.getAttribute("info");
 */    	
 		String uid=(String)request.getParameter("uid");
 		String upw=(String)request.getParameter("upw");
 		
    	//MemberListView listView=(MemberListView)request.getAttribute("listView");
    	
    	//MemberListView listView=(MemberListView)session.getAttribute("listView");
    	//request.setAttribute("listView",listView);
    	
    	LoginInfo info=(LoginInfo)session.getAttribute("info");
    	
    	Boolean loginCheck=(Boolean)request.getAttribute("loginCheck");
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">

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
	<%
	if(loginCheck){//loginCheck==true
		session.setAttribute("info",new LoginInfo(uid,upw));//세션 생성
		MemberListView listView=(MemberListView)request.getAttribute("listView");
		session.setAttribute("listView",listView);//세션 생성

	%>
	<h1>반갑습니다 ${info.uid} 회원님</h1><hr>
	<h1>로그인 완료</h1>
	<%
	}else{
	%>
	<hr>
	<h1>로그인 실패</h1>
	${listView.memberList}
<%} %>
      </div>
     </div>
	
	<!-- <div class="container">

		index
	</div> -->

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>



	<div>

</body>
</html>