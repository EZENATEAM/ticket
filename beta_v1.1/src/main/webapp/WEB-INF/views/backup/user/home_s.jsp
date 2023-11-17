<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이젠 AWS 풀스택 ateam test web app</title>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<style>
			body	{ background-color: gray; }
			.main	{ width : 900px; margin : auto; }
			th		{ text-align : center; }
			.footer	{ height : 3rem; text-align : right; vertical-align : bottom; }
			ul		{ margin:0; }
		</style>
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
		<!-- header  영역 시작 --------------------------------------------------------------------------------- -->
		<header class="main">
			<table class="table table-borderless" style="margin:0;height: 3rem;">
				<tr>
					<td style="background-color:white;">
						<!-- 타이틀 - 메인으로 이동하는 링크 -->
						<a href="${pageContext.request.contextPath}/" style="font-size: 2rem;font-weight:bold;">Ateam test board</a>
					</td>
					<td style="text-align:right;background-color:white; vertical-align : bottom;">
						<!-- 로그인 버튼 / 유저 정보 -->
						<!-- 스프링 시큐리티 인증정보를 받아온다 -->
						<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
						<!-- 인증 정보가 없으면 로그인 버튼 -->
						<c:if test="${ user == null }">
							<a href="${pageContext.request.contextPath}/user/signup" class="btn btn-primary btn-sm">SIGNUP</a>&nbsp;
							<a href="${pageContext.request.contextPath}/user/signin" class="btn btn-success btn-sm">LOGIN</a>&nbsp;
						</c:if>
						<c:if test="${ user != null }">
							권한 : 
							<c:forEach var="authority" items="${user.authorities}">
								${authority.ROLE} &nbsp;
							</c:forEach>
							<button type="button" class="btn btn-outline-dark btn-sm" disabled>${ user.NAME }</button>
							<a href="${pageContext.request.contextPath}/user/view?idx=${user.idx}" class="btn btn-outline-danger btn-sm">계정관리</a>
							<a href="${pageContext.request.contextPath}/user/signout" class="btn btn-outline-dark btn-sm">LOGOUT</a>
						</c:if>
					</td>
				</tr>
			</table>
		</header>
		<!-- header  영역 종료 --------------------------------------------------------------------------------- -->
		<table class="main table table-bordered">
			<tr>
				<td valign="top" style="background-color:white;width:13rem;">
		<!-- nav     영역 시작 --------------------------------------------------------------------------------- -->
					<nav class="d-grid gap-2 col-10 mx-auto">
						<a href="${pageContext.request.contextPath}/board/list.do" class="btn btn-dark">회원관리</a>
						<a href="" class="btn btn-light">축제관리</a>
						<a href="" class="btn btn-light">예약관리</a>
					</nav>
		<!-- nav     영역 시작 --------------------------------------------------------------------------------- -->
				</td>
				<td style="background-color:white;">
		<!-- section 영역 시작 --------------------------------------------------------------------------------- -->
					<section>
		<!-- section 내부 header 영역 시작 --------------------------------------------------------------------- -->
						<header>
							<div style="font-size:1.2rem;font-weight:bold;">board1</div>
							<div style="width:100%; text-align:right;">
								<a href="${pageContext.request.contextPath}/board/write.do" class="btn btn-warning btn-sm">글쓰기</a>
							</div>
							<form method="get" action="list.do">
								<select name="searchType">
									<option value="title" <c:if test="${ param.searchType eq 'title' }">selected</c:if> >제목</option>
									<option value="note" <c:if test="${ param.searchType eq 'note' }">selected</c:if> >내용</option>
								</select>
								<input type="text" name="searchVal" value="${ param.searchVal }">
								<button>검색</button>
								<select name="sortCol">
									<option value="title" <c:if test="${ param.sortCol eq 'title' }">selected</c:if> >제목</option>
									<option value="wdate" <c:if test="${ param.sortCol eq 'wdate' }">selected</c:if> >작성일</option>
								</select>
								<select name="sortOrder">
									<option value="DESC" <c:if test="${ param.sortOrder eq 'DESC' }">selected</c:if> >내림차순</option>
									<option value="ASC" <c:if test="${ param.sortOrder eq 'ASC' }">selected</c:if> >올림차순</option>
								</select>
								<select id="pageNum" name="page">
								</select>
							</form>
						</header>
		<!-- section 내부 header 영역 종료 --------------------------------------------------------------------- -->
		<!-- section 내부 section 영역 시작 -------------------------------------------------------------------- -->
						<section id="sec_list">
						</section>
		<!-- section 내부 section 영역 종료 -------------------------------------------------------------------- -->
		<!-- section 내부 footer 영역 시작 --------------------------------------------------------------------- -->
						<footer>
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
							</ul>
						</footer>
		<!-- section 내부 footer 영역 종료 --------------------------------------------------------------------- -->
					</section>
		<!-- section 영역 종료 --------------------------------------------------------------------------------- -->
				</td>
			</tr>
		</table>
		<!-- footer 영역 시작 ---------------------------------------------------------------------------------- -->
		<footer class="main footer" style="background-color:white;">
			Copyright by EZEN IT All right reserved. <br>${serverTime}
			<br>
			<c:forEach var="item" items="${arr}">
			${ item } &nbsp;
			</c:forEach>
			<c:forEach var="item" items="${arry}">
			${ item } &nbsp;
			</c:forEach>
		</footer>
		<!-- footer 영역 종료 ---------------------------------------------------------------------------------- -->
	<%-- <img src="/resources/image/cat.jpg" width="100px"><br>
	<img src="./resources/image/cat.jpg" width="100px"><br>
	<img src="<%=request.getContextPath()%>/resources/image/cat.jpg" width="100px"><br> --%>
<%-- 	<a href="<%= request.getContextPath() %>/fileupload.do">파일 업로드하러가기!!</a>
	<a href="${pageContext.request.contextPath}/fileupload.do">파일 업로드하러가기!!</a> --%>
	</body>
</html>
