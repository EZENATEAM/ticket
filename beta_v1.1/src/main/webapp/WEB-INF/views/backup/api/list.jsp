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
		<table border="1">
			<tr>
				<td>data</td>
			</tr>
			<tr>
				<td>${ data.items }</td>
			</tr>
		</table>
	</body>
</html>