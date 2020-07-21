package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BuyerBoardDao;
import service.Service;

public class WriteBoardService implements Service {
	
	private WriteBoardService() {}
	private static WriteBoardService service = new WriteBoardService();
	public static WriteBoardService getIstance() {
		return service;
	}
		
	BuyerBoardDao dao = null;

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		
		return null;
	}

}
