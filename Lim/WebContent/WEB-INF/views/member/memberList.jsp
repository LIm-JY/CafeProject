<%@page import="member.model.MemberListView"%>
<%@page import="javax.swing.text.html.ListView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberListView listView=(MemberListView)request.getAttribute("listView");
	request.setAttribute("listView", listView);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="<c:url value="/css/default.css" />">

<style>
	td>img{
		width :50px;
		height : 50px;
	}
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
		<h1 class="subtitle">회원 리스트</h1>

		<c:if test="${not empty listView  }">

		<div>전체회원 ${listView.memberTotalCount} 명</div>
		<hr>

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
			<tr>
				<td>${member.idx}</td>
				<td>${member.userId}</td>
				<td>${member.userPw}</td>
				<td>${member.userName}</td>
				<td>${member.userNickname}</td>
				<td>${member.email}</td>
				<td>${member.contactNumber}</td>
				<td>${member.address}</td>
				<%-- <td>${member.photo}</td> --%>
				<td><img alt="프사 " src="<c:url value="${member.photo}"/>">  </td>
				<td>
				<a href="memberEditForm.do?idx=${member.idx}">수정</a> 
				| 
				<a href="javascript:memberDel(${member.idx})">삭제</a></td>
			</tr>
		</c:forEach>
		</c:if>
		
		<c:if test="${empty listView.memberList }">
			<tr>
				<th>조회된 회원이 없습니다.</th>
			</tr>
		</c:if>


		</table>
		
		<div class="paging">
			<c:forEach begin="1" end="${listView.pageTotalCount}" var="i">
			
			<a class="paging_num ${i == listView.currentPageNumber ? 'now_page' : ''}" href="memberList.do?page=${i}" >${i}</a>
			
			</c:forEach>
		</div>



		</c:if>
	</div>
      </div>
     </div>
	
	<!-- <div class="container">

		index
	</div> -->



	

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>


<script>
	function memberDel(idx){
		if(confirm('선택하신 회원 정보를 삭제하시겠습니까?')){
			location.href = 'memberDelete.do?idx='+idx;
		}
		
	}
</script>






