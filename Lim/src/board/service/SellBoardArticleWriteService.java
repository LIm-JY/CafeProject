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
		
		request.setAttribute("writeResult", resultCnt);
		return viewTarget;
	}

}
