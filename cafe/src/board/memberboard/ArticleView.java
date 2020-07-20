package board.memberboard;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDAO;
import jdbc.ConnectionProvider;
import model.ArticlePager;
import model.MemberBoard01;
import service.Service;

public class ArticleView implements Service {
	
	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		ArticlePager articleList = null;
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			// DAO사용을 위하여 호출.
			ArticleDAO dao = ArticleDAO.getDao();
			// 게시글을 담기 위하여 article 리스트를 생성.
			MemberBoard01 article = null;
			// 게시물 전체 수를 구하기 위해서 dao에 계산을 요청하고 그 값을 totalArticleCount에 담음.
			int totalArticleCount = dao.getTotalArticleCount(conn);
			// 페이지당 보여 줄 게시물의 수(상수).
			final int VIEW_ARTICLE_PAGE_PER_COUNT = 10;
			// 현재 보고 있는 페이지(기본값 1페이지)
			int currentPageNum = 1;
			// 페이지 당 게시물의 시작 페이지.
			int startRow = 0;
			
			// 게시판에서 게시판 페이징 프론트 처리를 해서 ?page=n 의 값을 get혹은 post에 담아서 가지고 온다.
			String page = request.getParameter("page");
			
			// 만약 page가 null이 아니면 프론트페이지에서 page(String)값을 불러오는데 성공 한 것이니.
			if (page != null) {
				try {
					//String을 int타입으로 치환하여 currentPageNum에 대입한다.
					currentPageNum = Integer.parseInt(page);
				} catch (Exception e) {
					System.out.println("숫자 타입의 문자열이 전달되지 않아 예외 발생");
					e.printStackTrace();
				}
			}
			// 만약 totalArticleCount(전체게시물의 수)가 0보다 크다면 게시물이 있다는 것 임으로.
			if (totalArticleCount > 0) {
				// 게시글 시작행 = (현제 페이지번호 - 1) * 페이지당 보여 줄 게시물의 숫자
				startRow = (currentPageNum-1) * VIEW_ARTICLE_PAGE_PER_COUNT;
				System.out.println("시작 글 번호 : " + startRow);
				// DAO에서 조건(번호)에 맟는 게시물들을 불러와서 (아래에서 이어짐)
				article = dao.ViewArticle(conn, VIEW_ARTICLE_PAGE_PER_COUNT, startRow);
			}else {
				currentPageNum = 0;
				article = null;
			}
			
			// 이어짐 - articleList에 게시물의 전체 숫자, 현재 보고 있는 페이지, 게시물
			// 페이지당 보여줄 게시물의 수, 게시물의 시작 행 을 담아서. 
			articleList = new ArticlePager(totalArticleCount, 
									currentPageNum, 
									article, 
									VIEW_ARTICLE_PAGE_PER_COUNT, 
									startRow);
			
			
			
		} catch (SQLException e) {
			System.out.println("ViewDao SQL에러입니다. ArticleDAO중 어떤것이 에러인지 확인해주세요.");
			e.printStackTrace();
		}
		
		// articleList 에 담아서
		request.setAttribute("articleList", articleList);
		// memberBoardView.jsp 페이지로 값을 전달한다.
		return "/WEB-INF/view/memberboard/memberBoardView.jsp";
	}

}
