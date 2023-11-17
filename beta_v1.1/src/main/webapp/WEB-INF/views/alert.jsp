<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>message</title>
		<script>
			top.alert("${msg.message}");
			top.location.href="${msg.href}";
		</script>
	</head>
</html>