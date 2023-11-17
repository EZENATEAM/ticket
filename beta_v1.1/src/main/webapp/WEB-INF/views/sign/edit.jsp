<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/resources/include/header.jsp" />

<c:if test="${ empty user }">
	<c:redirect url="/" />
</c:if>

<c:set var="level" value="user" />

<c:forEach var="authority" items="${authorities}">
	<c:if test= '${ authority.ROLE eq "ROLE_ADMIN" }'><c:set var="level" value="admin" /></c:if>
</c:forEach>
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
		if( $("input[name=PASSWORD]").val() == "")
		{
			alert("기존 비번을 입력하세요");
			$("input[name=PASSWORD]").focus();
			return false;
		}
		return true;
	}
</script>
		<form:form modelAttribute="user" onsubmit="return DoSubmit()">
			<table style="width: 32rem; margin: 0 auto;" class="table table-striped table-hover">
				<tr><td>idx</td>
					<td>idx : <form:input path="idx" readonly="true"/></td></tr>
				<tr><td>ID</td>
					<td>ID : <form:input path="ID"/></td></tr>
				<tr><td>email : <form:input path="EMAIL"/></td>
					<td>email : <form:input path="EMAIL"/></td></tr>
				<tr><td>password : <form:password path="PASSWORD" showPassword="true"/><br/></td>
					<td>password : <form:password path="PASSWORD" showPassword="true"/><br/></td></tr>
				<tr><td>password : ${ user.PASSWORD } // 암호화된 내용</td>
					<td>password : ${ user.PASSWORD } // 암호화된 내용</td></tr>
				<tr><td>password : <form:password path="PASSWORD"/></td>
					<td>password : <form:password path="PASSWORD"/></td></tr>
				<tr><td>new pass : <input type="password" name="npw" /></td>
					<td>new pass : <input type="password" name="npw" /></td></tr>
				<tr><td>new pwc : <input type="password" name="npwc" /></td>
					<td>new pwc : <input type="password" name="npwc" /></td></tr>
				<tr><td>name : <form:input path="NAME"/><br/></td>
					<td>name : <form:input path="NAME"/><br/></td></tr>
				<tr><td>birth : <form:input path="birth" type="date"/><br/></td><td>birth : <form:input path="birth" type="date"/><br/></td></tr>
				<tr><td>tel : <form:input path="tel"/><br/></td>
					<td>tel : <form:input path="tel"/><br/></td></tr>
				<tr><td>uStat : <form:input path="uStat"/><br/></td>
					<td>uStat : <form:input path="uStat"/><br/></td></tr>
				<tr><td>jDate : <form:input path="jDate" type="datetime-local"/><br/></td>
					<td>jDate : <form:input path="jDate" type="datetime-local"/><br/></td></tr>
				<tr><td></td><td></td></tr>
				<tr><td></td><td></td></tr>
				<tr><td></td><td></td></tr>
				<tr><td></td><td></td></tr>
				<tr><td></td><td></td></tr>
				<tr><td></td><td></td></tr>
				<tr><td></td><td></td></tr>
			</table>
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
			new pwc : <input type="password" name="npwc" /><br/>
			<!-- 기존 비번 입력시 새 비번 입력 여부를 체크하는 로직 필요 -->
			name : <form:input path="NAME"/><br/>
			birth : <form:input path="birth" type="date"/><br/>
			tel : <form:input path="tel"/><br/>
			uStat : <form:input path="uStat"/><br/>
			jDate : <form:input path="jDate" type="datetime-local"/><br/>
			<input type="submit" value="Edit"/><br/>
			<a href="${pageContext.request.contextPath}/">메인으로</a><br/>
			<a href="${pageContext.request.contextPath}/list">목록으로</a><br/>
		</form:form>
<jsp:include page="/resources/admin/include/footer.jsp" />