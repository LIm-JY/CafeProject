package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import member.model.MemberListView;
import service.Service;

public class MemberMypageServiceImpl implements Service {

	MemberDao dao;

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");

		// ---------------------------------------------------------------------------확인
		// 아이디 비밀번호 체크
		MemberListView listView = (MemberListView) request.getAttribute("listView");
		System.out.println("전체회원정보확인:" + listView);
		List<Member> list = null;
		MemberDao dao = MemberDao.getInstance();
		Connection conn;
		Boolean loginCheck = false;

		try {
			conn = ConnectionProvider.getConnection();
			// dao.selectById(conn, uid);
			list = dao.selectList(conn, 0, dao.selectTotalCount(conn));// startRow: 1
			// System.out.println("----------------전체회원확인--------------");

			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("회원정보확인:"+list);
		request.setAttribute("list", list);
		return "/WEB-INF/views/member/mypage/mypageForm.jsp";
	}

}
