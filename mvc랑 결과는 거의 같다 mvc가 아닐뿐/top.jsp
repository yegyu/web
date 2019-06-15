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
	String path = application.getRealPath("/save");
	new File(path).mkdir();
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	

	MultipartRequest multi 
	= new MultipartRequest( request, path, 1024*1024*50, "utf-8", policy );
	String question = multi.getParameter("question");
// 	String originName1 =  multi.getOriginalFileName("upload1");
// 	String systemName1 =  multi.getFilesystemName("upload1");
// 	String originName2 =  multi.getOriginalFileName("upload2");
// 	String systemName2 =  multi.getFilesystemName("upload2");
// 	String originName3 =  multi.getOriginalFileName("upload3");
// 	String systemName3 =  multi.getFilesystemName("upload3");
// 	String originName4 =  multi.getOriginalFileName("upload4");
// 	String systemName4 =  multi.getFilesystemName("upload4");
%>
Q : <%=question %><br>
<c:set var="path" value="<%=path %>"/>
path : ${path } <br><br>
<%
	Enumeration<String> e =  multi.getFileNames();
%>
<br>
<div class="container">    
<% 
	int i = 1;
	while(e.hasMoreElements()){
		String inputname=e.nextElement();
		
%>

<!-- 		<div> -->
<%-- inputname :		<%=inputname %>  <br>              //////////// --%>
<% 		
		String originName= multi.getOriginalFileName( inputname );
		String systemName = multi.getFilesystemName( inputname );
// 		if(originName == null){
// 			break;
// 		}
%>
<%-- system : <%=systemName %> origin :<%=originName %> --%>
<!-- <br> -->
<!-- </div> -->
<% 
		%>
		<c:set var="systemName" value="${systemName }"/>
		<%if(systemName != null){ %> 
		<span>
		
		<img src="/JSP/save/<%=systemName%>" border="0" width="203" height="192" class="rounded">
		</span>
		<%} %>
		<%
		i++;
	}//while
%>
<!-- 	</div> -->
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
// 			alert("111");
			$(this).fadeOut(100).fadeIn(1000).animate({opacity:'1'});
// 			.animate({
// 				  top: '250',
// 			      opacity: '0.5',
// 			      height: '150px',
// 			      width: '150px'
// 			})
// 			$(this).animate({})
			
			cnt++;
		});
	});
</script>



