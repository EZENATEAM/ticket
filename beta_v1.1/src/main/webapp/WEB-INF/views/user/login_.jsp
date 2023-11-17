<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/resources/user/include/header.jsp" />
<link href="${pageContext.request.contextPath}/resources/user/css/st2.css" rel="stylesheet"/>

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
			setCookie("idChk", $("#idin").val(), 7); //유효기간 7일 설정
		}else{ 
			deleteCookie("idChk");
		}
	});
	 
	$("#idin").keyup(function(){ 
		if($("#savelogin").is(":checked")){
			setCookie("idChk", $("#idin").val(), 7); //7일 설정
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

function checkform() {
	var idin = document.getElementById('idin').value;
	if( idin == null || idin == "" )
	{
		alert('id를 입력해주세요.');
        return false;
	}
	var pwin = document.getElementById('pwin').value;
	if( pwin == null || pwin == "" )
	{
		alert('비밀번호를 입력해주세요.');
        return false;
	}
	return true;
}
</script>
		    
		<div class="table-container">
		<form id="emailForm" action="${pageContext.request.contextPath}/user/logindex" method="post" onsubmit="return checkform();">
		<table style="width: 350px; margin: 0 auto;">
			<tr>
				<td colspan="3">
			        <input type="text" id="idin" name="idin" placeholder="아이디" style="width: 400px; height: 50px;">
				</td>
			</tr>
			<tr>
				<td colspan="3">
			        <input type="password" id="pwin" name="pwin" placeholder="비밀번호" style="width: 400px; height: 50px;">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<button id="submitButton" type="submit" class="loginbtn" style="width: 400px; height: 50px;">
					로그인
					</button>
				</td>
			</tr>
			<tr>
				<td style="border-bottom: 1px solid #ccc;" colspan="3">
					<input type="checkbox" name="savelogin" id="savelogin"><label for="savelogin"> &nbsp;아이디 저장  </label>
				</td>
			</tr>
			<tr>
				<td><a href="${pageContext.request.contextPath}/user/idfind" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"> 아이디 찾기 </td>
				<td><a href="${pageContext.request.contextPath}/user/pwfind" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"> 비밀번호 찾기 </td>
				<%-- <td><a href="${pageContext.request.contextPath}/mail/mailtest" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"> 메일 테스트 </td> --%>
				<td><a href="${pageContext.request.contextPath}/user/signup">회원가입</a></td>
			</tr>
		</table>
		</form>
		</div>
		<jsp:include page="/resources/user/include/footer.jsp" />