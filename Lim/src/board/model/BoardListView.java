package board.model;

import java.util.List;

public class BoardListView {
	
	// 전체 게시물의 개수
	private int BoardTotalCount;
	// 현재 페이지 번호
	private int currentPageNumber;
	// 메시지 리스트
	private List<Board> BoardList;
	// 전체 페이지의 개수
	private int pageTotalCount;
	// 페이지 당 표현 게시물의 개수
	private int BoardCountPerpage;
	// 게시물의 시작 행
	private int startRow;
	// 게시물의 마지막 행
	private int endRow;
	
	public BoardListView(
			int BoardTotalCount, 
			int currentPageNumber, 
			List<Board> BoardList,
			int BoardCountPerpage, 
			int startRow, 
			int endRow) {
		this.BoardTotalCount = BoardTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.BoardList = BoardList;
		this.BoardCountPerpage = BoardCountPerpage;
		this.startRow = startRow;
		this.endRow = endRow;
		calTotalPageCount();
	}
	
	// new BoardListView();
	
	private void calTotalPageCount() {
		
		if(BoardTotalCount == 0) {
			pageTotalCount=0;
		} else {
			pageTotalCount = BoardTotalCount/BoardCountPerpage;
			if(BoardTotalCount%BoardCountPerpage>0) {
				pageTotalCount++;
			}
		}
		
	}

	public int getBoardTotalCount() {
		return BoardTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Board> getBoardList() {
		return BoardList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getBoardCountPerpage() {
		return BoardCountPerpage;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	@Override
	public String toString() {
		return "BoardListView [BoardTotalCount=" + BoardTotalCount + ", currentPageNumber=" + currentPageNumber
				+ ", BoardList=" + BoardList + ", pageTotalCount=" + pageTotalCount + ", BoardCountPerpage="
				+ BoardCountPerpage + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	public boolean isEmpty() {
		return BoardTotalCount==0;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
