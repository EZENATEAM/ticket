<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/resources/include/header.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}"/>

		DB에 저장된 축제 원본 데이터 : ${total}<br>
		<form method="get" action="raw_list">
			<a href="${requestScope['javax.servlet.forward.request_uri']}?key=status&value=N" class="btn btn<c:if test="${ 'N' ne param.value }">-outline</c:if>-secondary btn-sm" >미등록</a>
			<a href="${requestScope['javax.servlet.forward.request_uri']}?key=status&value=A" class="btn btn<c:if test="${ param.value ne 'A' }">-outline</c:if>-success btn-sm" >등록됨</a>
			<a href="${requestScope['javax.servlet.forward.request_uri']}?key=status&value=E" class="btn btn<c:if test="${ param.value ne 'E' }">-outline</c:if>-danger btn-sm" >종료됨</a>

			<select name="key">
				<option value="title" <c:if test="${ param.key eq 'title' }">selected</c:if> >title</option>
				<option value="spatialCoverage" <c:if test="${ param.key eq 'spatialCoverage' }">selected</c:if> >장소</option>
				<option value="status" <c:if test="${ param.key eq 'status' }">selected</c:if> >상태</option>
			</select>
			<input type="text" name="value" value="${ param.value }">
			<!-- 페이징 확인 -->
<%--		<input type="text" name="curPage" value="${ param.curPage }">
			<input type="text" name="perPage" value="${ param.perPage }"> --%>
			<button>검색</button>
			<select name="order">
				<option value="title" <c:if test="${ param.order eq 'title' }">selected</c:if> >제목</option>
				<option value="wDate" <c:if test="${ param.order eq 'wDate' }">selected</c:if> >DB등록일</option>
				<option value="regDate" <c:if test="${ param.order eq 'regDate' }">selected</c:if> >api등록일</option>
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
			<table>
				<tr>
					<td>
						<details>
							<summary>
								<c:choose>
									<c:when test='${item.status eq "N"}'>
										<button type="button" class="btn btn-secondary btn-sm" disabled>미등록</button>
									</c:when>
									<c:when test='${item.status eq "A"}'>
										<button type="button" class="btn btn-success btn-sm" disabled>등록됨</button>
									</c:when>
									<c:when test='${item.status eq "E"}'>
										<button type="button" class="btn btn-danger btn-sm" disabled>종료됨</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-warning btn-sm" disabled>오류</button>
									</c:otherwise>
								</c:choose>
								${ item.title }
							</summary>
							<ul>
								<li>${item.idx} : <a href="${path}/admin/raw_view?idx=${item.idx}">${ item.title }</a></li>
								<c:if test='${not empty item.wDate}'><li>wDate : ${item.wDate}</li></c:if>
								<c:if test='${not empty item.status}'>
									<li>status : 
<%-- 									<c:choose>
										<c:when test='${item.status eq "N"}'><button type="button" class="btn btn-secondary btn-sm" disabled>미등록</button></c:when>
										<c:when test='${item.status eq "A"}'><button type="button" class="btn btn-success btn-sm" disabled>등록됨</button></c:when>
										<c:when test='${item.status eq "E"}'><button type="button" class="btn btn-danger btn-sm" disabled>종료됨</button></c:when>
										<c:otherwise><button type="button" class="btn btn-warning btn-sm" disabled>오류</button></c:otherwise>
									</c:choose> --%>
									<c:choose>
										<c:when test='${item.status eq "N"}'><a href="${path}/admin/raw_toggle?idx=${item.idx}&status=A" class="btn btn-outline-success btn-sm">등록하기</a></c:when>
										<c:when test='${item.status eq "A"}'><a href="${path}/admin/raw_toggle?idx=${item.idx}&status=N" class="btn btn-outline-warning btn-sm">등록취소</a>
											<a href="${path}/admin/raw_toggle?idx=${item.idx}&status=E" class="btn btn-outline-danger btn-sm">종료하기</a></c:when>
										<c:when test='${item.status eq "E"}'><a href="${path}/admin/raw_toggle?idx=${item.idx}&status=A" class="btn btn-outline-danger btn-sm">종료취소</a></c:when>
										<c:otherwise><button type="button" class="btn btn-warning btn-sm" disabled>오류</button></c:otherwise>
									</c:choose>
									</li>
									<c:if test='${not empty item.url}'><li>url : <a href='${ item.url}&fromDt=20200101' target='_blank'>${ item.url}</a></li></c:if>
								</c:if>
							</ul>
						</details>
					</td>
				</tr>
			</table>
			<c:set var="count" value="${count +1}" />
		</c:forEach>
		
	</body>
</html>