<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/resources/admin/include/header.jsp" />

			<a style="margin-left:200px " href="Festival.jsp">축제목록</a>
			<div class="right-align">
			    <button id="toggleRegions">지역</button>
			    <button id="toggleRegions" onclick="location.href='${pageContext.request.contextPath}/admin/Festival_add'">축제추가</button>
			</div>
	
			<div id="regions" class="table-container" style="display: none;">
			    서울 경기 인천 강원 경북 대구 울산 경남 <br>
			    부산 충북 충남 대전 전북 전남 광주 제주
			</div>
		
			<script>
		    // 버튼과 지역 상자의 DOM 요소 가져오기
		    const toggleButton = document.getElementById('toggleRegions');
		    const regionsBox = document.getElementById('regions');
		    
		
		    // 버튼 클릭 이벤트 리스너 추가
		    toggleButton.addEventListener('click', function() {
		        // 지역 상자의 현재 표시 여부 확인
		        const isHidden = regionsBox.style.display === 'none' || regionsBox.style.display === '';
		
		        // 지역 상자를 표시하거나 숨김
		        if (isHidden) {
		            regionsBox.style.display = 'table';
		        } else {
		            regionsBox.style.display = 'none';
		        }
		    });
			</script>

		
		<div class="table-container">
		
		<table>
			<tr>
				<td></td>
				<td><h4>축제명</h4></td>
				<td><h4>장소</h4></td>
				<td><h4>기간</h4></td>
				<td><h4>URL</h4></td>
			</tr>
		<c:set var="count" value="0" />
		<c:forEach var="item" items="${list}">
			<tr>
				<td><img src="${ item.referenceIdentifier }" width="100" height="100"></td>
				<td><a href="${pageContext.request.contextPath}/admin/Festival_a?idx=${item.idx}">${ item.title }</a> </td> 
				<td>${ item.spatialCoverage }</td>
				<td> 2023.10.25 ~ 11.05<%--$ {item.url} --%></td>
				<td>
					<c:choose>
						<c:when test="${fn:contains( item.sourceTitle, 'href' )}">
								${ item.sourceTitle }
						</c:when>
						<c:otherwise>
							<a href="${ item.sourceTitle }">${ item.sourceTitle }</a>
						</c:otherwise>
					</c:choose>  
				</td>
				<c:set var="count" value="${count +1}" />
			</tr>
		</c:forEach>
		</table>
		<c:out value="${count}" />
		</div>
		<jsp:include page="/resources/admin/include/footer.jsp" />