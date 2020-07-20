package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.BuyBoard;

public class BuyboardDAO {
	private BuyboardDAO() {}
	private static BuyboardDAO dao = new BuyboardDAO();
	public static BuyboardDAO getDao() {
		return dao;
	}
	public BuyBoard ViewArticle(Connection conn, int pagePerArticle, int startRow) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BuyBoard article = null;
		String sql = "SELECT * FROM project.buyboard";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// 만약 게시글이 1개라도 있다면 resultset엔 데이터가 있음으로.
			if (rs != null) {
				// 쿼리문이 가지고 온 resultset의 값을 article에 대입하되.
				while (rs.next()) {
					article = new BuyBoard(
							rs.getInt("idx"), 
							rs.getString("userid"),
							rs.getString("title"),
							rs.getString("item_catagory"),
							rs.getString("content"),
							rs.getDate("reg_date"),
							rs.getInt("viewcount"),
							rs.getString("filecontentaddr")
						);	
				}
			}
		} catch (SQLException e) {
			System.out.println("SQL 쿼리 처리 과정 에러 발생. 쿼리문을 확인해주세요.");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 에러 발생. 에러 로그를 확인해주세요.");
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					// 사용자가 필요해서 연 자원인 resultSet를 닫아준다.
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					// 사용자가 필요해서 연 자원인 PrepareStatement 를 닫아준다.
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return article;
	}
	
	public int getTotalArticleCount(Connection conn) {
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM project.buyboard";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultCnt;
	}
}
