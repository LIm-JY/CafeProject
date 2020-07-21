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
