<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<title>Sidebar 02</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/sidebar-02/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
<style>
*{
font-family: 'Gaegu', cursive;
}
</style>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<div class="wrapper d-flex align-items-stretch">
<nav id="sidebar">
<div class="custom-menu">
<button type="button" id="sidebarCollapse" class="btn btn-primary">
<i class="fa fa-bars"></i>
<span class="sr-only">토글메뉴</span>
</button>
</div>
<div class="p-4 pt-5">
<h1><a href="index.html" class="logo">임시</a></h1>




	<%@ include file="/sideMenuBar.jsp" %>




<div class="mb-5">
<h3 class="h6">Subscribe for newsletter</h3>
<form action="#" class="colorlib-subscribe-form">
<div class="form-group d-flex">
<div class="icon"><span class="icon-paper-plane"></span></div>
<input type="text" class="form-control" placeholder="Enter Email Address">
</div>
</form>
</div>
<div class="footer">
<p>
Copyright &copy;<script type="937e342de99a9ff8a5348d28-text/javascript">document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
</p>
</div>
</div>
</nav>

<div id="content" class="p-4 p-md-5 pt-5">
<h2 class="mb-4">Sidebar #02</h2>
	<%@ include file="/WEB-INF/views/member/EEEEE.jsp" %>
        
        
</script>



</div>
</div>
<script src="<%=request.getContextPath() %>/sidebar-02/js/jquery.min.js" type="937e342de99a9ff8a5348d28-text/javascript"></script>
<script src="<%=request.getContextPath() %>/sidebar-02/js/popper.js" type="937e342de99a9ff8a5348d28-text/javascript"></script>
<script src="<%=request.getContextPath() %>/sidebar-02/js/bootstrap.min.js" type="937e342de99a9ff8a5348d28-text/javascript"></script>
<script src="<%=request.getContextPath() %>/sidebar-02/js/main.js" type="937e342de99a9ff8a5348d28-text/javascript"></script>
<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="937e342de99a9ff8a5348d28-|49" defer=""></script><script defer src="https://static.cloudflareinsights.com/beacon.min.js" data-cf-beacon='{"rayId":"5b6578803e480154","version":"2020.6.0","si":10}'></script>
</body>
</html>