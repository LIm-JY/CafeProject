package board.model;

import java.util.List;

public class BoardListView {
	
	// 전체 게시물의 개수
	private int boardTotalCount;
	// 현재 페이지 번호
	private int currentPageNumber;
	// 메시지 리스트
	private List<Board> articleList;
	// 전체 페이지의 개수
	private int pageTotalCount;
	// 페이지 당 표현 게시물의 개수
	private int boardCountPerPage;
	// 게시물의 시작 행
	private int startRow;
	// 게시물의 마지막 행
	private int endRow;
	
	public BoardListView(
			int boardTotalCount, 
			int currentPageNumber, 
			List<Board> articleList,
			int boardCountPerPage, 
			int startRow, 
			int endRow) {
		this.boardTotalCount = boardTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.articleList = articleList;
		this.boardCountPerPage = boardCountPerPage;
		this.startRow = startRow;
		this.endRow = endRow;
		calTotalPageCount();
	}
	
	// new BoardListView();
	
	private void calTotalPageCount() {
		
		if(boardTotalCount == 0) {
			pageTotalCount=0;
		} else {
			pageTotalCount = boardTotalCount/boardCountPerPage;
			if(boardTotalCount%boardCountPerPage>0) {
				pageTotalCount++;
			}
		}
		
	}

	public int getBoardTotalCount() {
		return boardTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Board> getArticleList() {
		return articleList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getBoardCountPerPage() {
		return boardCountPerPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	@Override
	public String toString() {
		return "BoardListView [boardTotalCount=" + boardTotalCount + ", currentPageNumber=" + currentPageNumber
				+ ", articleList=" + articleList + ", pageTotalCount=" + pageTotalCount + ", boardCountPerPage="
				+ boardCountPerPage + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	public boolean isEmpty() {
		return boardTotalCount==0;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
