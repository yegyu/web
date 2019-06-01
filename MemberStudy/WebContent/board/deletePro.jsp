<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="<%=project%>script.js"></script>

<h2><%=page_delete %></h2>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd");
	String pageNum = request.getParameter("pageNum");
	//int pageNumInt = Integer.parseInt(pageNum);
//	pageNumInt-=1;
%>
<%
	BoardDBBean boardDao = BoardDBBean.getInstance();
	int result = boardDao.check(num, passwd);
	//BoardDataBean boardDto = boardDao.getArticle(num); 
	if(result == 0){
		//비밀번호 다르다.
		%>
			<script type="text/javascript">
				<!--
				erroralert(checkerror);
				//-->
			</script>
		<%
	}else {
		//비밀번호 같다.
		result = boardDao.deleteArticle(num);
		if(result == 0){
			%>
			<script type = "text/javascript">
				<!--
					alert(deleteerror);
				//-->
			</script>
			<meta http-equiv="refresh" content ="0; url=list.jsp?pageNum=<%=pageNum%>">
			<%
		}else if(result == -1){
			%>
			<script type = "text/javascript">
				<!--
					alert(replyerror);
				//-->
			</script>
			<meta http-equiv="refresh" content ="0; url=list.jsp?pageNum=<%=pageNum%>">
			<%
		}else{
			response.sendRedirect("list.jsp?pageNum="+pageNum);
		}
	}
%>