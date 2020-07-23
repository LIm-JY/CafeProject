package board.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.SellerBoardDAO;
import board.model.Board;
import jdbc.ConnectionProvider;
import service.Service;

public class SellBoardArticleViewService implements Service {
	SellerBoardDAO dao = SellerBoardDAO.getInstance();
	String viewTarget = "/WEB-INF/views/board/sellerBoardArticleView.jsp";
	Board article = new Board();
	
	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		String getIdx = request.getParameter("idx");
		System.out.println(getIdx);
		int idx = 0;
		
		if (getIdx != null) {
			idx = Integer.parseInt(getIdx);
		}
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			article = dao.selectByIdx(conn, idx);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("article", article);
		return viewTarget;
	}

}
