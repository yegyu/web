<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg_list = "게시판에 글이 없습니다.";
	String msg_passwd ="비밀번호를 다시 입력하세요";
	String msg_modify = "수정할 정보를 입력하세요";
	
	
	//게시판
	String project = "/JSP/board/";
	String page_list = "글 목록";
	String page_write = "글쓰기";
	String page_content = "글 목록";
	String page_delete = "글삭제";
	String page_re_write ="답글 쓰기";
	String page_modify = "글 수정";
	
	
	String str_write = "글쓰기";
	String str_cnt = "전체 글";
	String str_num = "번호";
	String str_number = "글 번호";
	String str_subject="글제목";
	String str_writer="작성자";
	String str_reg_date="작성일";
	String str_readcount="조회수";
	String str_ip = "IP";
	String str_list="글목록";
	String str_email ="이메일";
	String str_content = "글내용";
	String str_passwd="비밀번호";
	
	String btn_write="작성";
	String btn_cancel="취소";
	String btn_list="목록";
	String btn_mod="수정";
	String btn_mod_cancel = "수정 취소";
	String btn_del = "삭제";
	String btn_reply="답글";
	String btn_del_cancel="삭제 취소";
	
%>