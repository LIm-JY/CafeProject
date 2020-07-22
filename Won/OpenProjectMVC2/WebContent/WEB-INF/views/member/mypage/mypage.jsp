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

					
					
					
					<form id="regForm" action="editInfoForm.do" method="post" enctype="multipart/form-data">
						<table>
							<tr>
							<td>아이디</td><td>${member.userId }</td>
							</tr>
							<tr>
							<td>비밀번호</td><td>${member.userPw }</td>
							</tr>
							<tr>
							<td>이름</td><td>${member.userName }</td>
							</tr>
							<tr>
							<td>닉네임</td><td>${member.userNickname }</td>
							</tr>
							<tr>
							<td>이메일</td><td>${member.email }</td>
							</tr>
							<tr>
							<td>연락처</td><td>${member.contactNumber }</td>
							</tr>
							<tr>
							<td>주소</td><td>${member.address }</td>
							</tr>
							<tr>
							<td>사진</td><td>${member.photo }</td>
							</tr>
							</tr>
							<tr>
							<td><input type="submit" value="수정"></td><td><a href="<%=request.getContextPath() %>/edit.jsp">수정</a></td>
							</tr>
						</table>
					</form>
					
						</c:if>
					</c:forEach>
				</c:if>
