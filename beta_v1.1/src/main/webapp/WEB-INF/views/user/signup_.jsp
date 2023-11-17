<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<jsp:include page="/resources/user/include/header.jsp" />
<link href="${pageContext.request.contextPath}/resources/user/css/st2.css" rel="stylesheet"/>


<script>
var mailflag=false;
var signflag=false;
var idsignflag=false;
var isPwValid = false; // 비밀번호 확인 상태

function idcheck()
{
	var uID = document.getElementById('idsign').value;
	if( uID == null || uID == "" )
	{
		alert('아이디를 입력해주세요.');
        return;
	}
	if( uID.length < 5 )
	{ 
		alert('아이디를 5자 이상 입력해주세요.');
		return; 
	}
	$.ajax({
		type : "get",
		url	 : "${pageContext.request.contextPath}/user/signup?idsign=" + uID.value,
		dataType: "HTML",
		success : function(data){
			data = data.trim();
			if( data == "ERROR" ) { alert("중복검사 오류가 발생했습니다."); return data; }
			if( data == "DUPLICATE" )
			{	// 아이디가 중복됨
				$(".msg_area").html("아이디가 중복되었습니다.");
//				$("#idsign").val("");
//				$("#idsign").focus();
				CheckState = "2";
			}
			else( data == "NOT_DUPLICATE" )
			{
				$(".msg_area").html("사용할 수 있는 아이디입니다.");
				CheckState = "1";
				alert("사용할 수 있는 아이디입니다.");
				idsignflag = true;
			}
		}
	});
}

function getEmail() {
	var email = document.getElementById('to').value;
	if( email == null || email == "" )
	{
		alert('이메일 주소를 입력해주세요.');
        return;
	}
	$.ajax({
		type : "get",
		url	 : "${pageContext.request.contextPath}/mail/sendMail?to=" + email,
		dataType: "HTML",
		success : function(data){
			data = data.trim();
			if( data == "ERROR" ) { alert("이메일 발송이 실패했습니다."); return data; }
			if( data == "OK" )
			{
				alert("이메일 발송되었습니다.");
				mailflag = true;
			}
		}
	});
}
function emailInspect() {
	var email = document.getElementById('to').value;
	
	if( mailflag == false )
	{
		alert('인증번호 받기를 해주세요');
        return;			
	}
	var code = document.getElementById('emailsign').value;
	
	if( code == null || code == "" )
	{
		alert('인증번호를 입력해주세요.');
        return;
	}
	
	console.log("이메일 " + email);
	console.log("인증번호 " + code);
	
	$.ajax({
		type : "get",
		data : { mail : email, code : code },
		url	 : "${pageContext.request.contextPath}/mail/id_mail",
		dataType: "HTML",
		success : function(data){
			data = data.trim();
			if( data == "ERROR" ) { alert("인증번호가 다릅니다."); return data; }
			if( data == "OK" )
			{
				alert("인증번호가 일치합니다.");
				signflag = true;
			}
		}
	});
}

function checkform() {
	var name = document.getElementById('name').value;
	var birthsign = document.getElementById('birthsign').value;
	var phonesign = document.getElementById('phonesign').value;
	if( idsignflag == false )
	{
		alert('아이디 중복 확인을 해주세요');
        return false;
	}
	if( isPwValid == false )
	{
		alert('비밀번호 확인을 해주세요');
        return false;
	}
	if( name == null || name == "" )
	{
		alert('이름을 입력해주세요.');
        return false;
	}
	if( birthsign == null || birthsign == "")
	{
		alert('생년월일을 입력해주세요.');
        return false;
	}
    if (birthsign.length !== 8) {
        alert('생년월일은 8자리로 입력해주세요.');
        return false;
    }
	if( phonesign == null || phonesign == "" )
	{
		alert('핸드폰 번호를 입력해주세요.');
        return false;
	}
	if (phonesign.length !== 11) {
        alert('올바른 번호를 입력해주세요.');
        return false;
    }
//	var email = document.getElementById('to').value;
	if( mailflag == false )
	{
		alert('인증번호 받기를 해주세요');
        return false;
	}
//	var emailsign = document.getElementById('emailsign').value;
	if( signflag == false )
	{
		alert('인증번호 확인을 해주세요.');
        return false;
	}
	return true;
}


//가입시 비밀번호 확인
function pwsigns() {
    var pws1 = document.getElementById('pwsign').value;
    var pws2 = document.getElementById('pwsignOk').value;
    if (pws1.length < 8) {
        alert('비밀번호는 8글자 이상이어야 합니다.');
        isPwValid = false;
    } else if (pws1 !== pws2) {
        alert("비밀번호가 일치하지 않습니다");
        isPwValid = false;
    } else {
        alert("사용할 수 있는 비밀번호입니다");
        isPwValid = true;
    }
}

</script>
		    
		    
		<div class="table-container">
		<form id="signupForm" action="${pageContext.request.contextPath}/user/idfindResult" method="post" onsubmit="return checkform();">
		<table style="width: 350px; margin: 0 auto;">
			<tr>
				<td>아이디<div style="display: flex; align-items: center;">
					<input type="text" id="idsign" name="idsign" placeholder="5자 이상" style="width: 300px; height: 50px;">
					<button id="idsignOk" type="button" style="width: 100px; height: 50px;" class="loginbtn" onclick="idcheck()">
			        중복 확인</button></div>
				</td>
			</tr>
			<tr>
				<td>비밀번호
			        <input type="password" id="pwsign" name="pwsign" placeholder="8자 이상" style="width: 400px; height: 50px;">
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인<div style="display: flex; align-items: center;">
			        <input type="password" id="pwsignOk" name="pwsignOk" placeholder="8자 이상" style="width: 300px; height: 50px;">
			        <button id="pwsignOkbtn" type="button" onclick="pwsigns()" class="loginbtn" style="width: 100px; height: 50px;">
			        비밀번호<br>확인</button></div>
				</td>
			</tr>
			<tr>
				<td>이름
			        <input type="text" name="name" id="name" style="width: 400px; height: 50px;">
				</td>
			</tr>
			<tr>
				<td>생년월일
			        <input type="number" id="birthsign" name="birthsign" placeholder="ex) 20010101" style="width: 400px; height: 50px;">
				</td>
			</tr>
			<tr>
				<td>핸드폰 번호
			        <input type="number" id="phonesign" name="phonesign" placeholder="ex) 01012345678" style="width: 400px; height: 50px;">
				</td>
			</tr>
			<tr>
				<td>이메일<div style="display: flex; align-items: center;">
			        <input type="text" name="to" id="to" style="width: 300px; height: 50px;" value="kimcm5221@naver.com">
			        <button id="emailsignOk" type="button"  style="width: 100px; height: 50px;" class="loginbtn" onclick="getEmail()" >인증번호<br>받기</button>
					</div>
				</td>
			</tr>
			<tr>
				<td><div style="display: flex; align-items: center;">
			        <input type="text" name="emailsign" id="emailsign" style="width: 300px; height: 50px;">
			        <button id="verifyButton" type="button"  style="width: 100px; height: 50px;" class="loginbtn" onclick="emailInspect();">인증번호<br>확인</button>
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<button id="submitButton" type="submit"  class="loginbtn" style="width: 400px; height: 50px;">
					가입완료
					</button>
				</td>
			</tr>
		</table>
		</form>
		</div>
		<%=request.getServletPath()%>
		<jsp:include page="/resources/user/include/footer.jsp" />