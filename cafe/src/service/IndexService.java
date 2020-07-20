package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexService implements service.Service {

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		//Index.do 가 호출되면 아래 jsp 파일을 불러오도록 한다.
		return "/WEB-INF/view/index.jsp";
	}

}
