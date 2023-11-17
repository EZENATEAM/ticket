<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>View</title>
</head>
<body>
	<c:if test="${ empty user }">
		<c:redirect url="/" />
	</c:if>
	idx: ${ user.idx }<br/>
	ID: ${ user.ID }<br/>
	email: ${ user.EMAIL }<br/>
	password: ${ user.PASSWORD }<br/>
	name: ${ user.NAME }<br/>
	birth: ${ user.birth }<br/>
	tel: ${ user.tel }<br/>
	level : ${ user.uType }<br/>
	stat : ${ user.uStat }<br/>
	<a href="${pageContext.request.contextPath}/">메인으로</a><br/>
	<a href="${pageContext.request.contextPath}/user/edit?idx=${user.idx}">수정</a><br/>
	<a href="${pageContext.request.contextPath}/user/list">목록으로</a><br/>
</body>
</html>