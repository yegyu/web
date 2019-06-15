<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Graphics"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결과</title>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<%--  Q 1 : ${param.question }<br> 왜 안되지?? --%>
	<style>
	.container{
	/* 	display: grid; */
	/* 	grid-template-columns: 1fr 1fr 1fr 1fr; */
		
	}
	</style>
</head>

<%
	HashMap<String ,Integer> fileNames = new HashMap<>();
	String path = application.getRealPath("/save");
	new File(path).mkdir();
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

	MultipartRequest multi 
	= new MultipartRequest( request, path, 1024*1024*50, "utf-8", policy );
	String question = (String)request.getAttribute("question");
	String testNum = (String)request.getAttribute("testNum");
%>
<%-- q : ${question } testNum : ${testNum }<br> --%>
Q : <%=question %><br>
testNum : <%=testNum %><br>
<c:set var="path" value="<%=path %>"/>
path : ${path } <br><br>
<%
	Enumeration<String> e =  multi.getFileNames();
%>
<br>
<div class="container">    
<% 
	//이미지에 고유한 값을 넣는다고 치면 
	//제대로 하려면 db에서 꺼내야
	int i = 1;

	while(e.hasMoreElements()){
		String inputname=e.nextElement();
	
		String originName= multi.getOriginalFileName( inputname );
		String systemName = multi.getFilesystemName( inputname );

%>
		<c:set var="systemName" value="${systemName }"/>
		<%if(systemName != null){ %> 
		<span>
		
		<img src="/JSP/save/<%=systemName%>" border="0" width="203" height="192" class="rounded">
		</span>
		<%
		//여기의 fileNames 의 key,value 들이 db에 저장 되야함
		fileNames.put(systemName, i);
		} %>
		<%
		i++;
	}//while
%>

</div>
<script>
	var cnt = 0;
	$(document).ready(function(){
		$("img").mouseenter(function(){
			$(this).css("opacity", "0.7");
		});
		$("img").mouseleave(function(){
			$(this).css("opacity", "1");
		});
		$("img").click(function(){
			$(this).fadeOut(100).fadeIn(100).animate({opacity:'1'});
		});
	});
</script>



