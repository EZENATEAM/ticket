<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<title>LOGIN</title>
</head>
	<body>
		<form:form action="j_spring_security_check" method="post">
			<input type="text" placeholder="email" name="j_username"/><br>
			<input type="password" placeholder="password" name="j_password"/><br>
			<input type="submit" value="LOGIN" class="btn btn-success btn-sm"/>
		</form:form>
	</body>
</html>