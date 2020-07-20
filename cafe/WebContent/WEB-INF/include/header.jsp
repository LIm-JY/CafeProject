<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

    <!-- 부트스트랩 -->

 <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">


  </head>
<%-- <%
String referer = (String)request.getHeader("REFERER");
if(referer.equals("http://localhost:8081/op/afterLogin/mypage.jsp")){
	%><script>alert("로그인");</script><%
}
%> --%>
<%-- <h1><%=referer %></h1><hr> --%>
<body>
<div id="container">
<div class="page-header" id="header"><img style="width:50px;float:right" src="${pageContext.request.contextPath}/images/stitch.jpeg"><h1>Open Project</h1></div>

	<%@include file="/WEB-INF/include/navigationTest.jsp" %>
	<%-- ${pageContext.request.contextPath }와 request.getContextPath()동일 --%>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/../bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>