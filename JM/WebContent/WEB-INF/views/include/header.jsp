<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form method="post" target="/member/memberLoginSuccess.do">
	<div>
		<div>아 이 디 : <input type="text" required="required" name="uid"></div>
		<div>비밀번호 : <input type="password" required="required" name="upw"></div>
	</div>
	<div>
		<input class="btn btn-primary" style="margin-left: 65px; margin-top: 20px" type="submit" value="가입하기">
		<input class="btn btn-secondary" style="margin-left: 20px; margin-top: 20px" type="reset" value="입력취소">
	</div>
</form>
