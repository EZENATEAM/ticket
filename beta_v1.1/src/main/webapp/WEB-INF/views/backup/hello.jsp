<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>
${pageContext.request.contextPath}
<img src="${pageContext.request.contextPath}/img/spring.png"/><br/>
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>

현재 로그인된 유저는 ${user} 입니다. 부여된 권한은 <br/>
<c:forEach var="authority" items="${user.authorities}">
    ${authority}<br/>

</c:forEach>
<a href="${pageContext.request.contextPath}/user/signup">가입하기</a>
<a href="${pageContext.request.contextPath}/user/signin">로그인</a>
<a href="${pageContext.request.contextPath}/user/signout">로그아웃</a>
<br/><br/>
<sec:authorize access="hasRole('ROLE_USER')">
    이 문장은 ROLE_USER 권한을 가진 사람에게만 보입니다.<br/>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    이 문장은 ROLE_ADMIN 권한을 가진 사람에게만 보입니다.<br/>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
    이 문장은 ROLE_USER 혹은 ROLE_ADMIN 권한을 가진 사람에게만 보입니다.<br/>
</sec:authorize>
${pageContext.request.requestURL}

</body>
</html>
