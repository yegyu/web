<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.LogonDataBean"%>
<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=project%>style.css">
<script src="<%=project%>script.js"></script>
<%
	
%>
<h2><%=page_modify%></h2>

<%
	String id = (String)session.getAttribute("memId");
	String passwd = request.getParameter("passwd");
%>
<%
	LogonDBBean memberDao = LogonDBBean.getInstance();
	int result = memberDao.check(id,passwd);
	
	if(result == 1){
		// 비밀번호 같다.
		LogonDataBean memberDto =  memberDao.getMember(id);
		%>
		<form name = "modifyform" method="post" action="modifyPro1.jsp" onsubmit="return modifycheck()">
			<table>
				<tr>
					<th colspan="2" > <%=msg_modify %> </th>
				</tr>
				
				<tr>
					<th><%=str_id %></th>
					<td><%=memberDto.getId() %></td>
				</tr>
				
				<tr>
					<th rowspan="2"><%=str_passwd %></th>
					<td><input name= "passwd" type = "password" value ="<%=memberDto.getPasswd() %>"></td>
				</tr>
				<tr>
					<td><input name= "repasswd" type = "password" value ="<%=memberDto.getPasswd() %>"></td>
				</tr>
				
				<tr>
					<th><%=str_name %></th>
					<td><%=memberDto.getName() %></td>
				</tr>
				
					<tr>
						<th rowspan="3">* <%=str_address%>
						</th>
			
						<td colspan = "2"><input class="input" type="text" name="zipcode" value="<%=memberDto.getZipcode() %>" maxlength="6" readonly>
							
						<input class="inputbutton" type="button" value="주소검색" name="zipcodesearch" onclick = "openAdrWin(1)"></td>
							
					</tr>
					<tr>
			
						<td><input  class="input" type="text" name="address1"  value="<%=memberDto.getAddress() %>" maxlength="7" readonly size="40"></td>
					</tr>
					<tr>	
						<td><input  class="input" type="text" name="address2" maxlength="15" readonly></td>
							
			
					</tr>
				
				<tr>
					<th><%=str_tel %></th>
					<td>
						<%
						String tel = memberDto.getTel();
						if ( tel == null || tel.equals("")){
							%>
							<input style="width:48" class = "input" type = "text" name="tel1" maxlength="3" >-
							<input style="width:48" class = "input" type = "text" name="tel2" maxlength="4" >-
							<input style="width:48" class = "input" type = "text" name="tel3" maxlength="4" >
							<% 
						}else{
							String t[] = tel.split("-");
							%>
							<input style="width:48" class = "input" type = "text" name="tel1" maxlength="3" value="<%=t[0]%>">-
							<input style="width:48" class = "input" type = "text" name="tel2" maxlength="4" value="<%=t[1]%>">-
							<input style="width:48" class = "input" type = "text" name="tel3" maxlength="4" value="<%=t[2]%>">
							<% 
						}
						%>
				</tr>
				<tr>
					<th><%=str_email %></th>
					<td>
					<%
						String email = memberDto.getEmail();
						if(email ==null || email.equals("")){
							%>
							<input style ="width:100" type = "text" name = "email1" class ="input" maxlength="15">@
							<input style ="width:100" type = "text" name = "email2" class ="input" maxlength="15">
							<%
						}else{
							String e[] = email.split("@");
							%>
							<input style ="width:100" type = "text" name = "email1" class ="input" value="<%=e[0] %>" maxlength="15">@
							<input style ="width:100" type = "text" name = "email2" class ="input" value="<%=e[1] %>" maxlength="15">
							<% 
						}
					%>
					</td>
				</tr>
				<tr>
					<th><%=str_reg_date %></th>
					<td>
						<%
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd- HH:mm");	
						%>
						&nbsp;<%=sdf.format(memberDto.getReg_date() ) %>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class = "inputbutton" type = "submit" value="<%=btn_mod%>">
						<input class = "inputbutton" type = "reset" value="<%=btn_mod_cancel%>" onclick="location='main.jsp'">
					</th>
				</tr>
			</table>
		</form>
		<%
	}else{
		// 비밀번호 다르다.
		%>
		<script type ="text/javascript">
			<!-- 
				erroralert(loginpasswderror);
			//-->
		</script>
		<%
	}
%>