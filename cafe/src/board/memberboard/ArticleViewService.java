package board.memberboard;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberboardDAO.ArticleDAO;
import model.MemberBoard01;
import service.Service;

public class ArticleViewService implements Service {
	private final int VIEW_ARTICLE_PAGE_PER_COUNT = 10;
	
	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		
		String goUrl = null;
		Connection conn = null;
		ArticleDAO dao = ArticleDAO.getDao();
		List<MemberBoard01> board = null;
		
		if (request.getSession(true) != null) {
			board = dao.ViewArticle(conn);
			goUrl = "/WEB-INF/view/memberboard/view.jsp";
		}else {
			goUrl = "/WEB-INF/view/index.jsp";
		}
		
		return goUrl;
	}

}
