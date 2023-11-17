<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/resources/include/header.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}"/>
		축제 등록 : 
		<c:choose>
			<c:when test='${raw.status eq "N"}'>
				<button type="button" class="btn btn-secondary btn-sm" disabled>미등록</button>
				<a href="${path}/admin/raw_toggle?idx=${raw.idx}&status=A" class="btn btn-outline-success btn-sm">등록하기</a>
			</c:when>
			<c:when test='${raw.status eq "A"}'>
				<button type="button" class="btn btn-success btn-sm" disabled>등록됨</button>
				<a href="${path}/admin/raw_toggle?idx=${raw.idx}&status=N" class="btn btn-outline-warning btn-sm">등록취소</a>
				<a href="${path}/admin/raw_toggle?idx=${raw.idx}&status=E" class="btn btn-outline-danger btn-sm">종료하기</a>
			</c:when>
			<c:when test='${raw.status eq "E"}'>
				<button type="button" class="btn btn-danger btn-sm" disabled>종료됨</button>
				<a href="${path}/admin/raw_toggle?idx=${raw.idx}&status=A" class="btn btn-outline-danger btn-sm">종료취소</a>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-warning btn-sm" disabled>오류</button>
			</c:otherwise>
		</c:choose>
		<hr>
		<c:if test='${not empty raw and raw.status eq "A"}'>
			세부 정보 : 
			<c:choose>
<%-- 				<c:when test='${empty raw}'>
					<button type="button" class="btn btn-outline-warning btn-sm" disabled>축제정보 없음</button>
				</c:when> --%>
				<c:when test='${empty festival}'>
					<button type="button" class="btn btn-secondary btn-sm" disabled>미입력</button>
<%-- 					<a href="${path}/admin/fes_post?idx=${raw.idx}" class="btn btn-outline-success btn-sm">입력하기</a> --%>
					<a href="#input_title" class="btn btn-outline-success btn-sm">입력하기</a>
				</c:when>
				<c:when test='${not empty festival}'>
					<button type="button" class="btn btn-success btn-sm" disabled>입력됨</button>
					<a href="${path}/admin/raw_toggle?idx=${raw.idx}&status=A" class="btn btn-outline-primary btn-sm">수정하기</a>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-outline-warning btn-sm" disabled>오류</button>
				</c:otherwise>
			</c:choose>
			<hr>
			<c:if test='${not empty festival}'>
				노출 설정 : 
				<c:choose>
					<c:when test='${empty festival}'>
						<button type="button" class="btn btn-outline-warning btn-sm" disabled>세부정보 없음</button>
					</c:when>
					<c:when test='${festival.status eq "N"}'><button type="button" class="btn btn-secondary btn-sm" disabled>미노출</button>
						<a href="${path}/admin/fes_toggle?idx=${festival.idx}&status=A" class="btn btn-outline-success btn-sm">노출하기</a>
					</c:when>
						<c:when test='${festival.status eq "A"}'><button type="button" class="btn btn-success btn-sm" disabled>노출중</button>
						<a href="${path}/admin/fes_toggle?idx=${festival.idx}&status=N" class="btn btn-outline-danger btn-sm">노출종료</a>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-outline-warning btn-sm" disabled>오류</button>
					</c:otherwise>
				</c:choose>
				<hr>
			</c:if>
		</c:if>
		
		<c:if test="${not empty raw}">
			open api 축제 정보
			<ul>
				<li><a href="${path}/admin/festival_a?idx=${raw.idx}">${ raw.title }</a></li>
				<c:if test='${not empty raw.idx}'><li>idx : ${raw.idx}</li></c:if>
				<c:if test='${not empty raw.wDate}'><li>wDate : ${raw.wDate}</li></c:if>
				<c:if test='${not empty raw.status}'><li>status : ${raw.status}</li></c:if>
				<c:if test='${not empty raw.alternativeTitle}'><li>alternativeTitle : ${ raw.alternativeTitle}</li></c:if>
				<c:if test='${not empty raw.creator}'><li>creator : ${ raw.creator}</li></c:if>
				<c:if test='${not empty raw.regDate}'><li>regDate : ${ raw.regDate}</li></c:if>
				<c:if test='${not empty raw.collectionDb}'><li>collectionDb : ${ raw.collectionDb}</li></c:if>
				<c:if test='${not empty raw.subjectCategory}'><li>subjectCategory : ${raw.subjectCategory}</li></c:if>
				<c:if test='${not empty raw.subjectKeyword}'><li>subjectKeyword : ${raw.subjectKeyword}</li></c:if>
				<c:if test='${not empty raw.extent}'><li>extent : ${raw.extent}</li></c:if>
				<c:if test='${not empty raw.description}'><li>description : ${raw.description}</li></c:if>
				<c:if test='${not empty raw.spatialCoverage}'><li>spatialCoverage : ${raw.spatialCoverage}</li></c:if>
				<c:if test='${not empty raw.temporalCoverage}'><li>temporalCoverage : ${raw.temporalCoverage}</li></c:if>
				<c:if test='${not empty raw.person}'><li>person : ${raw.person}</li></c:if>
				<c:if test='${not empty raw.language}'><li>language : ${raw.language}</li></c:if>
				<c:if test='${not empty raw.sourceTitle}'><li>sourceTitle : ${raw.sourceTitle}</li></c:if>
				<c:if test='${not empty raw.referenceIdentifier}'><<li>img src="${ raw.referenceIdentifier }" width=</li>"50" height=><hr></c:if>
				<c:if test='${not empty raw.rights}'><li>rights : ${ raw.rights}</li></c:if>
				<c:if test='${not empty raw.copyrightOthers}'><li>copyrightOthers : ${ raw.copyrightOthers}</li></c:if>
				<c:if test='${not empty raw.url}'><li>url : <a href='${ raw.url}&fromDt=20200101'>${ raw.url}</a></li></c:if>
				<c:if test='${not empty raw.contributor}'><li>contributor : ${ raw.contributor}</li></c:if>
				<c:if test='${not empty raw.spatialCoverage}'><li>spatialCoverage : ${ raw.spatialCoverage }</li></c:if>
				<c:if test='${not empty raw.sourceTitle}'>
					<li>sourceTitle :
					<c:choose>
						<c:when test="${fn:contains( raw.sourceTitle, 'href' )}">${ raw.sourceTitle }</c:when>
						<c:otherwise><a href="${ raw.sourceTitle }">${ raw.sourceTitle }</a></c:otherwise>
					</c:choose></li>
				</c:if>
			</ul>
			<hr>
		</c:if>
		<c:if test='${raw.status eq "A" and empty festival}'>
			<form method="post" action="${path}/admin/fes_post">
