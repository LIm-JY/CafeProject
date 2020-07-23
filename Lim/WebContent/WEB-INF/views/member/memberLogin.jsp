<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <%
		if (session.getAttribute("uid") == null) { //세션이 설정되지 않을 경우
	
	%>
		
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
        
      </div>
		</div>

    <script src="<%=request.getContextPath() %>/sidebar-03/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/sidebar-03/js/popper.js"></script>
    <script src="<%=request.getContextPath() %>/sidebar-03/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/sidebar-03/js/main.js"></script>
  </body>
</html>