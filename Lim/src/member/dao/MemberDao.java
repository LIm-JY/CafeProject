package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import member.model.Member;

public class MemberDao {

	private MemberDao() {
	}
	private static MemberDao dao = new MemberDao();
	public static MemberDao getInstance() {
		return dao;
	}

	public int insertMember(Connection conn, Member member) throws SQLException {
		int resultCnt = 0;

		PreparedStatement pstmt = null;
		String sql = "INSERT INTO project.member1 (user_id,user_pw,user_name,user_nickname,email,contact_number,address,photo ) VALUES (?,?,?,?,?,?,?,?)";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPw());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getUserNickname());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getContactNumber());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getPhoto());

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
			String sql = "select count(*) from project.member1 where user_id=?";
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
			
			rs = stmt.executeQuery("select count(*) from project.member1");
			
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

	public List<Member> selectList(Connection conn, int startRow, int count) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Member> memberList = new ArrayList<Member>();
		
		String sql = "select * from project.member1 order by user_name limit ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, count);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member member = new Member();
				member.setIdx(rs.getInt("idx"));
				member.setUserId(rs.getString("user_id"));
				member.setUserPw(rs.getString("user_pw"));
				member.setUserName(rs.getString("user_name"));
				member.setUserNickname(rs.getString("user_nickname"));
				member.setEmail(rs.getString("email"));
				member.setContactNumber(rs.getString("contact_number"));
				member.setAddress(rs.getString("address"));
				member.setPhoto(rs.getString("photo"));
				
				memberList.add(member);
			}
			
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
		}
		
		return memberList;
	}

	public int memberDelete(Connection conn, int idx) throws SQLException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "delete from project.member1 where idx=?";
		
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

	public Member selectByIdx(Connection conn, int idx) throws SQLException {

		Member member = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs;	
		
		try {
			String sql = "select * from project.member1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				member.setIdx(rs.getInt("idx"));
				member.setUserId(rs.getString("user_id"));
				member.setUserPw(rs.getString("user_pw"));
				member.setUserName(rs.getString("user_name"));
				member.setUserNickname(rs.getString("user_nickname"));
				member.setEmail(rs.getString("email"));
				member.setContactNumber(rs.getString("contact_number"));
				member.setAddress(rs.getString("address"));
				member.setPhoto(rs.getString("photo"));
			}
			
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
		}
		
		return member;
	}

	public int editMember(Connection conn, Member member) throws SQLException {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE project.member1 SET user_pw = ?,"
				+ " user_name = ?, "
				+ "user_nickname = ?, "
				+ "email = ?, "
				+ "contact_number = ?,"
				+ "address = ?,"
				+ "photo= ? "
				+ "WHERE idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserPw());
			pstmt.setString(2, member.getUserName());
			pstmt.setString(3, member.getUserNickname());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getContactNumber());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getPhoto());
			pstmt.setInt(8, member.getIdx());
			System.out.println(member.getUserPw());
			System.out.println(member.getUserName());
			System.out.println(member.getUserNickname());
			System.out.println(member.getEmail());
			System.out.println(member.getContactNumber());
			System.out.println(member.getAddress());
			System.out.println(member.getPhoto());
			System.out.println(member.getIdx());
			
			result = pstmt.executeUpdate();
			
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
		}
		
		return result;
	}

	
	public String findPasswordById(Connection conn, String uid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String getPasswd = null;
		String sql = "SELECT user_pw FROM project.member WHERE user_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs != null) {
				getPasswd = rs.getString(1);
			}
			
		} catch (SQLException e) {
			System.out.println("쿼리문 에러 발생하였습니다. 쿼리문을 확인하세요!");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 에러가 발생하였습니다. 로그를 확인해주세요.");
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				System.out.println("종료과정에서 SQL 에러가 발생하였습니다.");
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println("종료과정에서 기타 에러가 발생하였습니다.");
				e.printStackTrace();
			}
		}
		return getPasswd;
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
