package board.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import board.dao.SellerBoardDAO;
import board.model.Board;
import jdbc.ConnectionProvider;
import service.Service;

public class SellBoardArticleWriteService implements Service {
		
	SellerBoardDAO dao = SellerBoardDAO.getInstance();
	Board board = new Board();
	String viewTarget = "/WEB-INF/views/board/writeResultView.jsp";
	Connection conn = null;
	int resultCnt = 0;
	Date now = new Date();

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		// 이하 게시물에서 받아온 내용을 담을 변수.
		String user_id = null;
		String title = null;
		String item_category = null;
		String content = null;
		String file_content = null;
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		try {
			
			if (isMultipart) {
				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				
				List<FileItem> files = upload.parseRequest(request);
				Iterator<FileItem> ite = files.iterator();
				
				while (ite.hasNext()) {
					FileItem item = ite.next();
					if (item.isFormField()) {
						// 이곳에 들어 온 것은 value다.
						String paramName = item.getFieldName();
						String paramValue = item.getString("UTF-8");
						
						if (paramName.equals("user_id")) {
							user_id = paramValue;
						} else if (paramName.equals("title")) {
							title = paramValue;
						} else if (paramName.equals("item_category")) {
							item_category = paramValue;
						} else if (paramName.equals("content")) {
							content = paramValue;
						}
						
					} else {
						// 이 곳에 들어온 것은 파일이다.
						String uri = null;
						String realPath = null;
						String saveName = null;
						String paramName = item.getFieldName();
						String fileName = item.getName();
						Long fileSize = item.getSize();
						String contentType = item.getContentType();
						boolean isInMemory = item.isInMemory();
						File saveFile = null;
						
						System.out.println("필드 이름 : " + paramName);
						System.out.println("파일 이름 : " + fileName);
						System.out.println("파일 사이즈 : " + fileSize);
						System.out.println("파일 타입 : " + contentType);
						
						if (contentType.contains("image")) {
							// 파일이 이미지 타입이면.
							uri = request.getSession().getServletContext().getInitParameter("uploadPhotoPath");
						}else {
							// 그 이외의 것이면.
							uri = request.getSession().getServletContext().getInitParameter("uploadFilePath");
						}
						realPath = request.getSession().getServletContext().getRealPath(uri);
						// 서버에 저장될 이름 = Long타입 날짜 + "_" + 받은 파일명.
						saveName = System.nanoTime() + "_" + fileName;
						// 최종적으로 실제 저장 될 파일  = 실제경로 + 저장될 이름
						saveFile = new File(realPath, saveName);
						// realPath에 saveName으로 된 파일을 "실제 절대경로"에 write 한다.
						item.write(saveFile);
						
						// 별개로 DB에 상대경로를 저장한다.
						file_content = uri + "/" + saveName;
					}	
				}
			}
			
			board.setUser_id(user_id);
			board.setTitle(title);
			board.setItem_category(item_category);
			board.setContent(content);
			board.setReg_date(now);
			board.setFile_content_addr(file_content);
			
			conn = ConnectionProvider.getConnection();
			resultCnt = dao.insertBoard(conn, board);
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 발생!");
			e.printStackTrace();
		} catch (FileUploadException e) {
			System.out.println("파일 업로드 중 에러 발생!");
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			System.out.println("인코딩 타입 에러 발생!");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 에러 발생!");
			e.printStackTrace();
		}	
		request.setAttribute("writeResult", resultCnt);
		return viewTarget;
	}

}
