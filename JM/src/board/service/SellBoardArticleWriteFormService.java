package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;

public class SellBoardArticleWriteFormService implements Service{

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		String url = null;
		String memberInfo = request.getParameter("memberInfo");
		
		if (memberInfo != null) {
			url = "/WEB-INF/board/sellerBoardArticleWriteForm.jsp";
		} else {
			url = "/WEB-INF/index.jsp";
		}
		return url;
	}
	
}
