<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/resources/include/header.jsp" />
		<hr>
		<c:choose>
			<c:when test='${raw.status eq "N"}'><button type="button" class="btn btn-outline-secondary btn-sm" disabled>미등록</button></c:when>
			<c:when test='${raw.status eq "A"}'><button type="button" class="btn btn-outline-success btn-sm" disabled>등록됨</button></c:when>
			<c:when test='${raw.status eq "E"}'><button type="button" class="btn btn-outline-danger btn-sm" disabled>종료됨</button></c:when>
			<c:otherwise><button type="button" class="btn btn-outline-warning btn-sm" disabled>오류</button></c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test='${raw.status eq "N"}'><button type="button" class="btn btn-success btn-sm">등록하기</button></c:when>
			<c:when test='${raw.status eq "A"}'><button type="button" class="btn btn-danger btn-sm">종료하기</button></c:when>
			<c:when test='${raw.status eq "E"}'><button type="button" class="btn btn-primary btn-sm">종료취소</button></c:when>
			<c:otherwise><a href="${pageContext.request.contextPath}/" class="btn btn-danger btn-sm">종료시키기</a></c:otherwise>
		</c:choose>
		<hr>
		open api 축제 정보
		<table style="background-color:silver;">
			<tr>
				<td>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/vo_a?idx=${raw.idx}">${ raw.title }</a><hr></li>
						<c:if test='${not empty raw.idx}'><li>idx : ${raw.idx}<hr></li></c:if>
						<c:if test='${not empty raw.wDate}'><li>wDate : ${raw.wDate}<hr></li></c:if>
						<c:if test='${not empty raw.status}'><li>status : ${raw.status}<hr></li></c:if>
						<c:if test='${not empty raw.alternativeTitle}'><li>alternativeTitle : ${ raw.alternativeTitle}<hr></li></c:if>
						<c:if test='${not empty raw.creator}'><li>creator : ${ raw.creator}<hr></li></c:if>
						<c:if test='${not empty raw.regDate}'><li>regDate : ${ raw.regDate}<hr></li></c:if>
						<c:if test='${not empty raw.collectionDb}'><li>collectionDb : ${ raw.collectionDb}<hr></li></c:if>
						<c:if test='${not empty raw.subjectCategory}'><li>subjectCategory : ${raw.subjectCategory}<hr></li></c:if>
						<c:if test='${not empty raw.subjectKeyword}'><li>subjectKeyword : ${raw.subjectKeyword}<hr></li></c:if>
						<c:if test='${not empty raw.extent}'><li>extent : ${raw.extent}<hr></li></c:if>
						<c:if test='${not empty raw.description}'><li>description : ${raw.description}<hr></li></c:if>
						<c:if test='${not empty raw.spatialCoverage}'><li>spatialCoverage : ${raw.spatialCoverage}<hr></li></c:if>
						<c:if test='${not empty raw.temporalCoverage}'><li>temporalCoverage : ${raw.temporalCoverage}<hr></li></c:if>
						<c:if test='${not empty raw.person}'><li>person : ${raw.person}<hr></li></c:if>
						<c:if test='${not empty raw.language}'><li>language : ${raw.language}<hr></li></c:if>
						<c:if test='${not empty raw.sourceTitle}'><li>sourceTitle : ${raw.sourceTitle}<hr></li></c:if>
						<c:if test='${not empty raw.referenceIdentifier}'><<li>img src="${ raw.referenceIdentifier }" width=</li>"50" height="50"><hr></c:if>
						<c:if test='${not empty raw.rights}'><li>rights : ${ raw.rights}<hr></li></c:if>
						<c:if test='${not empty raw.copyrightOthers}'><li>copyrightOthers : ${ raw.copyrightOthers}<hr></li></c:if>
						<c:if test='${not empty raw.url}'><li>url : <a href='${ raw.url}&fromDt=20200101'>${ raw.url}</a><hr></li></c:if>
						<c:if test='${not empty raw.contributor}'><li>contributor : ${ raw.contributor}<hr></li></c:if>
						<c:if test='${not empty raw.spatialCoverage}'><li>spatialCoverage : ${ raw.spatialCoverage }<hr></li></c:if>
						<c:if test='${not empty raw.sourceTitle}'>
							<li>sourceTitle :
							<c:choose>
								<c:when test="${fn:contains( raw.sourceTitle, 'href' )}">${ raw.sourceTitle }</c:when>
								<c:otherwise><a href="${ raw.sourceTitle }">${ raw.sourceTitle }</a></c:otherwise>
							</c:choose></li>
						</c:if>
					</ul>
				</td>
			</tr>
		</table>
		<hr>
		세부정보
		<hr>
			<table style="background-color:silver;">
				<tr>
					<td>
						<ul>
							<form:form modelAttribute="vo" onsubmit="return DoSubmit()">
								idx : <form:input path="idx" /><br>
								wDate : <form:input path="wDate" /><br>
								status : <form:input path="status" /><br>
								title : <form:input path="title" /><br>
								note : <form:input path="note" /><br>
								addr : <form:input path="addr" /><br>
								startDate : <form:input path="startDate" /><br>
								endDate : <form:input path="endDate" /><br>
								fTel : <form:input path="fTel" /><br>
								location : <form:input path="location" /><br>
								rIdx : <form:input path="rIdx" value="${raw.idx}"/><br>
								aIdx : <form:input path="aIdx" /><br>
								<input type="submit" value="세부정보등록"/><br/>
							</form:form>
						</ul>
					</td>
				</tr>
			</table>
	</body>
</html>