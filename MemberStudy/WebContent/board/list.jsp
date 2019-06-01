<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=project%>style.css"> 
<script src="<%=project%>script.js"></script>
<!DOCTYPE html>

<%
	int pageSize = 5;	//한페이지 당 글 수
	int pageBlock = 3; // 보이는 글자 수
%>

<%
	int cnt = 0;				// 총 글갯 수
	String pageNum = null;  	// 현재 페이지		
	int currentPage = 0;		// 현재 페이지
	int start = 0;				// 시작 rownum ; 한페이지의 맨 아래 (맨 뒤가 1)
	int end = 0;				// 끝 rownum ;	한페이지의 맨 위   (맨 앞 글)
	int number = 0;				// 출력용 글번호
	
	int pageCount=0;			//page 갯수		[1][2][3]
	int startPage=0;			//페이지 번호 시작	[1]
	int endPage = 0;			//페이지 번호 끝		  [3]
%>
<%
	BoardDBBean boardDao = BoardDBBean.getInstance();
	cnt = boardDao.getCount();	//전체글 수 from DB
	
	pageCount = cnt / pageSize + (cnt % pageSize > 0 ? 1 : 0);
	
	pageNum = request.getParameter( "pageNum" );

	if( pageNum == null || pageNum.equals( "" ) ) {
		pageNum = "1";
	}
	currentPage = Integer.parseInt( pageNum );
	
	if(currentPage > pageCount){
		currentPage = pageCount;
		pageNum = String.valueOf(pageCount);
	}
	
%>

<%
	
	
   //맨아래					    //한페이지 당 글 수
	start = ( currentPage - 1 ) *  pageSize  +    1;		
//	한페이지의 맨 위 수
	end			 = start + pageSize -1;		

	//한페이지에 (마지막 페이지) pageSize 만큼 없을 시;
	if( end > cnt ) end = cnt;
	
	//출력용 글번호 =  전체글수	-	 현재 페이지		 * 한페이지당 글 수
	number 		=  cnt 		- ( currentPage -1 ) * pageSize ;	
%>
<%


//	페이지번호시작
	startPage = (currentPage / pageBlock ) * pageBlock + 1;

	if(currentPage % pageBlock == 0) startPage -= pageBlock;
	
	endPage = startPage + pageBlock - 1;
	if(endPage > pageCount)
		endPage = pageCount;
%>
<h2> <%=page_list%> ( <%=str_cnt%> : <%=cnt%> ) </h2>

<table>
	<tr>
		<th colspan="6" align="right">
			<a href="writeForm.jsp">
				<%=str_write%>
			</a>
			&nbsp;&nbsp;&nbsp; 
		</th>
	</tr>
	<tr>
		<th style="width: 5%"> <%=str_num%> </th>
		<th style="width: 30%"> <%=str_subject%> </th>
		<th style="width: 10%"> <%=str_writer%> </th>
		<th style="width: 15%"> <%=str_reg_date%> </th>
		<th style="width: 5%"> <%=str_readcount%> </th>
		<th style="width: 10%"> <%=str_ip%> </th>
	</tr>
	<%
		// 여기서부터
		//여기서 부터 글
		if( cnt ==0 ) {
		%>
		<tr>
			<td colspan="6" align="center">
				<%=msg_list%>
			</td>
		</tr>
		<%
		} else {
			ArrayList<BoardDataBean> articles = boardDao.getArticles( start, end );
			for( int i=0; i<articles.size(); i++ ) {
				BoardDataBean boardDto = articles.get( i );
				%>
				<tr>
					<td align="center"> 
						<%=number --%> 
					</td>
					<td>
						&nbsp;&nbsp;
						<%
					
						int level = boardDto.getRe_level();
						int wid = (level  -1 ) * 10;
						if(level > 1){
							%>
							<img src="<%=project %>images/level.gif" width="<%=wid %>" height="15" border="0">
							<%
						}
						if(level > 0){
							%>
								<img src="<%=project %>images/re.gif" width="20" height="15" border="0">
							<% 
						}
						%>
						<a href="content.jsp?num=<%=boardDto.getNum()%>&pageNum=<%=pageNum%>&number=<%=number+1	%>">
							<%=boardDto.getSubject()%>
							<% 
								if(boardDto.getReadcount() > 20){
							%>
							<img src="<%=project %>images/hot.gif" width="20" height="15" border="0">
							<%
						}
							%>
						</a>
					</td>
					<td align="center">
						<%=boardDto.getWriter()%>
					</td>
					<td align="center">
						<%
						SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm" );
						%>
						<%=sdf.format( boardDto.getReg_date() )%>
					</td>
					<td align="center">
						<%=boardDto.getReadcount()%>
					</td>
					<td align="center">
						<%=boardDto.getIp()%>
					</td>
				</tr>			
				<%
			}		
		}
	%>
</table>
<br>
<%
	if(cnt > 0){
		if(startPage > pageBlock){
			%>
				<a href="list.jsp?pageNum=<%=1%>">[처음]</a>
				<%-- <a href="list.jsp">[처음]</a> --%>
				<a href="list.jsp?pageNum=<%=startPage - pageBlock%>">[◀  ]</a>
			<% 
		}
		
		
	
		for(int i = startPage ; i <=endPage ; i++ ){
			if(currentPage == i){
			%>
				<span>[<%=i %>]</span>
			<% 
		}else {
			%>
				<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
			<% 
		}
	}
		if(pageCount > endPage){
			%>
			<a href="list.jsp?pageNum=<%=startPage + pageBlock%>">[ ▶ ]</a>
			<a href="list.jsp?pageNum=<%=pageCount%>">[마지막]</a>
			
			<% 
		}
	}
		%>
		<br>
			<iframe width="560" height="315" src="https://www.youtube.com/embed/EGwF7lXoPe8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			<iframe width="560" height="315" src="https://www.youtube.com/embed/EGwF7lXoPe8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>




