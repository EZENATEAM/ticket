<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/resources/include/header.jsp" />
		<form method="get" action="home">
			<a href="${pageContext.request.contextPath}/admin/fes_list?key=status&value=N" class="btn btn-outline-secondary btn-sm" >미노출</a>
			<a href="${pageContext.request.contextPath}/admin/fes_list?key=status&value=A" class="btn btn-outline-success btn-sm" >노출중</a>
			<select>
				<option value="N" <c:if test="${ param.value eq 'N' }">selected</c:if> >미노출</option>
				<option value="A" <c:if test="${ param.value eq 'A' }">selected</c:if> >노출중</option>
			</select>
			&nbsp;&nbsp;
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
							<li><a href="${pageContext.request.contextPath}/admin/fes_view?idx=${item.rIdx}">${ item.title }</a><hr></li>
							<c:if test='${not empty item.idx}'><li>idx : ${item.idx}<hr></li></c:if>
							<c:if test='${not empty item.wDate}'><li>wDate : ${item.wDate}<hr></li></c:if>
							<c:if test='${not empty item.status}'>
								<li>status : 
								<c:choose>
									<c:when test='${item.status eq "N"}'>
										<button type="button" class="btn btn-outline-secondary btn-sm" disabled>미노출</button>
									</c:when>
									<c:when test='${item.status eq "A"}'>
										<button type="button" class="btn btn-outline-success btn-sm" disabled>노출중</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-outline-warning btn-sm" disabled>오류</button>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test='${item.status eq "N"}'>
										<a href="${pageContext.request.contextPath}/admin/fes_toggle?idx=${item.idx}&status=A" class="btn btn-success btn-sm">노출하기</a>
									</c:when>
									<c:when test='${item.status eq "A"}'>
										<a href="${pageContext.request.contextPath}/admin/fes_toggle?idx=${item.idx}&status=N" class="btn btn-danger btn-sm">종료하기</a>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-outline-warning btn-sm" disabled>오류</button>
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