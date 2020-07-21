package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import login.LoginInfo;
import member.dao.MemberDao;
import member.model.Member;
import member.model.MemberListView;
import service.Service;

public class MemberLoginSuccessServiceImpl implements Service {

MemberDao dao;
	
	@Override
	public String getViewPage(
			HttpServletRequest request, 
			HttpServletResponse response) {
		
		String uid=request.getParameter("uid");
		String upw=request.getParameter("upw");
		
		
		String result="/WEB-INF/views/member/memberLoginFail.jsp";
		
		//---------------------------------------------------------------------------확인
		//아이디 비밀번호 체크
		MemberListView listView=(MemberListView)request.getAttribute("listView");
		System.out.println("전체회원정보확인:"+listView);
		List<Member> list=null;
		MemberDao dao=MemberDao.getInstance();
		Connection conn;
		Boolean loginCheck=false;
		
		try {
			conn = ConnectionProvider.getConnection();
			//dao.selectById(conn, uid);
			list=dao.selectList(conn, 0, dao.selectTotalCount(conn));// startRow: 1
			//System.out.println("----------------전체회원확인--------------");
			for (Member member : list) {
				//System.out.println(member);
				if(member.getUserId().trim().equals(uid.trim())) {//아이디 일치
					if(member.getUserPw().trim().equals(upw.trim())) {//비밀번호 일치
						System.out.println("------------------------------");
						System.out.println(member.getUserId()+":"+uid);
						System.out.println(member.getUserPw()+":"+upw);
						System.out.println("------------------------------");
						System.out.println("로그인 완료");
						
						LoginInfo info=new LoginInfo(uid,upw);
						request.setAttribute("info", info);
						
						loginCheck=true;
						
						result="/WEB-INF/views/member/memberLoginSuccess.jsp";
					}
				}
			}
			
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
//		List<Member> list=listView.getMemberList();
//		for(Member m:list) {
//			System.out.println("멤버정보확인:"+m);
//		}
		
		
		//회원 로그인 정보 객체 생성
		
		//세션 생성
		
		
		request.setAttribute("loginCheck",loginCheck);
		
		request.setAttribute("listView", listView);
//		System.out.println("로그인정보확인:"+info);
		
		return result;
	}

}









