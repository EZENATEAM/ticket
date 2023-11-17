<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Ticket</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link href="${pageContext.request.contextPath}/resources/admin/css/st1.css" rel="stylesheet"/>
	</head>
	<body>
		<div class="right-align">
			<!-- 스프링 시큐리티 인증정보를 받아온다 -->
			<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
			<!-- 인증 정보가 없으면 로그인 버튼 -->
			<c:if test="${ user == null }">
				<a href="${pageContext.request.contextPath}/signup" class="btn btn-primary btn-sm">SIGNUP</a>&nbsp;
				<a href="${pageContext.request.contextPath}/signin" class="btn btn-success btn-sm">LOGIN</a>&nbsp;
			</c:if>
			<c:if test="${ user != null }">
				<button type="button" class="btn btn-outline-dark btn-sm" disabled>${ user.NAME }</button>
				<a href="${pageContext.request.contextPath}/view?idx=${user.idx}" class="btn btn-outline-danger btn-sm">계정정보</a>
				<a href="${pageContext.request.contextPath}/signout" class="btn btn-outline-dark btn-sm">LOGOUT</a><br>
				<c:forEach var="authority" items="${user.authorities}">
					${authority.ROLE}<br>
				</c:forEach>
			</c:if>
		</div>
		<hr>
		<a href="${pageContext.request.contextPath}/admin/home?key=status&value=N" class="btn btn-outline-secondary btn-sm" >미등록</a>
		<a href="${pageContext.request.contextPath}/admin/home?key=status&value=A" class="btn btn-outline-success btn-sm" >등록됨</a>
		<a href="${pageContext.request.contextPath}/admin/home?key=status&value=E" class="btn btn-outline-danger btn-sm" >종료됨</a>
		<select>
			<option value="N" <c:if test="${ param.value eq 'N' }">selected</c:if> >미등록</option>
			<option value="A" <c:if test="${ param.value eq 'A' }">selected</c:if> >등록됨</option>
			<option value="E" <c:if test="${ param.value eq 'E' }">selected</c:if> >종료됨</option>
		</select>
		<hr>
		<form method="get" action="home">
			<select name="key">
				<option value="title" <c:if test="${ param.key eq 'title' }">selected</c:if> >title</option>
				<option value="spatialCoverage" <c:if test="${ param.key eq 'spatialCoverage' }">selected</c:if> >장소</option>
				<option value="status" <c:if test="${ param.key eq 'status' }">selected</c:if> >상태</option>
			</select>
			<input type="text" name="value" value="${ param.value }">
			<button>검색</button>
			<select name="order">
				<option value="title" <c:if test="${ param.order eq 'title' }">selected</c:if> >제목</option>
				<option value="wdate" <c:if test="${ param.order eq 'wdate' }">selected</c:if> >작성일</option>
			</select>
			<select name="sort">
				<option value="DESC" <c:if test="${ param.sort eq 'DESC' }">selected</c:if> >내림차순</option>
				<option value="ASC" <c:if test="${ param.sort eq 'ASC' }">selected</c:if> >올림차순</option>
			</select>
			<select id="pageNum" name="page">
			</select>
		</form>
		<c:set var="count" value="0" />
		<c:forEach var="item" items="${list}">
			<hr>
			<hr>
			<table style="background-color:silver;">
				<tr>
					<td>
						<ul>
							<li><a href="${pageContext.request.contextPath}/user/fes_view?idx=${item.idx}">${ item.title }</a><hr></li>
							<c:if test='${not empty item.idx}'><li>idx : ${item.idx}<hr></li></c:if>
							<c:if test='${not empty item.wDate}'><li>wDate : ${item.wDate}<hr></li></c:if>
							<c:if test='${not empty item.status}'>
								<li>status : 
								<c:choose>
									<c:when test='${item.status eq "N"}'>
										<button type="button" class="btn btn-outline-secondary btn-sm" disabled>미등록</button>
									</c:when>
									<c:when test='${item.status eq "A"}'>
										<button type="button" class="btn btn-outline-success btn-sm" disabled>등록됨</button>
									</c:when>
									<c:when test='${item.status eq "E"}'>
										<button type="button" class="btn btn-outline-danger btn-sm" disabled>종료됨</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-outline-warning btn-sm" disabled>오류</button>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test='${item.status eq "N"}'>
										<a href="${pageContext.request.contextPath}/admin/raw_act?idx=${item.idx}" class="btn btn-success btn-sm">등록하기</a>
									</c:when>
									<c:when test='${item.status eq "A"}'>
										<button type="button" class="btn btn-danger btn-sm">종료하기</button>
									</c:when>
									<c:when test='${item.status eq "E"}'>
										<button type="button" class="btn btn-primary btn-sm">종료취소</button>
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/" class="btn btn-danger btn-sm">종료시키기</a>
									</c:otherwise>
								</c:choose>
								<hr>
								</li>
							</c:if>
						</ul>
					</td>
				</tr>
			</table>
			<c:set var="count" value="${count +1}" />
		</c:forEach>
		<c:out value="${count}" />
	</body>
</html>