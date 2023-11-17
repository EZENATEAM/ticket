<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>join</title>
	</head>
	<body>
		회원가입 페이지입니다.
		<!-- form으로 이름, 나이, id, pw, pwc를 입력받는 태그를 작성하세요 -->
		
		<br>변수로 저장된 이름 : ${ mname }
		<hr>
		<br>파라메타에 저장되어있는 이름 : ${ param.name }
		<br>파라메타에 저장되어있는 ID :${ param.id }
		<hr>
		<br>객체에 저장되어있는 이름 : ${ user.name }
		<br>객체에 저장되어있는 ID : ${ user.id }
		<hr>
		EL을 이용한 객체 내부의 배열 원소 접근<br>
		<br>객체에 저장되어있는 취미 : ${ user.hobby[0] }
		<br>객체에 저장되어있는 취미 : ${ user.hobby[1] }
		<br>객체에 저장되어있는 취미 : ${ user.hobby[2] }
		<br>객체에 저장되어있는 취미 : ${ user.hobby[3] }
		<br>객체에 저장되어있는 취미 : ${ user.hobby[4] }
		<hr>
		JSTL을 이용한 객체 내부의 배열 접근<br>
		<c:forEach var="item" items="${ user.hobby }">
			객체에 저장되어있는 취미 : ${ item }<br>
		</c:forEach>
		<hr>
		<%-- <form method="POST" action="join.do" path="user"> --%>
		<form:form modelAttribute="user" action='join.do'>
			<table>
				<tr>
					<td>이름 : </td>
					<td><input type="text" name="name" value="${ param.name }"></td>
				</tr>
				<tr>
					<td>나이 : </td>
					<td><input type="number" name="age" value="${ param.age }"></td>
				</tr>
				<tr>
					<td>ID : </td>
					<td><input type="text" name="id" value="${ param.id }"></td>
				</tr>
				<tr>
					<td>PW : </td>
					<td><input type="password" name="pw" value="${ param.pw }"></td>
				</tr>
				<tr>
					<td>PWC : </td>
					<td><input type="password" name="pwc" value="${ param.pwc }"></td>
				</tr>
				<tr>
					<td>취미 : </td>
					<td>
						<input type="checkbox" name="hobby" value="01">영화<br>
						<input type="checkbox" name="hobby" value="02">음악<br>
						<input type="checkbox" name="hobby" value="03">게임<br>
						<input type="checkbox" name="hobby" value="04">독서<br>
						<input type="checkbox" name="hobby" value="05">등산<br>
						<hr>
						<c:if test="${ not empty user.hobby }">
							<form:checkbox path="hobby" value="01" label="영화" /><br>
							<form:checkbox path="hobby" value="01" label="영화" /><br>
							<form:checkbox path="hobby" value="02" label="음악" /><br>
							<form:checkbox path="hobby" value="03" label="게임" /><br>
							<form:checkbox path="hobby" value="04" label="독서" /><br>
							<form:checkbox path="hobby" value="05" label="등산" /><br>
							<br>
							<form:checkboxes path="hobby" items="${ user.hobby }" /><br>
						</c:if>
					</td>
				</tr>
			</table>
			<input type="submit" value="가입하기">
			<input type="reset" value="취소">
		</form:form>
	</body>
</html>
