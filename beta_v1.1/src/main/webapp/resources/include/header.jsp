<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 

// 전체 경로
<%=request.getRequestURL()%>								http://localhost:8080/festival/WEB-INF/views/admin/home.jsp
${pageContext.request.requestURL}							http://localhost:8080/festival/WEB-INF/views/admin/home.jsp

// 프로젝트 경로부터 파일까지의 경로
<%=request.getRequestURI()%>								/festival/WEB-INF/views/admin/home.jsp
${pageContext.request.requestURI}							/festival/WEB-INF/views/admin/home.jsp

//프로젝트의 경로값
<%=request.getContextPath()%>								/festival
${pageContext.request.contextPath}							/festival


// ViewResolver가 찾는 파일의 경로와 파일명
<%=request.getServletPath()%>								/WEB-INF/views/admin/home.jsp

// 서블렛에게 호출되는 주소
${requestScope['javax.servlet.forward.servlet_path']}		/admin/home

// 서버에 요청되는 주소
${requestScope['javax.servlet.forward.request_uri']}		/festival/admin/home

// 짧게 쓰기
<c:url value="/admin/home" />								/festival/admin/home

 -->
<!-- 메인 주소용 -->
<c:set var="mPath" value="${pageContext.request.contextPath}"/>
<!-- 사용자 인증정보 -->
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<!-- 인증 정보가 있으면, 사용자 권한 저장 -->
<c:choose>
	<c:when test="${not empty user}">
		<c:set var="level" value="user" />
		<c:forEach var="authority" items="${user.authorities}">
			<c:if test='${fn:contains(authority, "ADMIN")}'>
				<c:set var="level" value="ADMIN" />
			</c:if>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<c:set var="level" value="" />
	</c:otherwise>
</c:choose>

<!DOCTYPE html>
<html>
	<head>
		<title>Ticket</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link href="${mPath}/resources/css/main.css" rel="stylesheet"/>
		<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<!-- 		<script src="http://code.jquery.com/jquery-1.12.4.js"></script> -->
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
			
			window.name="parentWin";
			
			// 새 창으로 가운데 정렬
			function openPopup(url) {
				const popupWidth = 600;
				const popupHeight = 700;
				var popupX = Math.round(window.screenX + (window.outerWidth/2) - (popupWidth/2));
				var popupY = Math.round(window.screenY + (window.outerHeight/2) - (popupHeight/2));
				var featureWindow = "width=" + popupWidth + ", height="+popupHeight + ", left=" + popupX + ", top=" + popupY;
				//let option = `width=\${_width}px, height=\${_height}px, left=\${_left}px, top=\${_top}px`;
				window.open(url, 'popWin', featureWindow );
			}
		</script>
	</head>
	
	<body>
		<header>
			<!-- 최상단 이동 -->
			<div id="top"></div>
			<a href="#top" class="scroll-top">TOP</a>
			
			<div class="center-align">
				<a href="${mPath}/" ><img style="width: 200px;" id="logo" src="${pageContext.request.contextPath}/img/logo.png"></a>
				<form method="post" name="searchbar" id="searchbar" action="${mPath}/">
					<input type="text" name="query" placeholder="검색어를 입력하세요">
					<input type="submit" value="검색">
				</form>
			</div>
			<hr>
			<div class="right-align">
				<!-- 인증 정보가 없으면 로그인 버튼 -->
				<c:if test="${empty user}">
					<a href="${mPath}/signup" onclick="openPopup(this.href); return false;" class="btn btn-primary btn-sm">회원가입</a>&nbsp;
					<a href="${mPath}/signin" class="btn btn-success btn-sm">로그인</a>&nbsp;
				</c:if>
				<!-- 인증 정보가 있으면 메뉴 표시 -->
				<c:if test="${not empty user}">
					<button type="button" class="btn btn-outline-dark btn-sm" disabled>${user.NAME}</button>
					<!-- 인증 정보에 관리자 권한이 있으면 -->
<%-- 					<c:forEach var="authority" items="${user.authorities}">
						<button type="button" class="btn btn-outline-dark btn-sm" disabled>${authority.ROLE}</button>
					</c:forEach> --%>
					<c:choose>
						<c:when test='${not empty level and fn:contains(level, "ADMIN")}'>
							<a href="${mPath}/auth/view?idx=${user.idx}" class="btn btn-outline-danger btn-sm">계정정보</a>
						</c:when>
						<c:otherwise>
							<a href="${mPath}/user/view?idx=${user.idx}" class="btn btn-outline-danger btn-sm">계정정보</a>
						</c:otherwise>
					</c:choose>
					<a href="${mPath}/signout" class="btn btn-outline-dark btn-sm">로그아웃</a><br>
				</c:if>
			</div>
			<hr>
			<!-- 권한에 따라 메뉴 표시 -->
			<c:choose>
				<c:when test='${not empty level and fn:contains(level, "ADMIN")}'>
					<c:set var="now" value="${requestScope['javax.servlet.forward.servlet_path']}" />
					<a href="${mPath}/admin/home" class="btn btn-<c:if test="${not fn:contains(now, 'home')}" >outline-</c:if>primary btn-sm" >메인으로</a>
					<a href="${mPath}/admin/raw_list" class="btn btn-<c:if test="${not fn:contains(now, 'raw')}" >outline-</c:if>dark btn-sm" >API</a>
					<a href="${mPath}/admin/fes_list" class="btn btn-<c:if test="${not fn:contains(now, 'fes')}" >outline-</c:if>success btn-sm" >축제</a>
					<a href="${mPath}/admin/evnt_list" class="btn btn-<c:if test="${not fn:contains(now, 'evnt')}" >outline-</c:if>danger btn-sm" >행사</a>
					<a href="${mPath}/admin/resv_list" class="btn btn-<c:if test="${not fn:contains(now, 'evnt')}" >outline-</c:if>warning btn-sm" >예약</a>
					<a href="${mPath}/admin/Membership" class="btn btn-<c:if test="${not fn:contains(now, 'Member')}" >outline-</c:if>info btn-sm" >사용자</a>
					<hr>
				</c:when>
				<c:otherwise>
					<a href="${mPath}/user/fes" class="btn btn-outline-primary btn-sm" >메인으로</a>
					<a href="${mPath}/user/mypage" class="btn btn-outline-danger btn-sm" >마이 페이지</a>
					<hr>
				</c:otherwise> 
			</c:choose>
		</header>
		<div class="wrap">