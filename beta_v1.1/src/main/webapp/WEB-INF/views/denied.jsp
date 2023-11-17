<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>권한없음</title>
권한이 없습니다.<br>
<hr>
${errMsg}<br>
${auth}<br>
<a href="${pageContext.request.contextPath}/">메인으로</a><br>