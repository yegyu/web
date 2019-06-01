<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<%-- <link rel="stylesheet" type="text/css" href="<%=project%>style.css"> --%>
<%-- <script src="<%=project%>script.js"></script> --%>

<h2> <%=page_modify %></h2>
<%
	int num = Integer.parseInt( request.getParameter( "num" ) );
	String pageNum = request.getParameter( "pageNum" );
	String passwd = request.getParameter( "passwd" );
%>
<%
	BoardDBBean boardDao = BoardDBBean.getInstance();
	int result = boardDao.check( num, passwd );
	if( result == 0 ) {
		%>
		<script type="text/javascript">
			<!--
			erroralert( checkerror );
			//-->
		</script>
		<%
	} else {
		BoardDataBean boardDto = boardDao.getArticle( num );
		%>
		<form name="modifyform" method="post" action="modifyPro.jsp"
			onsubmit="return modifycheck()">
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="pageNum" value="<%=pageNum%>">
			<table>
				<tr>
					<th colspan="2"> <%=msg_modify%> </th>					
				</tr>
				<tr>
					<th> <%=str_writer%> </th>
					<td> &nbsp;&nbsp;<%=boardDto.getWriter()%> </td>
				</tr>
				<tr>
					<th> <%=str_email%> </th>
					<td>
						<%
						if( boardDto.getEmail() == null ) {
							%>
							<input class="input" type="text" name="email" maxlength="40">							
							<%
						} else {
							%>
							<input class="input" type="text" name="email" maxlength="40"
								value="<%=boardDto.getEmail()%>">							
							<%
						}
						%>
					</td>					
				</tr>
				<tr>
					<th> <%=str_subject%> </th>
					<td>
						<input style="width: 290" class="input" type="text" name="subject" 
							maxlength="100"	value="<%=boardDto.getSubject()%>">
					</td>
				</tr>
				<tr>
					<th> <%=str_content%> </th>
					<td>
						<textarea style="width: 290" name="content" rows="10" cols="50"><%=boardDto.getContent()%></textarea>
					</td>
				</tr>
				<tr>
					<th> <%=str_passwd%> </th>
					<td>
						<input class="input" type="password" name="passwd" 
							maxlength="20" value="<%=boardDto.getPasswd()%>">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="<%=btn_mod%>">
						<input class="inputbutton" type="reset" value="<%=btn_cancel%>">
						<input class="inputbutton" type="button" value="<%=btn_mod_cancel%>"
							onclick="location='list.jsp?pageNum=<%=pageNum%>'">
					</th>
				</tr>
				<tr>
				</tr>
			</table>	
		</form>
			
		<%
	}
%>
























