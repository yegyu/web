<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=project%>style.css">
<script src="<%=project%>script.js"></script>

<h2> <%=page_main%> </h2>

<%
	if( session.getAttribute( "memId" ) == null ) {
		// 세션이 없다 - 로그아웃 상태
		%>
		<form name="mainform" method="post" action="loginPro.jsp" onsubmit="return maincheck()">
			<table>
				<tr>
					<th colspan="2"> <%=msg_main%> </th> 
				</tr>
				<tr>
					<th> <%=str_id%> </th>
					<td> 
						<input autofocus class="input" type="text" name="id" maxlength="15"> 
					</td>
				</tr>
				<tr>
					<th> <%=str_passwd%> </th>
					<td> 
						<input class="input" type="password" name="passwd" maxlength="15"> 
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="<%=btn_login%>">
						<input class="inputbutton" type="reset"  value="<%=btn_cancel %>">
						<input class="inputbutton" type="button" value="<%=btn_input%>" onclick="location='inputForm.jsp'">
					</th>
				</tr>
			</table>	
		</form>		
		<%
	} else {
		// 세션이 있다 - 로그인 상태
		%>
		<table>
			<tr>
				<td style="width:300" align="center">
					<span><%=session.getAttribute("memId") %></span>
					<%=msg_login_main %>
				</td>
			</tr>
			<tr>
				<th>
					<input class="inputbutton" type = "button" value="<%=btn_modify %>" onclick="location='modifyForm.jsp'">
					<input class="inputbutton" type = "button" value="<%=btn_delete%>" onclick="location='deleteForm.jsp'">
					<input class="inputbutton" type = "button" value="<%=btn_logout %>" onclick="location='logout.jsp'">
				</th>
			</tr>
		</table>
		<%
		
	}
%>













