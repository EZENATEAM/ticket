<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/resources/include/header.jsp" />
<script>
$(document).ready(function(){
	var key = getCookie("idChk");
	if(key!=""){
		$("#idin").val(key); 
	}
	 
	if($("#idin").val() != ""){ 
		$("#savelogin").attr("checked", true); 
	}
	 
	$("#savelogin").change(function(){ 
		if($("#savelogin").is(":checked")){ 
			setCookie("idChk", $("#idin").val(), 7); 
		}else{ 
			deleteCookie("idChk");
		}
	});
	 
	$("#idin").keyup(function(){ 
		if($("#savelogin").is(":checked")){
			setCookie("idChk", $("#idin").val(), 7); 
		}
	});
});
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
	 
function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1){
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1)end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}
</script>
<div class="table-container">
	<form:form action="j_spring_security_check" method="post">
		<table style="width: 20rem; margin: 0 auto;" class="table table-striped table-hover">
			<tr>
				<td>
						<input type="text" placeholder="email" name="j_username" id="idin"/>
				</td>
			</tr>
			<tr>
				<td>
						<input type="password" placeholder="password" name="j_password"/>
				</td>
			</tr>
			<tr>
				<td>
						<input type="checkbox" name="savelogin" id="savelogin"><label for="savelogin"> 이메일 저장 </label>
				</td>
			</tr>
			<tr>
				<td>
						<input type="submit" value="로그인" class="btn btn-success btn-sm"/>
				</td>
			</tr>
	<!-- 		<tr>
				<td style="border-bottom: 1px solid #ccc;">
					<input type="checkbox" name="savelogin" id="savelogin"><label for="savelogin"> 이메일 저장 </label>
				</td>
			</tr> -->
			
			<tr>
				<td style="text-align: center;">
					<a 
						href="${pageContext.request.contextPath}/find_id" 
						onclick="openPopup(this.href); return false;" 
						class="btn btn-primary btn-sm"
						> 아이디 찾기</a>
					<a 
						href="${pageContext.request.contextPath}/find_pw" 
						onclick="openPopup(this.href); return false;"
						class="btn btn-danger btn-sm"
						> 비밀번호 찾기</a>
					<a 
						href="${pageContext.request.contextPath}/signup" 
						onclick="openPopup(this.href); return false;" 
						class="btn btn-success btn-sm"
						>회원가입</a>
				</td>
			</tr>
		</table>
	</form:form>
	<br>
	<table style="width: 20rem; margin: 0 auto;" class="table table-striped table-hover">
		<tr>
			<td style="text-align: center;">
				<form:form action="j_spring_security_check" method="post">
					<input type="hidden" placeholder="email" name="j_username" value="admin@ezen.com"/>
					<input type="hidden" placeholder="password" name="j_password" value="1212"/>
					<input type="submit" value="관리자로그인" class="btn btn-danger btn-sm"/>
				</form:form>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;">
				<form:form action="j_spring_security_check" method="post">
					<input type="hidden" placeholder="email" name="j_username" value="ezen@ezen.com"/>
					<input type="hidden" placeholder="password" name="j_password" value="1234"/>
					<input type="submit" value="유저로그인" class="btn btn-success btn-sm"/>
				</form:form>
			</td>
		</tr>
	</table>
</div>
<jsp:include page="/resources/user/include/footer.jsp" />