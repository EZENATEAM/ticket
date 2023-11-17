<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/resources/include/header.jsp" />

<c:if test="${ empty user }">
	<c:redirect url="/" />
</c:if>

<c:set var="level" value="user" />

<c:forEach var="authority" items="${authorities}">
	<c:if test= '${ authority.ROLE eq "ROLE_ADMIN" }'><c:set var="level" value="admin" /></c:if>
</c:forEach>

<table style="width: 32rem; margin: 0 auto;" class="table table-striped table-hover">
<%-- 	<tr><td>idx</td><td>${ user.idx }</td></tr> --%>
	<tr><td>ID</td><td>${ user.ID }</td></tr>
	<tr><td>EMAIL</td><td>${ user.EMAIL }</td></tr>
<%-- 	<tr><td>PASSWORD</td><td>${ user.PASSWORD }</td></tr> --%>
	<tr><td>NAME</td><td>${ user.NAME }</td></tr>
	<tr><td>birth</td><td>${ user.birth }</td></tr>
	<tr><td>tel</td><td>${ user.tel }</td></tr>
	<tr><td>uStat</td><td>
		<c:choose>
			<c:when test='${user.uStat eq "A"}'><button type="button" class="btn btn-primary btn-sm" disabled>활성</button></c:when>
			<c:when test='${user.uStat eq "D"}'><button type="button" class="btn btn-secondary btn-sm" disabled>비활성/휴면</button></c:when>
			<c:when test='${user.uStat eq "R"}'><button type="button" class="btn btn-danger btn-sm" disabled>탈퇴</button></c:when>
			<c:otherwise><button type="button" class="btn btn-warning btn-sm" disabled>오류</button></c:otherwise>
		</c:choose>
	</td></tr>
	<tr><td>jDate</td><td>${ user.jDate }</td></tr>
	<tr><td>authority</td><td>
		<c:choose>
			<c:when test= '${ level eq "admin" }'>
				<button type="button" class="btn btn-danger btn-sm" disabled>관리자</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-dark btn-sm" disabled>유저</button>
			</c:otherwise>
		</c:choose>
	</td></tr>
	<tr><td colspan="2">
		<c:choose>
			<c:when test= '${ level eq "admin" }'>
				<a href="${pageContext.request.contextPath}/auth/edit?idx=${user.idx}" class="btn btn-outline-primary btn-sm" >수정</a><br/>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/user/edit?idx=${user.idx}" class="btn btn-outline-primary btn-sm" >수정</a><br/>
			</c:otherwise>
		</c:choose>
	</td></tr>
</table>
<jsp:include page="/resources/admin/include/footer.jsp" />