<!-- 				idx : <input type="text" name="idx" /><br>
				wDate : <input type="text" name="wDate" /><br>
				status : <input type="text" name="status" /><br> -->
				title : <input type="text" name="title" id="input_title" /><br>
				note : <input type="text" name="note" /><br>
				addr : <input type="text" name="addr" /><br>
				startDate : <input type="date" name="startDate" /><br>
				endDate : <input type="date" name="endDate" /><br>
				fTel : <input type="text" name="fTel" /><br>
				location : <input type="text" name="location" /><br>
				rIdx : <input type="text" name="rIdx" value="${raw.idx}" readonly/><br>
<!-- 				aIdx : <input type="text" name="aIdx" /><br> -->
				<input type="submit" value="세부정보등록"/><br/>
			</form>
		</c:if>
		<c:if test='${raw.status eq "A" and not empty festival}'>
			세부정보
			<ul>
				<c:if test='${not empty festival.idx}'><li>idx : ${festival.idx}</li></c:if>
				<c:if test='${not empty festival.wDate}'><li>wDate : ${festival.wDate}</li></c:if>
				<c:if test='${not empty festival.status}'><li>status : ${festival.status}</li></c:if>
				<c:if test='${not empty festival.title}'><li>title : ${festival.title}</li></c:if>
				<c:if test='${not empty festival.note}'><li>note : ${festival.note}</li></c:if>
				<c:if test='${not empty festival.addr}'><li>addr : ${festival.addr}</li></c:if>
				<c:if test='${not empty festival.startDate}'><li>startDate : ${festival.startDate}</li></c:if>
				<c:if test='${not empty festival.endDate}'><li>endDate : ${festival.endDate}</li></c:if>
				<c:if test='${not empty festival.fTel}'><li>fTel : ${festival.fTel}</li></c:if>
				<c:if test='${not empty festival.location}'><li>location : ${festival.location}</li></c:if>
				<c:if test='${not empty festival.rIdx}'><li>rIdx : ${festival.rIdx}</li></c:if>
				<c:if test='${not empty festival.aIdx}'><li>aIdx : ${festival.aIdx}</li></c:if>
			</ul>
			<hr>
		</c:if>
		<c:if test='${not empty festival and empty events}'>
			행사정보
			<form method="post" action="${path}/admin/evnt_post">
				idx : <input type="text"	name="eventList[0].idx" /><br>
				eDate : <input type="date"	name="eventList[0].eDate" /><br>
				eTime : <input type="time"	name="eventList[0].eTime" /><br>
				eTerm : <input type="time"	name="eventList[0].eTerm" /><br>
				eTitle : <input type="text"	name="eventList[0].eTitle" /><br>
				eNote : <input type="text"	name="eventList[0].eNote" /><br>
				ePlace : <input type="text"	name="eventList[0].ePlace" /><br>
				eSeats : <input type="text"	name="eventList[0].eSeats" /><br>
				etc : <input type="text"	name="eventList[0].etc" /><br>
				fIdx : <input type="text"	name="eventList[0].fIdx" value="${festival.idx}" readonly="true" /><br>
				aIdx : <input type="text"	name="eventList[0].aIdx" /><br>
				<input type="submit" value="행사정보등록"/>
			</form>
		</c:if>
		<c:if test="${not empty events}">
			<c:forEach var="event" items="${events}">
				<ul>
					<c:if test='${not empty event.idx}'><li>idx : ${event.idx}</li></c:if>
					<c:if test='${not empty event.eDate}'><li>eDate : ${event.eDate}</li></c:if>
					<c:if test='${not empty event.eTime}'><li>eTime : ${event.eTime}</li></c:if>
					<c:if test='${not empty event.eTerm}'><li>eTerm : ${event.eTerm}</li></c:if>
					<c:if test='${not empty event.eTitle}'><li>eTitle : ${event.eTitle}</li></c:if>
					<c:if test='${not empty event.eNote}'><li>eNote : ${event.eNote}</li></c:if>
					<c:if test='${not empty event.ePlace}'><li>ePlace : ${event.ePlace}</li></c:if>
					<c:if test='${not empty event.eSeats}'><li>eSeat : ${event.eSeats}</li></c:if>
					<c:if test='${not empty event.etc}'><li>etc : ${event.etc}</li></c:if>
				</ul>
				<hr>
			</c:forEach>
		</c:if>
	</body>
</html>