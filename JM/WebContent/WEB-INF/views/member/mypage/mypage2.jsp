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
	<div>
		마이페이지
	</div><hr>
	${member }
      </div>
     </div>
	
	<!-- <div class="container">

		index
	</div> -->

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>

