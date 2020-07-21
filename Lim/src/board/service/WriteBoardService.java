package board.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.dao.BuyerBoardDao;
import board.model.Board;
import jdbc.ConnectionProvider;

public class WriteBoardService {
	
	private WriteBoardService() {}
	private static WriteBoardService service = new WriteBoardService();
	public static WriteBoardService getIstance() {
		return service;
	}
		
	BuyerBoardDao dao = null;
	
	public int writeBoard(Board mesage) {
		int result = 0;
		dao = BuyerBoardDao.getInstance();
		// Dao의 메서드에 전달할 Connection
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			result = dao.insertBoard(conn, mesage);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return result;
	}

}
