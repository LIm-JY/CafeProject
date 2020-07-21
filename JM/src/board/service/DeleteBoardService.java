package board.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.dao.BuyerBoardDao;
import board.model.Board;
import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class DeleteBoardService {

	private DeleteBoardService() {
	}

	private static DeleteBoardService service = new DeleteBoardService();

	public static DeleteBoardService getInstance() {
		return service;
	}

	BuyerBoardDao boardDao;
	MemberDao memberDao;

	// 1. 게시글 idx를 받아옴.
	// 2. 게시글의 사용자를 특정하여 그 사용자의 id와 비밀번호를 가지고 있음
	// 3. 입력받은 비밀번호가 일치하는지 확인.
	public int deleteArticle(int idx, String id, String pw) {
		int resultCnt = 0;
		String getUid = null, getUpw = null;
		Connection conn = null;
		Board board = null;
				
		try {
			conn = ConnectionProvider.getConnection();
			boardDao = BuyerBoardDao.getInstance();
			
			//삭제 요청받은 
			board = boardDao.selectByIdx(conn, idx);
			getUid = board.getUser_id();
			getUpw = memberDao.findPasswordById(conn, getUid);
			
			if (getUpw != null && getUpw.equals(pw)) {
				resultCnt = boardDao.BoardDelete(conn, idx);
			}else {
				resultCnt = 0;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		return resultCnt;
	}

}
