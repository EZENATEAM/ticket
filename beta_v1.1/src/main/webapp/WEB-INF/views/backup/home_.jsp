<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
	<h1>
		Hello world!  
	</h1>
		한글 한글
	
	<P>  The time on the server is ${serverTime}. </P>
	<br>
	<a href="./ajax/main.do" >ajax 실습</a><br>
	<a href="./test" >서블렛을 이용한 새로운 페이지</a>
	<br>
	<a href="./sample" >컨트롤러를 이용한 새로운 페이지</a>
	<br>
	<a href="./user/join.do" >회원가입</a>
	<br>
	<c:if test="${ login == null }">
		<a href="./user/login.do" >로그인하기</a>
		<br>
	</c:if>
	<c:if test="${ login != null }">
		${ login.id }<br>
		${ login.name }<br>
		<a href="./user/view.do" >정보보기</a>
		<a href="./user/logout.do" >로그아웃하기</a>
		<br>
		<a href="./board/write.do" >새 글 쓰기</a><br>
	</c:if>
	<a href="./board/list.do" >글 목록 보기</a>
	<%-- <img src="/resources/image/cat.jpg" width="100px"><br>
	<img src="./resources/image/cat.jpg" width="100px"><br>
	<img src="<%=request.getContextPath()%>/resources/image/cat.jpg" width="100px"><br> --%>
	<br>
	<hr>
	<a href="<%= request.getContextPath() %>/fileupload.do">파일 업로드하러가기!!</a>
	<a href="${pageContext.request.contextPath}/fileupload.do">파일 업로드하러가기!!</a>
	</body>
</html>
