<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDBBean"%>
<%@page import="board.BoardDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=project%>style.css">
<script src="<%=project%>script.js"></script>
<!DOCTYPE html>
<h2><%=page_content%></h2>
<meta property="og:url" content="https://www.your-domain.com/your-page.html" />
<meta property="og:type" content="website" />
<meta property="og:title" content="Your Website Title" />
<meta property="og:description" content="Your description" />
<meta property="og:image" content="https://www.your-domain.com/path/image.jpg" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String number = request.getParameter("number");
%>
<%
	BoardDBBean boardDao = BoardDBBean.getInstance();
	BoardDataBean boardDto = boardDao.getArticle(num);
%>

<%
	if (!request.getRemoteAddr().equals(boardDto.getIp()))
		boardDao.addCount(num);
%>
<table>
	<tr>
		<th style="width:15%"> <%=str_number %></th>
		<td style="width:15%"><%=number%></td>
		<th style="width:15%"><%=str_readcount %></th>
		<td style="width:15%"><%=boardDto.getReadcount() %></td>
	</tr>
	<tr>
		<th> <%=str_writer %></th>
		<td align = "center" > <%=boardDto.getWriter() %></td>
		<th> <%=str_reg_date %></th>
		<td>
		<%
			SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
		%>
		<%= sdf.format(boardDto.getReg_date()) %>
		</td>
	</tr>
	<tr>
		<th> <%=str_subject %></th>
		<td colspan = "3" > <%=boardDto.getSubject() %></td>
	</tr>
	<tr>
		<th> <%=str_content %></th>
		<td colspan="3"> <pre><%=boardDto.getContent() %></pre></td>
	</tr>	
	<tr>
		<th colspan="4">
			<input class="inputbutton" type="button" value ="<%=btn_mod%>" onclick="location='modifyForm.jsp?num=<%=boardDto.getNum()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value ="<%=btn_del%>" onclick="location='deleteForm.jsp?num=<%=boardDto.getNum()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value ="<%=btn_reply%>"
				onclick ="location='writeForm.jsp?num=<%=boardDto.getNum()%>&ref=<%=boardDto.getRef()%>&re_step=<%=boardDto.getRe_step()%>&re_level=<%=boardDto.getRe_level()%>'">
				
			<input class="inputbutton" type="button" value ="<%=btn_list%>"
			onclick="location='list.jsp?pageNum=<%=pageNum%>'">
</table>
<div id="fb-root"></div>
  <script>(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));</script>

  <!-- Your share button code -->
  <div class="fb-share-button" 
    data-href="http://localhost:8080/MemberStudy/board/content.jsp" 
    data-layout="button_count">
  </div>

	







