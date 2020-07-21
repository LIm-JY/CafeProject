<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시판 테스트</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script language = "javascript"> // 자바 스크립트 시작
   </script>
    <style>
      .body{
        width:1100px;
        margin:50px auto 0;
        text-align: center;
      }

      .body, .body td, .body th{ border-collapse: collapse; border:1px solid black; box-sizing: border-box;}
      .body th{background-color: #e3e3e3;}
      .Btn{margin:30px auto 0; width:100px;}
    </style>
</head>
<body>
  <%
    Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
    //String url = "jdbc:mysql://localhost:3306/blog"; // mysql 데이터베이스명
	String url = "jdbc:mysql://localhost:3306/project?autoReconnect=true&useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";

    String mysql_id = "temp";   // mysql id값
    String mysql_pw = "temp";   // mysql pw값
    int total = 0;

    try{
      Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);    // 실제 DB 연동시도
      Statement stmt = conn.createStatement();
      String totalSql = "select count(*) from project.board;";  // 총 글갯수를 찾는 sql문
      ResultSet rs = stmt.executeQuery(totalSql);

      if(rs.next()){            // 결과가 있다면 true값을 반환합니다
        total = rs.getInt(1);   // total에 전체 글 갯수 값 대입
      }

      // total은 나중에 페이징 처리시 사용

      String listSql = "select board_no, board_title, board_date from project.board;"; // 전체 리스트를 가져오는 sql문
      rs = stmt.executeQuery(listSql);

      // try catch에서 오류가없을시에 출력되는 내용입니다
  %>
  <table class="body">
    <tr>
      <th>글번호</th>
      <th>글제목</th>
      <th>작성일자</th>
    <tr>

  <%
  // total이 0일때, 곧 게시글이 아무것도 없을때 출력되는 내용입니다.
    if(total==0){
  %>
    <tr>
      <td>게시글이 존재하지 않습니다</td>
    </tr>
  <%
  // total이 0이 아닐때 변수를 선언해주고 출력되는 내용을 순서에 맞게 대입하는 내용입니다.
    } else{
      while(rs.next()){ //rs값이 있을때까지 반복합니다.
        int board_no = rs.getInt(1);           // sql문의 첫번째 컬럼내용을 담습니다.
        String board_title = rs.getString(2);   // sql문의 두번째 컬럼내용을 담습니다.
        String board_date = rs.getString(3); // sql문의 세번째 컬럼내용을 담습니다.

  // 실제 리스트가 출력되는 부분 입니다.
  %>
    <tr>
      <td><%=board_no%></td>
      <td><%=board_title%></td>
      <td><%=board_date%></td>
    </tr>
  <%
      }
    }
    rs.close();
    conn.close();
    stmt.close();
  }catch(SQLException e){
    out.println(e.toString());
  }
  %>
  </table>
</body>
</html> 