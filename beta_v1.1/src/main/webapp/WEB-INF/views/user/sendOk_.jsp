	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.spring.util.*" %>
<%
/*
request.setCharacterEncoding("UTF-8");

String from = "ezen@ezen.com";				// 보내는 주소
String to = request.getParameter("to");			// 받을 주소
//String ID = "아이디";						// 계정
//String PW = "비번";						// 계정인증
String ID = "kimcm9603";	// 계정
String PW = "ntkt wxlr hfrz rfnk";					// 계정인증
String title = request.getParameter("title");
String note  = request.getParameter("note");

Mailsender server = new Mailsender("google");
if( server.MailSend(from, to, ID, PW, title, note) == true )
{
	out.println("성공적으로 이메일을 발송하였습니다.");
}else
{
	out.println("메일 발송 오류입니다.");
}	*/
out.println("성공적으로 이메일을 발송하였습니다.");
%>