<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/resources/user/include/header.jsp" />

<style>

    /* 나머지 행의 가로줄 숨김 */
    .table-container table tr:not(:last-child) {
        border-bottom: none;
    }

    /* 테이블 셀 내부 내용을 가운데 정렬 */
    .table-container table td {
        text-align: center;
        border-bottom: none;
    }
    
    /* 로그인 버튼 스타일 */
	#loginbtn {
	    background-color: #808080;
	    color: #fff;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s ease; /* 배경색 변화에 애니메이션 추가 */
	}
	
	#loginbtn:hover {
	    background-color: #000000; /* 호버 상태일 때 배경색 변경 */
	}
</style>
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
		<table style="width: 350px; margin: 0 auto;">
			<tr>
				<td colspan="3">
					<form name="mail" method="post" action="${pageContext.request.contextPath}/mail/sendOk">
			받는 사람 메일 주소 : <input type="text" name="to" id="to" value="toID@mail.com">
			<br>
			메일 제목 : <input type="text" name="title" id="title">
			<br>
			내용<br>
			<textarea rows="5" cols="30" id="note" name="note">메일 내용 작성</textarea>
			<br>
			<input type="submit" value="전송"> 
		</form>
				</td>
			</tr>
		</table>
		</div>
		<jsp:include page="/resources/user/include/footer.jsp" />