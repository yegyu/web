<%@page import="member.LogonDBBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=project%>style.css">
<script src="<%=project%>script.js"></script>
<h2> <%=page_confirm%> </h2>

<%
	String id = request.getParameter("id");
%>
<%
	LogonDBBean memberDao = LogonDBBean.getInstance();
	int result = memberDao.checkId(id);
	if(result==0){
		//아이디 없음
		%>
			<table>
				<tr>
					<th><span><%=id %></span><%=msg_id_o %></th>
				</tr>
				<tr>
					<th>
						<input class="inputbutton" type = "button" value="<%=btn_ok%>" onclick="setid('<%=id%>')">
					</th>
				</tr>
			</table>
		<%
	}else{
		%><form method="post" action="confirmId.jsp" name="confirmform" onsubmit="return confirmcheck()">
		<table>
			<tr>
				<th colspan = "2"><span><%=id %></span><%=msg_id_x %></th>
			</tr>
			<tr>
				<th><%=str_id %></th>
				<td><input autofocus class="input" type = "text" name="id" maxlength="15"></td>
			</tr>
			<tr>
				<th colspan = "2">
					<input class="inputbutton" type ="submit" value="<%=btn_ok %>">
					<input class="inputbutton" type ="button" value="<%=btn_ok_cancel %>" onclick="self.close()">
				</th>
					
		</table>
		
		</form><%
	}
%>