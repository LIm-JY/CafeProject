<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form method="post" target="">
	<table class="table table-boderless">
		<tr>
			<td>아이디</td>
			<td><input type="text" required="required" name="user_id"></td>
			
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" required="required" name="pass_wd"></td>
		</tr>
		<tr>
			<td><input type="submit"></td>
			<td><input type="reset"></td>
		</tr>
	</table>
</form>