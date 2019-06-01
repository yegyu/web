<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="<%=project%>script.js"></script>

<h2><%=page_delete %></h2>
<%
	String id = (String) session.getAttribute("memId");
	String passwd = request.getParameter("passwd");
%>
<%
	LogonDBBean memberDao = LogonDBBean.getInstance();
	int result = memberDao.check(id, passwd);
	if(result == 1){
		//비밀번호 같다.
		result = memberDao.deleteMember(id);
		if( result == 0 ){
			// 회원 탈퇴 실패
			%>
				<script type="text/javascript">
					<!-- 
						alert(deleteerror);
					//-->
				</script>
				<meta http-equiv="refresh" content="0; url=main.jsp">
			<% 
		}else {
			//탈퇴 성공 main.jsp 로 (아래 두식의 차이는 ??????????????????????????????????????????????????????????????????)
			session.setAttribute("memId", null);
			/* session.removeAttribute("memId"); */
			%>
			<script type="text/javascript">
				<!-- 
					alert(deleteok);
				//-->
			</script>
			<meta http-equiv="refresh" content="0; url=main.jsp">
			<!-- response.sendRedirect("main.jsp"); -->
			<% 
		}
	}else{
		//비밀번호 다르다.
		%>
			<script type = "text/javascript">
				<!--
				erroralert(loginpasswderror);
				//-->
			</script>
		<%
	}
%>