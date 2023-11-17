<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
	<head>
		<title>Edit</title>
	</head>
	<body>
		<form:form modelAttribute="user">
			<!-- 히든 인풋 폼 작성 예 -->
			<form:hidden path="idx"/>
			<!-- readonly 속성 부여 -->
			idx : <form:input path="idx" readonly="true"/><br/>
			ID : <form:input path="ID"/><br/>
			email : <form:input path="EMAIL"/><br/>
<%--		password : <form:password path="PASSWORD" showPassword="true"/><br/> --%>
			password : ${ user.PASSWORD } // 암호화된 내용<br/>
			password : <form:password path="PASSWORD"/><br/>
			new pass : <input type="password" name="npw" /><br/>
			<!-- 기존 비번 입력시 새 비번 입력 여부를 체크하는 로직 필요 -->
			name : <form:input path="NAME"/><br/>
			birth : <form:input path="birth" type="date"/><br/>
			tel : <form:input path="tel"/><br/>
			level : <form:input path="uType"/><br/>
			stat : <form:input path="uStat"/><br/>
			<input type="submit" value="Edit"/><br/>
			<a href="${pageContext.request.contextPath}/">메인으로</a><br/>
			<a href="${pageContext.request.contextPath}/user/list">목록으로</a><br/>
		</form:form>
	</body>
</html>