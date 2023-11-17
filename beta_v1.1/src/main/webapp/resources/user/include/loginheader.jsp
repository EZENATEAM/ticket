<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Ticket</title>
		<link href="${pageContext.request.contextPath}/resources/user/css/st1.css" rel="stylesheet"/>
	</head>
	
	<script>
	/* 스크롤 이벤트를 사용하여 버튼 표시 여부 제어 */
    window.addEventListener('scroll', function() {
        var scrollPosition = window.scrollY;
        var scrollButton = document.querySelector('.scroll-top');

        // 스크롤 위치가 200 이상이면 버튼을 보이게 하고 그렇지 않으면 숨김
        if (scrollPosition >= 200) {
            scrollButton.style.display = 'block';
        } else {
            scrollButton.style.display = 'none';
        }
    });
	</script>
	<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	
	<body>
		<header>
		<!-- 최상단 이동 -->
		    <div id="top"></div>
   			<a href="#top" class="scroll-top">TOP</a>
		
			<div class="center-align">
				<a href="${pageContext.request.contextPath}/user/logindex"><img style="width: 200px;" id="logo" src="${pageContext.request.contextPath}/resources/user/include/logo.png"></a>
		        <form method="post" name="searchbar" id="searchbar" action="${pageContext.request.contextPath}/user/logindex">
			        <input type="text" name="keyword" placeholder="검색어를 입력하세요">
			        <input type="submit" value="검색">
	    		</form>
	    	</div>
	    	<div class="right-align">
		        <a href="${pageContext.request.contextPath}/user/login" >로그아웃</a>&nbsp; &nbsp;
		        <a href="${pageContext.request.contextPath}/user/mypage">마이 페이지</a>
		    </div>
		    
		</header>
		
		<hr>
		<div class="wrap">
		
		