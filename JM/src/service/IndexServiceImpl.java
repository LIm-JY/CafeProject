package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BuyerBoardDAO;
import board.dao.SellerBoardDAO;
import board.model.Board;
import board.model.BoardListView;
import board.service.SellBoardArticleListViewService;
import jdbc.ConnectionProvider;

@SuppressWarnings("unused")
public class IndexServiceImpl implements Service {
	SellerBoardDAO sellerDao = SellerBoardDAO.getInstance();
	BuyerBoardDAO buyerDao = BuyerBoardDAO.getInstance();
	List<Board> sellerArticles = new ArrayList<>();
	List<Board> buyerArticles = new ArrayList<>();
	BoardListView sortedSellerArticles = null;
	BoardListView sortedBuyerArticles = null;
	
	final int VIEW_PAGE_PER_COUNT = 10;
	
	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		String page = "/WEB-INF/views/index.jsp";
		int currentPage = 1, 
			startRow = 0, 
			endRow = 0, 
			articleTotalCount = 0;
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			articleTotalCount = sellerDao.selectTotalCount(conn);
			
			if (articleTotalCount > 0) {
				startRow = (currentPage - 1) * VIEW_PAGE_PER_COUNT;
				sellerArticles = sellerDao.selectList(conn, startRow, VIEW_PAGE_PER_COUNT);
				buyerArticles = buyerDao.selectList(conn, startRow, VIEW_PAGE_PER_COUNT);
			}else {
				currentPage = 0;
				sellerArticles = Collections.emptyList();
				buyerArticles = Collections.emptyList();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sortedSellerArticles = new BoardListView(articleTotalCount, currentPage, sellerArticles, VIEW_PAGE_PER_COUNT, startRow, endRow);
		sortedBuyerArticles = new BoardListView(articleTotalCount, currentPage, buyerArticles, VIEW_PAGE_PER_COUNT, startRow, endRow);
		
		request.setAttribute("sortedSellerArticles", sortedSellerArticles);
		request.setAttribute("sortedBuyerArticles", sortedBuyerArticles);
		return page;
	}

}
