<%@page import="java.util.List"%>
<%@page import="member.model.MemberListView"%>
<%@page import="member.model.Member"%>
<%@page import="login.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//LoginInfo loginInfo=(LoginInfo)session.getAttribute("loginInfo");
/*  boolean loginCheck=(boolean)request.getAttribute("loginCheck");
   if(loginCheck){
  LoginInfo loginInfo=(LoginInfo)request.getAttribute("loginInfo");
   
   } */
Member member = (Member) request.getAttribute("member");

List<Member> list = (List) request.getAttribute("list");
//request.setAttribute("listView", listView);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

</head>
<body>
				<h1>반갑습니다 ${info.uid} 회원님</h1>
				<hr>
				<hr>
				<%-- ${list} --%>
				<hr>
				<c:if test="${not empty list }">
					<c:forEach items="${list}" var="member">
						<c:if test="${member.userId==info.uid}">
<%-- 						<c:if test="${member.userId==info.uid && member.userPw==info.upw}"> --%>

					아이디 :${member.userId }<br>
					비밀번호 :${member.userPw }<br>
					이름 :${member.userName }<br>
					닉네임 :${member.userNickname }<br>
					이메일 :${member.email }<br>
					연락처 :${member.contactNumber }<br>
					주소 :${member.address }<br>
					사진 경로(임시) :${member.photo }<br>
					
					
					
						</c:if>
					</c:forEach>
				</c:if>
