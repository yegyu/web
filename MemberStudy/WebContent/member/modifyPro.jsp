<%@page import="member.LogonDataBean"%>
<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>script.js"></script>
<h2><%=page_modify%></h2>
<%
	request.setCharacterEncoding("utf-8");
%>

<%-- <jsp:useBean id="memberDto" class="member.LogonDataBean" />
<jsp:setProperty name="memberDto" property="*" />  --%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String tel= request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-" + request.getParameter("tel3");
	String email= request.getParameter("email1") + "@" + request.getParameter("email2") ;
%>

<%
 	LogonDataBean memberDto= new LogonDataBean();
	memberDto.setTel(tel);
	memberDto.setPasswd(passwd);
	memberDto.setEmail(email);
	memberDto.setId(id); 
%>

<%
	LogonDBBean memberDao = LogonDBBean.getInstance(); 
	int result1 = memberDao.updateMember(memberDto);
%>
<%
	response.sendRedirect("main.jsp");
%>