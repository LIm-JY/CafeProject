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

	public int selectTotalCount(Connection conn) throws SQLException {
		int resultCnt = 0;

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery("select count(*) from project.member1");

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

	public List<Member> selectAllList(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> memberList = new ArrayList<Member>();
		String sql = "select * from project.member1";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

//		private int idx;
//		private String userId;
//		private String userPw;
//		private String userName;
//		private String userNickname;
//		private String email;
//		private String contactNumber;
//		private String address;
//		private String photo;
		//String sql = "INSERT INTO project.member1 (user_id,user_pw,user_name,user_nickname,email,contact_number,address,photo ) VALUES (?,?,?,?,?,?,?,?)";

		while (rs.next()) {
			Member member = new Member(rs.getInt("idx"), rs.getString("user_id"), rs.getString("user_pw"),
					rs.getString("user_name"), rs.getString("user_nickname"), rs.getString("email"),
					rs.getString("contact_number"), rs.getString("address"), rs.getString("photo"));
			memberList.add(member);
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();

		return memberList;
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

			while (rs.next()) {
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
			if (pstmt != null) {
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
			if (pstmt != null) {
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

			if (rs.next()) {
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
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return member;
	}

	public int editMember(Connection conn, Member member) throws SQLException {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = "update project.member1 set " + " user_pw=?, user_name=?, photo=? " + " where idx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserPw());
			pstmt.setString(2, member.getUserName());
			pstmt.setString(3, member.getPhoto());
			pstmt.setInt(4, member.getIdx());

			result = pstmt.executeUpdate();

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return result;
	}

}
