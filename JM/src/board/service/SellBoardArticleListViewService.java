package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.SellerBoardDAO;
import board.model.Board;
import board.model.BoardListView;
import jdbc.ConnectionProvider;
import service.Service;

public class SellBoardArticleListViewService implements Service {

	SellerBoardDAO dao = SellerBoardDAO.getInstance();
	List<Board> articles = null;
	BoardListView sortedArticles = null;
	String viewTarget = "/WEB-INF/views/board/sellerBoardViewer.jsp";
	
	// 1페이지당 보여 줄 총 게시물의 숫자.
	final int VIEW_PAGE_PER_COUNT = 10;

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		int currentPageNumber = 1;
		int startRow = 0, endRow = 0, articleTotalCount = 0;
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			articleTotalCount = dao.selectTotalCount(conn);
			String nowPage = request.getParameter("pNum");
			
			if (nowPage != null) {
				try {
					currentPageNumber = Integer.parseInt(nowPage);
				} catch (NumberFormatException e) {
					System.out.println("입력받은 문자열이 숫자타입으로 변환 할 수 있는 문자가 아닙니다.");
					e.printStackTrace();
				}
			}
			
			
			if (articleTotalCount > 0) {
				startRow = (currentPageNumber-1 ) * VIEW_PAGE_PER_COUNT;
				articles = dao.selectList(conn, startRow, VIEW_PAGE_PER_COUNT);
			}else {
				currentPageNumber = 0;
				articles = Collections.emptyList();
			}
			
			// 선택 된 게시물을들 BoardListView에 담아서
			sortedArticles = 
				new BoardListView(
					articleTotalCount, 
					currentPageNumber, 
					articles, 
					VIEW_PAGE_PER_COUNT, 
					startRow, endRow);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// sortArticles 에 담아서 view로 보낸다.
		request.setAttribute("sortArticles", sortedArticles);
		return viewTarget;
	}

}
