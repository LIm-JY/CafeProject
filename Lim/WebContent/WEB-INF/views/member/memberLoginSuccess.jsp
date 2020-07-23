<%@page import="member.model.MemberListView"%>
<%@page import="login.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <h2 class="mb-4"><a href="${pageContext.request.contextPath}/index2.html">홈으로</a></h2>
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
	<!-- <script>
	
	alert("회원정보가 일치하지 않습니다");
	</script> -->
	<hr>
	<h1>로그인 실패</h1>
	${listView.memberList}
<%} %>
      </div>
     </div>

    <script src="<%=request.getContextPath() %>/sidebar-03/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/sidebar-03/js/popper.js"></script>
    <script src="<%=request.getContextPath() %>/sidebar-03/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/sidebar-03/js/main.js"></script>
  </body>
</html>