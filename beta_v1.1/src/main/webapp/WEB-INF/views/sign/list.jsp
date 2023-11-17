<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>User list</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/">메인으로</a>
<br>
<table border=1>
  <thead>
  <tr>
    <td>ID</td>
    <td>이름</td>
    <td>E-mail</td>
    <td>비밀번호</td>
    <td>생년</td>
    <td>전화</td>
    <td>상태</td>
    <td></td>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="u" items="${users}">
    <tr>
      <td>${u.ID}</td>
      <td>${u.NAME}</td>
      <td>${u.EMAIL}</td>
      <td>${u.PASSWORD}</td>
      <td>${u.birth}</td>
      <td>${u.tel}</td>
      <td>${u.uStat}</td>
      <td>
      	<a href="${pageContext.request.contextPath}/">메인으로</a><br/><br/>
        <a href="${pageContext.request.contextPath}/auth/edit?idx=${u.idx}">수정</a><br/>
        <a href="${pageContext.request.contextPath}/auth/delete?idx=${u.idx}">삭제</a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

</body>
</html>
