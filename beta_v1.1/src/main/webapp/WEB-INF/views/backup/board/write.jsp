<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 작성</title>
	</head>
	<body>
		<form method="post" action="write.do" >
			<table>
				<tr>
					<td>제목 : </td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>내용 : </td>
					<td><textarea name="note"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="글작성">
						<input type="reset" value="취소">
						<a href="<%=request.getContextPath()%>/">메인으로</a>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>