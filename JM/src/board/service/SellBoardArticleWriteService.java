package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.SellerBoardDAO;
import service.Service;

public class SellBoardArticleWriteService implements Service {
		
	SellerBoardDAO dao = null;
	String viewTarget = "/WEB-INF/views/board/sellerList.jsp";

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		
		return null;
	}

}
