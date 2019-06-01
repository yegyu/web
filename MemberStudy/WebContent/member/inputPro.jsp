<%@page import="java.sql.Timestamp"%>
<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src = "<%=project%>script.js"></script> 
<h2><%=page_input%></h2>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberDto" class="member.LogonDataBean"/>
	<jsp:setProperty name="memberDto" property="*"/>
	<!-- id passwd name zipcode -->
<%
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address = null;
	if(!address1.equals("")){
		address = address1 + " " + address2;
	}
	memberDto.setAddress(address);
%>
<%
	//tel
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String tel = null;
	if( !tel1.equals("") && !tel2.equals("") && !tel3.equals("")){
		tel = tel1 +"-" + tel2 + "-" + tel3; 
	}
	memberDto.setTel(tel);
%>
<%
	//email
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = null;
	if(!email1.equals("")){
		if( email2.equals("0")){
			//직접입력
			email = email1;
		}else{
			email = email1+ "@" + email2;
		}
	}
	memberDto.setEmail(email);
%>
<%
	//reg_date
	memberDto.setReg_date(new Timestamp(System.currentTimeMillis() )) ;
%>
<%
	LogonDBBean memberDao= LogonDBBean.getInstance();
	int result = memberDao.insertMember(memberDto);
	if(result ==0 ){
		//회원 가입 실패시
		%>
		<script type = "text/javascript">
		<!-- 
		erroralert( inputerror );
		//-->
		
		</script><%
	}else{
		//회원가입 성공시
		response.sendRedirect("loginForm.jsp");
		
	}
	
%>