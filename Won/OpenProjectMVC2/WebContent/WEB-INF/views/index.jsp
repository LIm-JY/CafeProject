<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INDEX</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/bootstrap/css/bootstrap.min.css">
<%-- <link rel="stylesheet" href="<%= request.getContextPath() %>/bootstrap/css/bootstrap.min.css"> --%>

<style>

</style>

</head>
<body>
    <!-- <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">  
      <h1>상단바</h1>
      </div>
     </div>  -->
     	<%@ include file="/WEB-INF/views/include/navigationTest.jsp" %>
     
  <div class="container-fluid">
    <div class="row">
     <!-- 3단길이의 첫번째 열 -->
      <div class="col-md-2">
     <%@ include file="/WEB-INF/views/include/header.jsp" %>
      </div>
      <!-- 9단길이의 첫번째 열 -->
      <div class="col-md-10">
      <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.</p>
      <p> Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.</p>
      <p> Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo,</p>
      <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.</p>
      <p> Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.</p>
      <p> Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo,</p>

      </div>
     </div>
	
	<!-- <div class="container">

		index
	</div> -->

	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>









