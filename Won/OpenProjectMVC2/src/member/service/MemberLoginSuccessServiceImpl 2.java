package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.LoginInfo;
import member.dao.MemberDao;
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
		
		LoginInfo info=new LoginInfo(uid,upw);
		
		//---------------------------------------------------------------------------확인
		//아이디 비밀번호 체크
		MemberListView listView=(MemberListView)request.getAttribute("listView");
		System.out.println("전체회원정보확인:"+listView);
//		List<Member> list=listView.getMemberList();
//		for(Member m:list) {
//			System.out.println("멤버정보확인:"+m);
//		}
		
		
		//회원 로그인 정보 객체 생성
		
		//세션 생성
		
		request.setAttribute("info", info);
		
		
//		System.out.println("로그인정보확인:"+info);
		
		return "/WEB-INF/views/member/memberLoginSuccess.jsp";
	}

}









