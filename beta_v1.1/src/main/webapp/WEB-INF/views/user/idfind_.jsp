<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Ticket</title>
		<link href="${pageContext.request.contextPath}/resources/user/css/st1.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/user/css/st2.css" rel="stylesheet"/>
		<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
	</head>
	
	<script>
	/* 스크롤 이벤트를 사용하여 버튼 표시 여부 제어 */
    window.addEventListener('scroll', function() {
        var scrollPosition = window.scrollY;
        var scrollButton = document.querySelector('.scroll-top');

        // 스크롤 위치가 200 이상이면 버튼을 보이게 하고 그렇지 않으면 숨김
        if (scrollPosition >= 200) {
            scrollButton.style.display = 'block';
        } else {
            scrollButton.style.display = 'none';
        }
    });
	
	var mailflag=false;
	var signflag=false;
    
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
		if( name == null || name == "" )
		{
			alert('이름을 입력해주세요.');
            return false;
		}
//		var email = document.getElementById('to').value;
		if( mailflag == false )
		{
			alert('인증번호 받기를 해주세요');
            return false;
		}
//		var emailsign = document.getElementById('emailsign').value;
		if( signflag == false )
		{
			alert('인증번호 확인을 해주세요.');
            return false;
		}
		return true;
	}
	
	</script>
	
	<body>
		<header>
		<!-- 최상단 이동 -->
		    <div id="top"></div>
   			<a href="#top" class="scroll-top">TOP</a>
		    
		</header>
		
		<hr>
		<div class="wrap">
				    
		<div class="table-container">
		<form id="emailForm" action="${pageContext.request.contextPath}/user/idfindResult" method="post" onsubmit="return checkform();">
		<table style="width: 350px; margin: 0 auto;">
			<tr>
				<td>이름
			        <input type="text" name="name" id="name" style="width: 400px; height: 50px;">
				</td>
			</tr>
			<tr>
				<td>이메일<div style="display: flex; align-items: center;">
			        <input type="text" name="to" id="to" style="width: 300px; height: 50px;" value="kimcm5221@naver.com">
			        <button id="emailsignOk" type="button"  style="width: 100px; height: 50px;" class="loginbtn" onclick="getEmail()" >인증번호 받기</button>
					</div>
				</td>
			</tr>
			<tr>
				<td><div style="display: flex; align-items: center;">
			        <input type="text" name="emailsign" id="emailsign" style="width: 300px; height: 50px;">
			        <button id="verifyButton" type="button"  style="width: 100px; height: 50px;" class="loginbtn" onclick="emailInspect();">인증번호 확인</button>
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<button id="submitButton" type="submit"  class="loginbtn" style="width: 400px; height: 50px;">
					확인
					</button>
				</td>
			</tr>
		</table>
		</form>
		</div>

		<jsp:include page="/resources/user/include/footer.jsp" />