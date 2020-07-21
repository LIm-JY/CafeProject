package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import board.model.Board;
import member.model.Member;

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
		String sql = 
		"INSERT INTO project.buyer_board (user_id,title,item_category,content,view_count,file_content_addr) VALUES (?,?,?,?,?,?)";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getUser_id());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getItem_category());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getView_count());
			pstmt.setString(6, board.getFile_content_addr());

			resultCnt = pstmt.executeUpdate();

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return resultCnt;
	}
	
	// ID로 조회해서 count가 0 or 1인지 파악.
	public int selectById(Connection conn, String id) throws SQLException {

		int resultCnt = 0;

		PreparedStatement pstmt = null;
		ResultSet rs;

		try {
			String sql = "select count(*) from project.buyer_board where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				resultCnt = rs.getInt(1);
			}

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return resultCnt;
	}
	
	
	
	
	// 게시글 수 조회
	public int selectTotalCount(Connection conn) throws SQLException {
		int resultCnt = 0;

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery("select count(*) from project.buyer_board");

			if (rs.next()) {
				resultCnt = rs.getInt(1);
			}

		} finally {
			if (stmt != null) {
				stmt.close();
			}
		}

		return resultCnt;
	}
	
	// 게시글 조회 기능
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

			while (rs.next()) {
				Board Board = new Board();
				Board.setIdx(rs.getInt("idx"));
				Board.setUser_id(rs.getString("user_id"));
				Board.setTitle(rs.getString("title"));
				Board.setItem_category(rs.getString("item_category"));
				Board.setContent(rs.getString("content"));
				Board.setView_count(rs.getInt("view_count"));
				Board.setFile_content_addr(rs.getString("file_content_addr"));

				BoardList.add(Board);
			}

		} finally {
			if (pstmt != null) {
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
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return result;
	}
	
	
	// idx를 기반으로 게시글 하나 선택.
	public Board selectByIdx(Connection conn, int idx) throws SQLException {

		Board Board = null;

		PreparedStatement pstmt = null;
		ResultSet rs;

		try {
			String sql = "select * from project.buyer_board where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				Board = new Board();
				Board.setIdx(rs.getInt("idx"));
				Board.setUser_id(rs.getString("user_id"));
				Board.setTitle(rs.getString("title"));
				Board.setItem_category(rs.getString("item_category"));
				Board.setContent(rs.getString("content"));
				Board.setView_count(rs.getInt("view_count"));
				Board.setFile_content_addr(rs.getString("file_content_addr"));
			}

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return Board;
	}


	// 수정기능 나중에 추가

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
