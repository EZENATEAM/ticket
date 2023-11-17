<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/resources/include/header.jsp" />



<style>
#pwRow {
    display: none;
}
</style>

<script>
var isEditing = false;

function memberEdit() {
	var pwRow = document.getElementById("pwRow");
    var cpNumField = document.getElementById("cpNumSpace");
    var cpNumInput = document.getElementById("cpNumInput");
    var editButton = document.getElementById("editMemberButton");

    if (!isEditing) {
        // 정보 수정 버튼이 눌렸을 때
        pwRow.style.display = 'table-row'; // 비밀번호 입력 창 보이기
        cpNumField.innerHTML = '<input type="text" name="cpNum" id="cpNumInput" placeholder="연락처 입력">';
        editButton.innerHTML = '수정 확인';
        isEditing = true;
    } else {
        // 수정 확인 버튼이 눌렸을 때
        var newcpNum = document.getElementById("cpNumInput").value;

        // 비밀번호 입력 창 숨기고 정보 수정 버튼으로 변경
        pwRow.style.display = 'none'; // 비밀번호 입력 창 숨기기
        cpNumField.innerHTML = '010 - 1234 - 5678';
        editButton.innerHTML = '정보 수정';
        isEditing = false;
    }
}


</script>
<div class="table-container">
	<table>
		<tr>
			<td>
			<table>
				<tr>
					<td>ID</td>
					<td>이름</td>
					<td>생년월일</td>
					<td>이메일</td>
					<td>연락처</td>
					<td></td>
				</tr>
				<c:if test="${not empty users}">
					<c:forEach var="user" items="${users}">
						<tr>
							<td>${user.ID}</td>
							<td>${user.NAME}</td>
							<td>${user.birth}</td>
							<td>${user.EMAIL}</td>
							<td>${user.tel}</td>
							<td>
								<a href="${pageContext.request.contextPath}/auth/edit?idx=${user.idx}">정보수정</a><br/>
								<a href="${pageContext.request.contextPath}/auth/delete?idx=${user.idx}">회원삭제</a>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			</td>
		</tr>
		
	</table>
</div>

	


<jsp:include page="/resources/admin/include/footer.jsp" />