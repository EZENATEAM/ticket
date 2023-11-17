<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/resources/include/header.jsp" />
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
		<c:if test="${not empty festival}">
			<table style="background-color:silver;">
				<tr>
					<td>
						<ul>
							<c:if test='${not empty festival.idx}'><li>idx : ${festival.idx}<hr></li></c:if>
							<c:if test='${not empty festival.wDate}'><li>wDate : ${festival.wDate}<hr></li></c:if>
							<c:if test='${not empty festival.status}'><li>status : ${festival.status}<hr></li></c:if>
							<c:if test='${not empty festival.title}'><li>title : ${festival.title}<hr></li></c:if>
							<c:if test='${not empty festival.note}'><li>note : ${festival.note}<hr></li></c:if>
							<c:if test='${not empty festival.addr}'><li>addr : ${festival.addr}<hr></li></c:if>
							<c:if test='${not empty festival.startDate}'><li>startDate : ${festival.startDate}<hr></li></c:if>
							<c:if test='${not empty festival.endDate}'><li>endDate : ${festival.endDate}<hr></li></c:if>
							<c:if test='${not empty festival.fTel}'><li>fTel : ${festival.fTel}<hr></li></c:if>
							<c:if test='${not empty festival.location}'><li>location : ${festival.location}<hr></li></c:if>
							<c:if test='${not empty festival.rIdx}'><li>rIdx : ${festival.rIdx}<hr></li></c:if>
							<c:if test='${not empty festival.aIdx}'><li>aIdx : ${festival.aIdx}<hr></li></c:if>
						</ul>
					</td>
				</tr>
			</table>
		</c:if>
		<hr>
		행사정보
		<hr>
		<c:if test='${empty events}'>
		
		<button type="button" class="btn btn-success btn-sm">행사등록하기</button>
			<form:form modelAttribute="eVo" onsubmit="return DoSubmit()">
				idx : <form:input path="idx" /><br>
				eDate : <form:input path="eDate" /><br>
				eTime : <form:input path="eTime" /><br>
				eTitle : <form:input path="eTitle" /><br>
				eNote : <form:input path="eNote" /><br>
				ePlace : <form:input path="ePlace" /><br>
				eSeats : <form:input path="eSeats" /><br>
				etc : <form:input path="etc" /><br>
				<input type="submit" value="행사정보등록"/>
			</form:form>
		
		</c:if>
		<c:if test="${not empty events}">
			<table style="background-color:silver;">
				<c:forEach var="event" items="${events}">
					<tr>
						<td>
							<ul>
								<c:if test='${not empty event.idx}'><li>idx : ${event.idx}<hr></li></c:if>
								<c:if test='${not empty event.eDate}'><li>eDate : ${event.eDate}<hr></li></c:if>
								<c:if test='${not empty event.eTime}'><li>eTime : ${event.eTime}<hr></li></c:if>
								<c:if test='${not empty event.eTitle}'><li>eTitle : ${event.eTitle}<hr></li></c:if>
								<c:if test='${not empty event.eNote}'><li>eNote : ${event.eNote}<hr></li></c:if>
								<c:if test='${not empty event.ePlace}'><li>ePlace : ${event.ePlace}<hr></li></c:if>
								<c:if test='${not empty event.eSeat}'><li>eSeat : ${event.eSeat}<hr></li></c:if>
								<c:if test='${not empty event.etc}'><li>etc : ${event.etc}<hr></li></c:if>
								<c:if test='${not empty event.fIdx}'><li>etc : ${event.fIdx}<hr></li></c:if>
								<c:if test='${not empty event.aIdx}'><li>etc : ${event.aIdx}<hr></li></c:if>
							</ul>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</body>
</html>