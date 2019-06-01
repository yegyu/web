<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="setting.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=project%>style.css">
<script src="<%=project%>script.js"></script>

<h2><%=page_delete %></h2>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	//int pageNumInt = Integer.parseInt(pageNum);
	
%>

<form name="passwdform" method = "post" action="deletePro.jsp" onsubmit="return passwdcheck()">
	<input type="hidden" name="num" value=<%=num %> >
	<input type="hidden" name="pageNum" value=<%=pageNum%> >
	<table>
		<tr>
			<th colspan="2"><%=msg_passwd %></th>
		</tr>
		<tr>
			<th> <%=str_passwd %></th>
			<td>
				<input autofocus class="input" type ="password" name="passwd" maxlength="20">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type = "submit" value="<%=btn_del %>">
				<input class="inputbutton" type = "reset" value="<%=btn_del_cancel%>" onclick="location='list.jsp?pageNum=<%=pageNum%>'">
			</th>
		</tr>
	</table>
</form>