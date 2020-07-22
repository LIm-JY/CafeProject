<%@page import="java.util.List"%>
<%@page import="member.model.Member"%>
<%@page import="login.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	LoginInfo info=(LoginInfo)request.getAttribute("info");
/* 	LoginInfo info=(LoginInfo)session.getAttribute("info"); */
	
	Member member=(Member)request.getAttribute("member");
	List<Member> list=(List)request.getAttribute("list");
	request.setAttribute("info",info);
	request.setAttribute("member",member);
	request.setAttribute("list",list);
	
	%>
<html lang="ko">
<meta charset="utf-8">

<style>
	.check_ok {
		color : blue;
	}
	.check_not {
		color : red;
	}
	#idchk {
		display: none;
	}
</style>
</head>
	<!-- private String userId;
	private String title;
	private String itemCategory;
	private String content;
	private String viewCount;
	private String fileContentAddr; -->
	
	
    <div>
		<h1 class="subtitle">글</h1>
		<hr>
		<form id="regForm" action="buyerBoard.do" method="post">
<!-- 		<form id="regForm" action="buyerBoard.do" method="post" enctype="multipart/form-data"> -->
			<table>
			
				<tr>
					<th>아이디 </th>
					<td> ${info.uid}<input type="hidden" name="uid" value="${info.uid}"> </td>
				</tr>
				<tr>
					<td>제목</td>
					<td> <input type="text" name="title" required> </td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content"col="20" row="20" required></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td> 
						<input type="submit" name="작성">
						<input type="reset">
					</td>
				</tr>
			</table>
		</form>
	</div>

<script>
	
	$(document).ready(function(){
		
		$('#regForm').submit(function(){
			
			if(!$('#idchk').prop('checked')){
				alert('아이디 중복 체크는 필수 항목 입니다');
				$('#uid').focus();
				return false;
			}
			
			
			
		});
		
		$('#uid').focusin(function(){
			
			$(this).val('');
			$('#idchk').prop('checked', false);
			
			$('#checkmsg').text('');
			
			$('#checkmsg').removeClass('check_not');
			$('#checkmsg').removeClass('check_ok');
		});
		
		$('#uid').focusout(function(){
			
			if($(this).val().length<1){
				$('#checkmsg').text("아이디 항목은 필수 항목입니다.");
				$('#checkmsg').addClass('check_not');
				return false;
			}
			
			// 비동기 통신
			$.ajax({
				url : 'idCheck.do',
				data : { uid : $(this).val()},
				success : function(data){
					if(data == 'Y'){
						$('#checkmsg').text("사용가능한 아이디 입니다.");
						$('#checkmsg').addClass('check_ok');
						$('#idchk').prop('checked', true);
					} else {
						$('#checkmsg').text("사용이 불가능한 아이디 입니다.");
						$('#checkmsg').addClass('check_not');
						$('#idchk').prop('checked', false);
					}
				}
			});
			
			
		});
		
		
	});
	
	
</script>









