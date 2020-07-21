package board.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.SellerBoardDAO;
import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import service.Service;

public class SellBoardArticleDeleteService implements Service {

	SellerBoardDAO dao = SellerBoardDAO.getInstance();
	MemberDao memberDao = MemberDao.getInstance();
	String viewTarget = "/WEB-INF/views/board/deleteResultView.jsp";

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		String getIdx = request.getParameter("idx");
		int convIdx = 0;
		String getUid = request.getParameter("user_id");
		String getUpw = request.getParameter("user_pw");
		String findPw = null;
		int deleteResult = 0;
		Connection conn = null;

		if (getIdx != null) {
			convIdx = Integer.parseInt(getIdx);
			findPw = memberDao.findPasswordById(conn, getUid);
			if (findPw.equals(getUpw)) {
				try {
					conn = ConnectionProvider.getConnection();
					deleteResult = dao.articleDelete(conn, convIdx);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		request.setAttribute("deleteResult", deleteResult);
		return viewTarget;
	}

}
