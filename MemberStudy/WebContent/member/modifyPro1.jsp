<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%@ include file="setting.jsp"%>
<script src="<%=project%>script.js"></script>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- 여기선 passwd만 들어온다
 -->
 <jsp:useBean id="memberDto" class= "member.LogonDataBean"/>
	<jsp:setProperty name= "memberDto" property="*"/>
	<!-- passwd -->	
<%
	// id
	memberDto.setId((String)session.getAttribute("memId"));
%>
<%
	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address = null;
	if(!address1.equals("")){
		address = address1 + " " + address2;
	}
	memberDto.setZipcode(zipcode);
	memberDto.setAddress(address);
%>

<%
	//tel
	String tel = null;
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	
	if(! tel1.equals("") && ! tel2.equals("") && ! tel3.equals("") ){
		tel = tel1 + "-" + tel2 +"-"+ tel2;
	}
	memberDto.setTel(tel);
%>
<%
	//email
	String email = null;
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	if(! email1.equals("") && ! email2.equals("")){
		email = email1 + "@" + email2;
	}
	memberDto.setEmail(email);
%>
<%
	LogonDBBean memberDao = LogonDBBean.getInstance();
	int result = memberDao.updateMember(memberDto);
	if(result==0){
		%>
			<script type="text/javascript">
				<!--
					alert(modifyerror);
				-->
			</script>
			<meta http-equiv="refresh" content = "0; url=main.jsp">
		<%
	}else{
		response.sendRedirect("main.jsp");
		
	}
	


%>