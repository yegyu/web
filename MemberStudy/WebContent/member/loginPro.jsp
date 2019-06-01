<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="<%=project%>script.js"></script>
<h2><%=page_login %></h2>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
%>
<%
	LogonDBBean memberDao = LogonDBBean.getInstance();
	int result = memberDao.check(id , passwd);
	
	if(result == 0){
		//아이디 없다.
		%>
		<script type="text/javascript">
			<!--
			erroralert(loginiderror);
			//-->
		</script>
		<% 
	}else if(result == -1){
		//아이디 있다. 비밀번호 다르다.
		%>
		<script type="text/javascript">
			<!--
			erroralert(loginpasswderror);
			//-->
		</script>
		<%
	}else {
		//아이디 있고, 비밀번호 같다.
		session.setAttribute("memId", id);
		response.sendRedirect("main.jsp");
	}
%>    