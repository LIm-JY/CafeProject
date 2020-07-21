<%@page import="board.service.WriteBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="requestMessage" class="board.model.Board" scope="request"/>
<jsp:setProperty property="*" name="requestMessage"/>
<%
	WriteBoardService writeService = WriteBoardService.getIstance();

	int result = writeService.writeBoard(requestMessage);
	
	request.setAttribute("writeResult", result);
%>

${result }
<jsp:forward page="messageWrite_view.jsp"/>

























