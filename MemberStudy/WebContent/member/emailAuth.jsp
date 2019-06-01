<%@page import="member.EmailConfirm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="setting.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=project%>style.css">
<script src="<%=project%>script.js"></script>

<%
	String email = null;
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	if (!email1.equals("")) {
		if (email2.equals("0")) {
			// 직접입력
			email = email1;
		} else {
			email = email1 + "@" + email2;
		}
	}
	// 위에서 작성한 java파일 객체 생성
	EmailConfirm emailconfirm = new EmailConfirm();
	String authNum = emailconfirm.connectEmail(email);
%>

<body>
	<form method="post" action="" name="emailcheck">
		<table>
			<tr>
				<th colspan="2">인증번호를 입력하세요.</th>
			</tr>
			<tr>
				<td><input type="text" name="emailconfirm"></td>
				<td><input type="button" value="확인"
					onkeypress="if(event.keyCode==13){confirmemail(emailcheck.emailconfirm.value,<%=authNum%>)}"
					onclick="confirmemail(emailcheck.emailconfirm.value,<%=authNum%>)">
				</td>
			</tr>
		</table>
	</form>
	<br>남은시간 : &nbsp;&nbsp; 
	<span id="txt"></span>
	<br><br><br><br>
	현재 시간 : &nbsp;&nbsp;
	<span id="demo"></span>

	<script>
var c = 60;
var t;
var timer = setInterval(function(){
	if( c > 0){
			c = c - 1;
			document.getElementById("txt").innerHTML= c;
	}else{
		alert("time out");
		clearInterval(timer);
		self.close();
	}
}, 1000);




var myVar = setInterval(myTimer, 1000);

function myTimer() {
  var d = new Date();
  document.getElementById("demo").innerHTML = d.toLocaleTimeString();
}



</script>


</body>



