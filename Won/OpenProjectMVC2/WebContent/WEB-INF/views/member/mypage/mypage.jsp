<%@page import="member.model.MemberListView"%>
<%@page import="member.model.Member"%>
<%@page import="login.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  //LoginInfo loginInfo=(LoginInfo)session.getAttribute("loginInfo");
 /*  boolean loginCheck=(boolean)request.getAttribute("loginCheck");
    if(loginCheck){
	  LoginInfo loginInfo=(LoginInfo)request.getAttribute("loginInfo");
    
    } */
    Member member=(Member)request.getAttribute("member");
    
	MemberListView listView=(MemberListView)request.getAttribute("listView");
	request.setAttribute("listView", listView);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	<h1>반갑습니다 ${info.uid} 회원님</h1><hr>
	<h1>${info.upw}</h1><hr>
	
	<c:if test="${not empty listView}">

		<table class="table">
			<tr>
				<th>no</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>연락</th>
				<th>주소</th>
				<th>사진</th>
				<th>관리</th>
			</tr>
			
		<c:if test="${not empty listView.memberList }">
		<c:forEach items="${listView.memberList}" var="member">
		<c:if test="${member.userId==info.uid}">
			<tr>
	<hr>
      <table>
      <tr>
      <td>아이디</td>
      <td>${info.uid }</td>
      </tr>
      <tr>
      <td>비밀번호</td>
      <td>${info.upw }</td>
      </tr>
      <tr>
      <td>이름</td>
      <td>${info.userName }</td>
      </tr>
      <tr>
      <td>닉네임</td>
      <td>${info.userNickname }</td>
      </tr>
      <tr>
      <td>이메일</td>
      <td>${info.email }</td>
      </tr>
      <tr>
      <td>연락처</td>
      <td>${info.contaactNumber }</td>
      </tr>
      <tr>
      <td>주소</td>
      <td>${info.address }</td>
      </tr>
      <tr>
      <td>사진</td>
      <td><c:url>${info.photo }</c:url></td>
      </tr>
      </table>
      
				<%-- <td>${member.photo}</td> --%>
				<td><img alt="프사 " src="<c:url value="${member.photo}"/>">  </td>
				<td>
				<a href="memberEditForm.do?idx=${member.idx}">수정</a> 
				| 
				<a href="javascript:memberDel(${member.idx})">삭제</a></td>
			</tr>
		</c:if>
		</c:forEach>
		</c:if>
		
		<c:if test="${empty listView.memberList }">
			<tr>
				<th>조회된 회원이 없습니다.</th>
			</tr>
		</c:if>


		</table>


		</c:if>
		
		

      
	
	<!-- 	@Override
	public String toString() {
		return "Member [idx=" + idx + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userNickname=" + userNickname + ", email=" + email + ", contactNumber=" + contactNumber
				+ ", address=" + address + ", photo=" + photo + "]";
	} -->
	
	${listView.memberList}
      </div>
     </div>
	
	<!-- <div class="container">

		index
	</div> -->

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>



	<div>

</body>
</html>