package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;

public class SellBoardArticleWriteFormService implements Service{

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		String url = null;
		String memberInfo = request.getParameter("memberInfo");
		
		// if (memberInfo != null) { 세션 없으면 당연히 원래는 튕겨내야 함.
		if (memberInfo == null) {
			url = "/WEB-INF/views/board/sellerArticleWriteForm.jsp";
		} else {
			System.out.println("세션 없음!");
			url = "/index.do";
		}
		return url;
	}
	
}
