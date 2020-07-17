package dao.MemberboardDAO;

public class ArticleDAO {
	private ArticleDAO() {}
	private static ArticleDAO dao = new ArticleDAO();
	public static ArticleDAO getDao() {
		return dao;
	}
	
	
}
