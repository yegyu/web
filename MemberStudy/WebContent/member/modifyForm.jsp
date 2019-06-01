<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=project%>style.css">
<script src="<%=project%>script.js"></script>

<h2><%=page_modify%></h2>

<form name="passwdform" method = "post" action="modifyView.jsp" onsubmit="return passwdcheck()">
	<table>
		<tr>
			<th colspan = "2"><%=msg_passwd %></th>
		</tr>
		<tr>
			<th><%=str_passwd %></th>
			<td> <input autofocus class ="input" type = "password" name="passwd" maxlength="15"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type = "submit" value="<%=btn_mod%>">
				<input class="inputbutton" type = "button" value="<%=btn_mod_cancel %>" onclick="location='main.jsp'">
			</th>		
	</table>
</form>