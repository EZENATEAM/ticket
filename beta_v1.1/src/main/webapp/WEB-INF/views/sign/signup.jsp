<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
	<head>
		<title>Signup</title>
		<link href="${pageContext.request.contextPath}/resources/user/css/st1.css" rel="stylesheet"/>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<!-- 		<script src="http://code.jquery.com/jquery-1.12.4.js"></script> -->
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
			let ID_check_flag = false;
			let PW_check_flag = false;
			let MAIL_check_flag = false;
			let CODE_check_flag = false;

			$(function() {
				$("#send").click( function() {
					if( !DoSubmit() ) return false;
					
					$('#user').submit();
					opener.location.href='${pageContext.request.contextPath}/signin';
					setTimeout(function() { window.close(); }, 100);
				});
			});
			
			function DoSubmit() {
				alert("call");
				if( ID_check_flag == false ) { alert('아이디 중복 확인을 해주세요'); return false; }
				if( PW_check_flag == false ) { alert('비번 체크 확인을 해주세요'); return false; }
				if( MAIL_check_flag == false ) { alert('이메일 인증을 해주세요'); return false; }
				if( CODE_check_flag == false ) { alert('인증번호 확인을 해주세요'); return false; }
				return true;
			}

			function val_check( object, msg){
				if( object == null || object == undefined || object == "")
				{
					alert( msg + ' 입력해주세요.');
					return false;
				}
				return true;
			}

			function ID_check()
			{
				let id_obj = $("#ID"); 
				if( id_obj.val() == "" || id_obj.val().length < 5 )
				{
					alert("ID가 올바르지 않습니다.");
					id_obj.focus();
					return;
				}
				$.ajax({
					type : "get",
					url	 : "${pageContext.request.contextPath}/check_id?id=" + id_obj.val(),
					dataType: "HTML",
					success : function(data){
						data = data.trim();
						if( data == "DUPLE" ) { alert("사용할 수 없는 ID입니다."); id_obj.val(""); id_obj.focus(); }
						if( data == "OK" ) { alert("사용할 수 있는 ID입니다."); ID_check_flag = true; }
					}
				});
			}
			
			function PW_check()
			{
				let pw_obj = $("#PASSWORD");
				let pwc_obj = $("#pwc");
				
				if( pw_obj.val() == "" || pw_obj.val().length < 8 )
				{
					alert("PASSWORD가 올바르지 않습니다.");
					pw_obj.focus();
					return;
				}
				
				if( pwc_obj.val() == "" || pwc_obj.val().length < 8)
				{
					alert("PW check가 올바르지 않습니다.");
					pwc_obj.focus();
					return;
				}
				
				if( pw_obj.val() != pwc_obj.val() )
				{
					alert("PASSWORD와 PW check가 일치하지 않습니다.");
					pw_obj.val("");
					pwc_obj.val("");
					pw_obj.focus();
					return;
				}
				alert("PASSWORD와 PW check가 일치합니다.");
				PW_check_flag = true;
			}
			
			function mail_check() {
				alert("메일인증");
				let mail_val = $("#EMAIL").val();
//				if( !val_check(mail_val,'아이디를') ) return false;
				$.ajax({
					type : "get",
					url	 : "${pageContext.request.contextPath}/mail/mail_auth?mail=" + mail_val,
					dataType: "HTML",
					success : function(data){
						data = data.trim();
						if( data == "ERROR" ) { alert("이메일 발송이 실패했습니다."); return data; }
						if( data == "OK" )
						{
							alert("이메일 발송되었습니다.");
							MAIL_check_flag = true;
						}
					}
				});
			}
			
			function mail_auth()
			{
				let mail_val = $("#EMAIL").val();
				let authCode = $("#authCode").val();
				alert("인증하기" + mail_val);
//				if( !val_check(mail_val,'아이디를') ) return false;
				$.ajax({
					type : "post",
					data : { mail : mail_val, code : authCode },
					url	 : "${pageContext.request.contextPath}/mail/mail_auth",
					dataType: "HTML",
					success : function(data){
						data = data.trim();
						if( data == "ERROR" ) { alert("인증번호가 올바르지 않습니다."); return data; }
						if( data == "OK" )
						{
							alert("인증되었습니다.");
							CODE_check_flag = true;
						}
					}
				});
			}
			
			function idsigns()
			{
				var uID = document.querySelector("input[name='ID']").value;
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
					url	 : "${pageContext.request.contextPath}/signup?idsign=" + uID.value,
					dataType: "HTML",
					success : function(data){
						data = data.trim();
						if( data == "ERROR" ) { alert("중복검사 오류가 발생했습니다."); return data; }
						if( data == "DUPLICATE" )
						{	// 아이디가 중복됨
							$(".msg_area").html("아이디가 중복되었습니다.");
//							$("#idsign").val("");
//							$("#idsign").focus();
							CheckState = "2";
						}
						else( data == "NOT_DUPLICATE" )
						{
							$(".msg_area").html("사용할 수 있는 아이디입니다.");
							CheckState = "1";
							idsignflag = true;
						}
					}
				});
			}
			
			function pwsigns() {
			    // 비밀번호 입력과 비밀번호 확인 입력 값 가져오기
			    let pw1 = document.getElementById('PASSWORD').value;
			    let pw2 = document.getElementById('pwc').value;

			    // 비밀번호 길이 체크 및 일치 여부 확인
			    if (pw1.length < 8) {
			        alert('비밀번호는 8글자 이상이어야 합니다.');
			        PW_check_flag = false;
			    } else if (pw1 !== pw2) {
			        alert('비밀번호가 일치하지 않습니다.');
			        PW_check_flag = false;
			    } else {
			        alert('사용할 수 있는 비밀번호입니다.');
			        PW_check_flag = true;
			    }
			}
		</script>
	</head>
	<body>
		<div class="center-align">
			<a href="${pageContext.request.contextPath}/" ><img style="width: 200px;" id="logo" src="${pageContext.request.contextPath}/img/logo.png"></a>
		</div>
		<hr>
		<form:form modelAttribute="user" onsubmit="return DoSubmit();">
			<table style="width: 32rem; margin: 0 auto;" class="table table-striped table-hover">
				<tr>
					<td style="width: 7rem;">ID</td>
					<td>
						<div style="display: flex; align-items: center;">
							<form:input path="ID" placeholder="5자 이상" style="width: 20rem; height: 2rem;"/>
							<button id="IDcheck" type="button" onclick="ID_check();" style="width: 5rem; height: 2rem;">중복확인</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td>
						<form:password path="PASSWORD" placeholder="8자 이상" style="width: 25rem; height: 2rem;"/>
					</td>
				</tr>
				<tr>
					<td>PW check</td>
					<td>
						<div style="display: flex; align-items: center;">
							<input type="password" name="pwc" id="pwc" placeholder="비밀번호를 다시 입력해주세요" style="width: 20rem; height: 2rem;">
							<button id="PWcheck" type="button" onclick="PW_check();" style="width: 5rem; height: 2rem;">비번확인</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<form:input path="NAME" style="width: 25rem; height: 2rem;"/><br/>
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<form:input path="birth" type="date"/>
					</td>
				</tr>
				<tr>
					<td>핸드폰 번호</td>
					<td>
						<form:input path="tel" style="width: 25rem; height: 2rem;"/><br/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<div style="display: flex; align-items: center;">
							<form:input path="EMAIL" placeholder="ex) ticket@naver.com" style="width: 20rem; height: 2rem;" value="silverwoods@live.co.kr"/>
							<button id="sendMail" type="button" onclick="mail_check();" style="width: 5rem; height: 2rem;">메일인증</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>인증번호</td>
					<td>
						<div style="display: flex; align-items: center;">
							<input type="text" id="authCode" name="authCode" style="width: 20rem; height: 2rem;">
							<button id="loginbtn" type="button" onclick="mail_auth()" style="width: 5rem; height: 2rem;">인증하기</button>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" >
						<input type="submit" id="send" value="가입하기" style="width: 32rem; height: 3rem;"/>
					</td>
				</tr>
			</table>
			<form:hidden path="uStat" value="A"/>
		</form:form>
<jsp:include page="/resources/user/include/footer.jsp" />