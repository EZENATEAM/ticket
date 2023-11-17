<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 목록</title>
	</head>
	<body>
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
		</form>
		<table border="1">
			<tr>
				<td>글 번호</td>
				<td>제목</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>작성자</td>
			</tr>
			<c:forEach var="item" items="${ list }">
			<tr>
				<td>${ item.bidx }</td>
				<td>
					<a href="${pageContext.request.contextPath}/board/view.do?bidx=${item.bidx}">
						${ item.title } ${ item.count } 
					</a>
				</td>
				<td>
				<!-- parseDate 는 value의 값을 받아 pattern으로 날짜 정보를 인식하고 var의 이름으로 '저장'합니다 -->
				<fmt:parseDate value="${ item.wdate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parseDate" type="both" />
				<!-- formatDatesms value의 값을 받아 표현식을 바꿔 '출력'합니다. -->
				<fmt:formatDate value="${ parseDate }" dateStyle="short" type="date" />
				</td>
				<td>${ item.hit }</td>
				<td>${ item.name }</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="9">
					<!-- <a href="list.do">목록으로</a> -->
					<a href="${pageContext.request.contextPath}/board/write.do" >새 글 쓰기</a>
					<a href="<%=request.getContextPath()%>/">메인으로</a>
				</td>
			</tr>
		</table>
	</body>
</html>