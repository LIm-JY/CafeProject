
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>게시판 테스트</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
</head>
<body>
  <%
    request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리

     Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
     //String url = "jdbc:mysql://localhost:3306/blog"; // mysql 데이터베이스명
	String url = "jdbc:mysql://localhost:3306/project?autoReconnect=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";

     String mysql_id = "temp";   // mysql id값
     String mysql_pw = "temp";   // mysql pw값

     String board_title = request.getParameter("board_title");    // 넘어온 글제목 값 저장
     String board_content = request.getParameter("board_content"); // 넘어온 글내용 값 저장

     try{
       Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);    // 실제 DB 연동시도

       String sql = "insert into project.board(board_title, board_content) values(?,?)"; // insert 쿼리문
       PreparedStatement pstmt = conn.prepareStatement(sql);

       pstmt.setString(1, board_title);
       pstmt.setString(2, board_content);

       pstmt.execute();
       pstmt.close();
     }catch(SQLException e){
       out.println(e.toString());
     }
  %>
  <script>
    alert("게시글이 입력 되었습니다.");
    window.location.href="list.jsp";
  </script>
</body>
</html>