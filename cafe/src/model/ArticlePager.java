package model;

public class ArticlePager {
	// 전체 게시글의 숫자.
	private int totalArticleCount;
	// 총 페이지 수
	private int totalArticlePage;
	// 현재 페이지 번호
	private int currentPageNum;
	// 한 페이지당 보여줄 게시글의 숫자(외부에서 받아오는 상수 값)
	private int showPagePerArticle;
	// 페이지의 시작 게시글 번호.
	private int startRow;
	// 페이지의 마지막 게시글 번호
	private int endRow;
	// 게시글의 내용.
	private BuyBoard article;

	// 디버깅용 toString
	@Override
	public String toString() {
		return "ArticlePager [전체 게시글의 숫자=" + totalArticleCount + ", 전체 페이지 숫자=" + totalArticlePage + ", 현재 페이지 ="
				+ currentPageNum + ", 한 페이지에 보여줄 게시글 숫자(상수) =" + showPagePerArticle + ", 시작 게시글 번호 =" + startRow
				+ ", 마지막 게시글 번호 =" + endRow + ", 게시글의 내용 =" + article + "]";
	}

	// 생성자 공식
	public ArticlePager(int totalArticleCount, int currentPageNum, BuyBoard article, int showPagePerArticle,
			int startRow) {
		this.totalArticleCount = totalArticleCount;
		this.currentPageNum = currentPageNum;
		this.showPagePerArticle = showPagePerArticle;
		this.startRow = startRow;
		this.article = article;
		articlePageCalc();
	}

	/*
	 * 페이지 카운팅 공식. 전체 페이지 수 = 전체 회원의 수 / 페이지 당 보여줄 멤버의 수(상수) 만약 전체회원의 수를 페이지당 보여줄
	 * 멤버의 수로 나누어서 남은 몪이 0이라면 전체 페이지 수에 +1을 더해주도록 한다.
	 */

	private void articlePageCalc() {
		if (totalArticleCount == 0) {
			// 이 조건에 들어온다는 것은 게시글이 하나도 없다는 뜻임으로
			// 더 이상의 계산은 필요 없고 totalArticlePage(총 페이지 수)를 0으로 리턴한다.
			totalArticlePage = 0;
		} else {
			// 이 조건에 들어온다는 것은 게시글이 1개 이상 존재한다는 뜻임으로.
			// 전체 페이지 숫자 = 전체 게시글의 숫자 / 페이지 당 보여 줄 게시글의 숫자(상수)이고.
			totalArticlePage = totalArticleCount / showPagePerArticle;
			// 만약 전체 게시글의 숫자를 페이지 당 보여 줄 게시글의 숫자로 나누어서 남은 나머지의 몪이 0 이상이면
			if (totalArticleCount % showPagePerArticle > 0) {
				// 위 공식에서 계산 된 총 페이지 수에 +1을 처리해준다.
				totalArticlePage++;
			}
		}
	}

	// Getter 영역
	public int getTotalArticleCount() {
		return totalArticleCount;
	}

	public int getTotalArticlePage() {
		return totalArticlePage;
	}

	public int getCurrentPageNum() {
		return currentPageNum;
	}

	public int getShowPagePerArticle() {
		return showPagePerArticle;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public BuyBoard getArticle() {
		return article;
	}
}
