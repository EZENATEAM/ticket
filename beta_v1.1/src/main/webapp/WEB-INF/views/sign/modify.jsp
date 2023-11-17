<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modify</title>
		<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>
		<script>
			function DoSubmit()
			{
				/* 각 입력 폼에 값이 있는지 확인 */
				// 새 비번이 입력이 되어있다면 새 비번 확인을 체크한다
				console.log($("input[name=npw]").val());
				if( $("input[name=npw]").val() != "" && $("input[name=npw]").val() != $("input[name=npwc]").val() )
				{
					alert("비번확인해주세요");
					$("input[name=npw]").val("");
					$("input[name=npwc]").val("");
					$("input[name=npw]").focus();
					return false;
				}
				// 기존 비번을 입력해야 수정 처리를 진행한다
				if( $("input[name=pw]").val() == "")
				{
					alert("기존 비번을 입력하세요");
					$("input[name=pw]").focus();
					return false;
				}
				return true;
			}
		</script>
	</head>
	<body>
		<c:if test="${ empty login }">
			<c:redirect url="/" />
		</c:if>
		회원정보 수정
		<form:form modelAttribute="user" action="modify.do" onsubmit="return DoSubmit()">
			<table>
				<tr>
					<td>이름 : </td>
					<td><input type="text" name="name" value="${ login.name }" required></td>
				</tr>
				<tr>
					<td>ID : </td>
					<td><input type="text" name="id" value="${ login.id }" readonly></td>
				</tr>
				<tr>
					<td>기존 비번 : </td>
					<td><input type="password" name="pw" required></td>
				</tr>
				<tr>
					<td>새 비번 : </td>
					<td><input type="password" name="npw"></td>
				</tr>
				<tr>
					<td>새 비번확인 : </td>
					<td><input type="password" name="npwc"></td>
				</tr>
				<tr>
					<td>주소 : </td>
					<td><input type="text" name="addr" value="${ login.addr }"></td>
				</tr>
				
			</table>
			<input type="submit" value="수정하기">
			<input type="reset" value="취소">
			<a href="<%=request.getContextPath()%>/">메인으로</a>
		</form:form>
	</body>
</html>
