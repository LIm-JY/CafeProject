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
		int idx = 0;
		String getUid = request.getParameter("user_id");
		String getUpw = request.getParameter("user_pw");
		String findPw = null;
		int deleteResult = 0;
		Connection conn = null;

		if (getIdx != null) {
			idx = Integer.parseInt(getIdx);
			System.out.println("idx : " + idx);
			findPw = memberDao.findPasswordById(conn, getUid);
			// if (findPw.equals(getUpw)) { 원래는 비밀번호 확인 해야 함.
				try {
					conn = ConnectionProvider.getConnection();
					deleteResult = dao.articleDelete(conn, idx);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			//}
		}

		request.setAttribute("deleteResult", deleteResult);
		return viewTarget;
	}

}
