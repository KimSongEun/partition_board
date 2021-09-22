<%@page import="kh.my.jo.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_header.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template_footer.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/template.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/template.js" ></script>


<title>게시판 리스트</title>
</head>
<body>
<p>
${boardvolist}
<br>
${startPage}
<br>
${endPage}
<br>
${pageCount}

</p>

<%
// 이곳은 자바 문법에 따름
ArrayList<Board> volist = (ArrayList<Board>) request.getAttribute("boardvolist");

%>
<%@ include file="../template_header.jsp" %>
	<h1>게 시 판 리스트</h1>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
		<tr>
			<%
				if (volist != null) {
					for (Board vo : volist) {
						// tr 이 volist 갯수 만큼 생기게 됨.
						// <%= 은 화면에 출력을 위한 표현식을 작성하는 태그, ;없어야 함.
			%>
		
		<tr>
			<td><a href="<%=ctxPath %>/board/boardcontent?no=<%=vo.getBno()%>"> <%=vo.getBno()%> </a></td>
			<td>
				<%
					// 답글 몇단에 따라서 Re: 붙여주기
					for( int i=0; i<vo.getBreLevel(); i++){
				%>
						Re:
				<%
					}
				%>
				<%=vo.getTitle()%>			
			</td>
			<td><%=vo.getWriter()%></td>
			<td><%=vo.getCreateDate()%></td>
		<tr>
			<%
				}
			}
			%>
		
	</table>

	<c:if test=" ${startPage} > 1 " >
	이전
	</c:if>
	<c:forEach begin="${startPage}"  end="${endPage}" step="1" var="i">
		<a href="./boardlist?pagenum=${i}"> ${i} </a>
		<c:if test="${i } != ${endPage}">
			,
		</c:if>
	</c:forEach>
	<c:if test=" ${endPage} < ${pageCount}" >
	다음
	</c:if>
<%-- 
	<%
		if (startPage > 1){
	%>
		이전
	<%
		}
		for (int i = startPage; i <= endPage; i++) {
	%>
	<a href="./boardlist?pagenum=<%=i%>"> <%=i%>  </a>
	<%
		if (i != endPage) {
	%>
	,
	<%
		}
	}
	if (endPage < pageCount) {
	%>
		다음
	<%
	}
	%>
 --%>

<br>
<a href="<%=ctxPath %>/board/boardwrite">글쓰기</a>
<a href="../member/login">로그인</a>




</body>
</html>