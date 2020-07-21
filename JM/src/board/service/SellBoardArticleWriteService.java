package board.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.SellerBoardDAO;
import board.model.Board;
import jdbc.ConnectionProvider;
import service.Service;

public class SellBoardArticleWriteService implements Service {
		
	SellerBoardDAO dao = SellerBoardDAO.getInstance();
	Board board = new Board();
	String viewTarget = "/WEB-INF/views/board/writeResultView.jsp";
	Connection conn = null;
	int resultCnt = 0;

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		String file = request.getParameter("file_content");
		
		try {
			conn = ConnectionProvider.getConnection();
			
			board.setUser_id(request.getParameter("user_id"));
			board.setTitle(request.getParameter("title"));
			board.setItem_category(request.getParameter("item_category"));
			board.setContent(request.getParameter("content"));
			if (file != null) {
				board.setFile_content_addr(file);
			}
			
			resultCnt = dao.insertBoard(conn, board);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("writeResult", resultCnt);
		return viewTarget;
	}

}
