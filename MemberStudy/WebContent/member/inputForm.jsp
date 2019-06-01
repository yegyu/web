<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=project%>style.css">
<script src="<%=project%>script.js"></script>

<h2>
	<%=page_input%>
</h2>

<body>
<form name="inputform" method="post" action="inputPro.jsp" onsubmit="return inputcheck()">
	<input type="hidden" name="confirm" value="0">
	<table>
		<tr>
			<th colspan="2"><%=msg_input%></th>
		</tr>
		<tr>
			<th>* <%=str_id%>
			</th>
			<td><input autofocus class="input" type="text" name="id" maxlength="15"> 
				<input class="inputbutton" type="button" value="<%=btn_confirm%>" onclick="confirmid()"></td>
		</tr>
		<tr>
			<th rowspan="2">* <%=str_passwd%>
			</th>
			<td><input class="input" type="password" name="passwd" maxlength="15"></td>
				
		</tr>
		<tr>
			<td><input class="input" type="password" name="repasswd" maxlength="15"></td>
				

		</tr>
		<tr>
			<th>* <%=str_name%>
			</th>
			<td><input class="input" type="text" name="name" maxlength="20">
			</td>
		</tr>
		<tr>
			<th rowspan="3">* <%=str_address%>
			</th>

			<td colspan = "2"><input class="input" type="text" name="zipcode" maxlength="6" readonly>
				
			<input class="inputbutton" type="button" value="주소검색" name="zipcodesearch" onclick = "openAdrWin(0)"></td>
				
		</tr>
		<tr>

			<td><input  class="input" type="text" name="address1" maxlength="7" readonly size="40"></td>
		</tr>
		<tr>	
			<td><input  class="input" type="text" name="address2" maxlength="15" readonly></td>
				

		</tr>
		<tr>
			<th><%=str_tel%></th>
			<td><input style="width: 48" class="input" type="text" name="tel1" maxlength="3">
				- <input style="width: 48" class="input" type="text" name="tel2" maxlength="4">
				- <input style="width: 48" class="input" type="text" name="tel3" maxlength="4">
			</td>
		</tr>
		<tr>
			<th><%=str_email%></th>
			<td><input style="width: 110" class="input" type="text" name="email1" maxlength="15">
				 @ <select name="email2">
					<option value="0"></option>
					<option value="naver.com">네이버</option>
					<option value="daum.net">다음</option>
					<option value="gmail.com">구글</option>

			</select>
			<input type="button" name="emailconfirm_btn" value="인증" onclick="emailcheck(inputform.email1.value,inputform.email2.value)">
			
			</td>
			
			
		</tr>
		<tr>
			<th colspan="2"><input class="inputbutton" type="submit" value="<%=btn_input%>"> <!-- btn_input = "가입"; --> 
				<input class="inputbutton" type="reset" value="<%=btn_cancel%>"> 
				<input class="inputbutton" type="button" value="<%=btn_input_cancel%>" onclick="location='main.jsp'"> <!-- btn_ok_cancel ="확인취소"; -->
			</th>
		</tr>
	</table>
</form>

</body>











