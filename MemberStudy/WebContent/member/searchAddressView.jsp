<%@page import="java.util.ArrayList"%>
<%@page import="member.AddressZipcode"%>
<%@page import="member.LogonDBBean"%>
<%@page import="member.LogonDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=project%>style.css">
<script src="<%=project%>script.js"></script>

<%
	request.setCharacterEncoding("utf-8");
	String address = request.getParameter("address");
	String mod = request.getParameter("mod");
%>

<h2>주소 검색</h2>

<form name="formsearch" method="post" >
	동/읍/면 을 입력하세요
	<table>
		<tr>
			<th><input type="text" name="adr" value=""></th>
			<th><input type="button" name="search" value="search"  
			onkeypress="if(event.keyCode==13){searchAdr('<%=mod %>')}"
			onclick="searchAdr('<%=mod %>')"></th>
		</tr>
	</table>
	
		<%
		if(!address.equals("")){
			AddressZipcode az = AddressZipcode.getInstance();
			ArrayList<AddressZipcode> adrList = az.searchAddress(address);
			%>
			우편번호&nbsp;&nbsp;&nbsp;&nbsp;주소
	<div style='overflow:scroll; width:400px;height:400px;'>
			<%
			String zip = null, adr = null;
			for(int i = 0 ; i < adrList.size(); i++){
				zip = adrList.get(i).getZipcode();
				adr = adrList.get(i).getArea1() + " " + adrList.get(i).getArea2()
						+ " " + adrList.get(i).getArea3() + " " + adrList.get(i).getArea4();
			
		%>
			
			<div id = "zip" onclick = "selectAdr('<%=zip %>','<%=adr %>','<%=mod %>')" >&nbsp;<%=adrList.get(i).getZipcode()%>&nbsp;&nbsp;
				<span id="adr"><%=adrList.get(i).getArea1()%>
				<%=adrList.get(i).getArea2()%>
				<%=adrList.get(i).getArea3()%>
				<%=adrList.get(i).getArea4()%></span>
			</div>
	<%
			}
		}
	%>
	</div>
	



</form>