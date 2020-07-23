<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <html lang="ko">
<meta charset="utf-8">
<div class="p-4">
		  		<h1><a href="${pageContext.request.contextPath}/index.html" class="logo">카페</a></h1>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="${pageContext.request.contextPath}/member/memberRegForm.do"><span class="fa fa-user mr-3"></span> 회원가입</a>
	          </li>
	          
	          <c:if test="${empty info}">
	          <li>
	              <a href="${pageContext.request.contextPath}/member/memberLogin.do"><span class="fa fa-user mr-3"></span> 로그인</a>
	          </li>
	          </c:if>
	          <c:if test="${!empty info}">
	          <li>
	              <a href="${pageContext.request.contextPath}/member/memberLogout.do"><span class="fa fa-user mr-3"></span> 로그아웃</a>
	          </li>
	          </c:if>
	          <li>
              <a href="${pageContext.request.contextPath}/member/memberMypage.do""><span class="fa fa-briefcase mr-3"></span> 마이페이지</a>
	          </li>
	          <li>
              <a href="${pageContext.request.contextPath}/board/sellerBoard.do"><span class="fa fa-sticky-note mr-3"></span> 판매 게시글</a>
	          </li>
	          <li>
              <a href="${pageContext.request.contextPath}/board/buyerBoard.do"><span class="fa fa-sticky-note mr-3"></span> 구매 게시글</a>
	          </li>
	          <li>
              <a href="${pageContext.request.contextPath}/member/memberList.do"><span class="fa fa-paper-plane mr-3"></span> 회원정보</a>
	          </li>
	        </ul>

	        <div class="mb-5">
						<h3 class="h6 mb-3">Subscribe for newsletter</h3>
						<form action="#" class="subscribe-form">
	            <div class="form-group d-flex">
	            	<div class="icon"><span class="icon-paper-plane"></span></div>
	              <input type="text" class="form-control" placeholder="Enter Email Address">
	            </div>
	          </form>
					</div>

	        <div class="footer">
	        	<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	        </div>

	      </div>