<%@page import="kh.my.jo.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Board vo = (Board)request.getAttribute("boardvo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글보기</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td> <%= vo.getBno() %> </td>
			<td> <%= vo.getCreateDate() %>  </td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="2"> <%= vo.getTitle() %> </td>
		</tr>
		<tr>
			<td colspan="3"> <%= vo.getContent() %> </td>
		</tr>
	</table>
	<a href="boardwrite?bno=<%=vo.getBno()%>">답글작성</a>
</body>
</html>