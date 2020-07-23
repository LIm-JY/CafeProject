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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">

</head>

<style>
	#photo{
		width: 100px;
		height: 100px;
	}
</style>

<body>

	
				<h1>반갑습니다 ${info.uid} 회원님</h1>
				<hr>
				
				
				
				
				
				<c:if test="${not empty list }">
					<c:forEach items="${list}" var="member">
						<c:if test="${member.userId==info.uid}">
<%-- 						<c:if test="${member.userId==info.uid && member.userPw==info.upw}"> --%>
					<h3>사진: <img id="photo"  alt="프사 " src="<c:url value="${member.photo}"/>"><br>
					아이디 :${member.userId }<br>
					비밀번호 :${member.userPw }<br>
					이름 :${member.userName }<br>
					닉네임 :${member.userNickname }<br>
					이메일 :${member.email }<br>
					연락처 :${member.contactNumber }<br>
					주소 :${member.address }<br></h3>
					
					
					<h2><a href="memberEditForm.do?idx=${member.idx}">개인정보 수정</a></h2>
 					 
					
					

					
				<%-- <table>
								<tr>
									<td>아이디</td>
									<td>${member.userId }</td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td>${member.userPw }</td>
								</tr>
								<tr>
									<td>이름</td>
									<td>${member.userName }</td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td>${member.userNickname }</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td>${member.email }</td>
								</tr>
								<tr>
									<td>연락처</td>
									<td>${member.contactNumber }</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>${member.address }</td>
								</tr>
								<tr>
									<td>사진</td>
									<td><img src="<c:url value=${member.photo } />" /></td>
								</tr>
							</table> --%>
					
					
						</c:if>
					</c:forEach>
				</c:if>
				<%-- <c:if test="${not empty list}">

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
			
		<c:if test="${not empty list }">
		<c:forEach items="${list}" var="member">
		<c:if test="${member.userId==info.uid}">
			<tr>
	<hr>
      <table>
      <tr>
      <td>아이디</td>
      <td>${member.userId }</td>
      </tr>
      <tr>
      <td>비밀번호</td>
      <td>${member.userPw }</td>
      </tr>
      <tr>
      <td>이름</td>
      <td>${member.userName }</td>
      </tr>
      <tr>
      <td>닉네임</td>
      <td>${member.userNickname }</td>
      </tr>
      <tr>
      <td>이메일</td>
      <td>${member.email }</td>
      </tr>
      <tr>
      <td>연락처</td>
      <td>${member.contactNumber }</td>
      </tr>
      <tr>
      <td>주소</td>
      <td>${member.address }</td>
      </tr>
      <tr>
      <td>사진</td>
      <td><c:url>${member.photo }</c:url></td>
      </tr>
      </table>
      
				<td>${member.photo}</td>
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


		</c:if> --%>





				<!-- 	@Override
	public String toString() {
		return "Member [idx=" + idx + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userNickname=" + userNickname + ", email=" + email + ", contactNumber=" + contactNumber
				+ ", address=" + address + ", photo=" + photo + "]";
	} -->

			

		<!-- <div class="container">

		index
	</div> -->

		



		
</body>
</html>