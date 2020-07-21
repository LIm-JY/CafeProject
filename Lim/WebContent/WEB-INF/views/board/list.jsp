<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>


</style>

</head>
<body>


<form action="buyerBoard.do" method="post"> 
<%-- <form action="<%=request.getContextPath() %>/guest/messageWrite.jsp" method="post">  --%>
	
			<table>
			<tr>
				<td><label for="title">제목</label></td>
				<td><input type="text" name="title" id="title" rows="10"
					cols="20" required></td>
			</tr>
			<tr>
				<td><label for="content">내용</label></td>
				<td><textarea name="content" id="content" rows="10" cols="20"
						required></textarea></td>
			</tr>
			<!-- <tr>
				<td><label for="content">사진첨부(나중에)</label></td>
				<td><textarea name="content" id="content" rows="10" cols="20"
						required></textarea></td>
			</tr> -->
			<tr>
				<td><input type="submit" value="글쓰기"></td>
				<td><input type="reset" value="초기화"></td>
			</tr>
		</table>
	
	
	</form>
	
	<hr>





<%-- 	<form action="<%=request.getContextPath() %>/WEB-INF/views/board/messageWriwte.jsp" method="post"> --%>
		<!-- 			String sql = "INSERT INTO project.buyer_board 

(user_id,title,item_category,content,view_count,file_content_addr )

 VALUES (?,?,?,?,?,?)";
 -->


	<!-- <div class="container">

		index
	</div> -->



</body>
</html>









