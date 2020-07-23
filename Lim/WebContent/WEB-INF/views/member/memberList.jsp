<%@page import="member.model.MemberListView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberListView listView=(MemberListView)request.getAttribute("listView");
	request.setAttribute("listView", listView);
%>
<!doctype html>
<html lang="ko">
  <head>
  	<title>Sidebar 03</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/sidebar-03/css/style.css">
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
				<div class="custom-menu">
					<button type="button" id="sidebarCollapse" class="btn btn-primary">
	          <i class="fa fa-bars"></i>
	          <span class="sr-only">Toggle Menu</span>
	        </button>
        </div>
				<%@ include file="/sideMenu.jsp" %>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">
        <h2 class="mb-4"><a href="${pageContext.request.contextPath}/index.html">홈으로</a></h2>
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

    <script src="<%=request.getContextPath() %>/sidebar-03/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/sidebar-03/js/popper.js"></script>
    <script src="<%=request.getContextPath() %>/sidebar-03/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/sidebar-03/js/main.js"></script>
  	<script>
	function memberDel(idx){
		if(confirm('선택하신 회원 정보를 삭제하시겠습니까?')){
			location.href = 'memberDelete.do?idx='+idx;
		}
		
	}
</script>
  </body>
</html>