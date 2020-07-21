package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import board.model.Board;

public class BuyerBoardDao {

	private BuyerBoardDao() {
	}
	private static BuyerBoardDao dao = new BuyerBoardDao();
	public static BuyerBoardDao getInstance() {
		return dao;
	}

	public int insertBoard(Connection conn, Board board) throws SQLException {
		int resultCnt = 0;

		PreparedStatement pstmt = null;
		String sql = "INSERT INTO project.buyer_board (user_id,title,item_category,content,view_count,file_content_addr ) VALUES (?,?,?,?,?,?)";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getUserId());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getItemCategory());
			pstmt.setString(4, board.getContent());
			pstmt.setString(5, board.getViewCount());
			pstmt.setString(6, board.getFileContentAddr());

			resultCnt = pstmt.executeUpdate();

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return resultCnt;
	}

	public int selectById(Connection conn, String id) throws SQLException {
		
		int resultCnt = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs;	

		try {
			String sql = "select count(*) from project.buyer_board where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				resultCnt = rs.getInt(1);
			}
			
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
		}
		
		return resultCnt;
	}

	public int selectTotalCount(Connection conn) throws SQLException {
		int resultCnt = 0;
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery("select count(*) from project.buyer_board");
			
			if(rs.next()) {
				resultCnt = rs.getInt(1);
			}
			
		} finally {
			if(stmt!=null) {
				stmt.close();
			}
		} 
		
		return resultCnt;
	}

	public List<Board> selectList(Connection conn, int startRow, int count) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Board> BoardList = new ArrayList<Board>();
		
		String sql = "select * from project.buyer_board order by idx limit ?, ?";
//		String sql = "select * from project.buyer_board order by user_name limit ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, count);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				Board Board = new Board();
				Board.setIdx(rs.getInt("idx"));
				Board.setUserId(rs.getString("user_id"));
				Board.setTitle(rs.getString("title"));
				Board.setItemCategory(rs.getString("item_category"));
				Board.setContent(rs.getString("content"));
				Board.setViewCount(rs.getString("view_count"));
				Board.setFileContentAddr(rs.getString("file_content_addr"));
				
				BoardList.add(Board);
			}
			
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
		}
		
		return BoardList;
	}

	public int BoardDelete(Connection conn, int idx) throws SQLException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "delete from project.buyer_board where idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			result = pstmt.executeUpdate();
			
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
		}
		
		return result;
	}

	public Board selectByIdx(Connection conn, int idx) throws SQLException {

		Board Board = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs;	
//		private int idx;
//		private String user_id;
//		private String title;
//		private String item_category;
//		private String content;
//		private String view_count;
//		private String file_content_addr;
		try {
			String sql = "select * from project.buyer_board where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Board = new Board();
				Board.setIdx(rs.getInt("idx"));
				Board.setUserId(rs.getString("user_id"));
				Board.setTitle(rs.getString("title"));
				Board.setItemCategory(rs.getString("item_category"));
				Board.setContent(rs.getString("content"));
				Board.setViewCount(rs.getString("view_count"));
				Board.setFileContentAddr(rs.getString("file_content_addr"));
			}
			
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
		}
		
		return Board;
	}
	
	
	//수정기능 나중에 추가

//	public int editBoard(Connection conn, Board Board) throws SQLException {
//		
//		int result = 0;
//		
//		PreparedStatement pstmt = null;
//		
//		String sql = "update project.buyer_board set "
//				   + " user_pw=?, user_name=?, photo=? "
//				   + " where idx=?";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, Board.getUserPw());
//			pstmt.setString(2, Board.getUserName());
//			pstmt.setString(3, Board.getPhoto());
//			pstmt.setInt(4, Board.getIdx());
//			
//			result = pstmt.executeUpdate();
//			
//		} finally {
//			if(pstmt != null) {
//				pstmt.close();
//			}
//		}
//		
//		return result;
//	}

	
	
	
	
	
}
