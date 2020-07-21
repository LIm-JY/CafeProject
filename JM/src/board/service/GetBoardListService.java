package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import board.dao.BuyerBoardDao;
import board.model.Board;
import board.model.BoardListView;
import jdbc.ConnectionProvider;

public class GetBoardListService {
	
	private GetBoardListService() {}
	private static GetBoardListService service = new GetBoardListService();
	public static GetBoardListService getInstance() {
		return service;
	}
	
	private BuyerBoardDao dao;
	
	// 한 페이지에 표현할 메시지의 개수
	private final int Board_COUNT_PER_PAGE = 3;
	
	public BoardListView getBoardList(int pageNumber) {
		
		// 페이지 번호 -> 시작 행, 끝 행
		// dao -> List
		
		Connection conn=null;
		
		BoardListView BoardListView = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			
			dao = BuyerBoardDao.getInstance();
			
			// 페이지의 전체 메시지 구하기
			List<Board> BoardList = null;
			
			// 전체 메시지의 게수
			int BoardTotalCount = dao.selectTotalCount(conn);
						
			int startRow = 0;
			int endRow = 0;
			
			if(BoardTotalCount>0) {
				
				// 시작 행, 마지마 행
				startRow = (pageNumber-1)*Board_COUNT_PER_PAGE + 1;
				endRow = startRow + Board_COUNT_PER_PAGE -1;
				
				BoardList = dao.selectList(conn, startRow, endRow);
				
				
			} else {
				pageNumber = 0;
				BoardList = Collections.emptyList();
			}
			
			BoardListView = new BoardListView(
					BoardTotalCount, 
					pageNumber, 
					BoardList, 
					Board_COUNT_PER_PAGE, 
					startRow, 
					endRow);
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		return BoardListView;
		
	}

	
}
