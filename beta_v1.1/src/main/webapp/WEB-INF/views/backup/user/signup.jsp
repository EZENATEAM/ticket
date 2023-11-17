<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
	<title>Signup</title>
</head>
<body>
<form:form modelAttribute="user">
	ID : <form:input path="ID"/><br/>
	email : <form:input path="EMAIL"/><br/>
	password : <form:password path="PASSWORD"/><br/>
	name : <form:input path="NAME"/><br/>
	birth : <form:input path="birth"/><br/>
	tel : <form:input path="tel"/><br/>
	uType : <form:input path="uType"/><br/>
	uStat : <form:input path="uStat"/><br/>
	<input type="submit" value="Signup"/>
</form:form>
</body>
</html>