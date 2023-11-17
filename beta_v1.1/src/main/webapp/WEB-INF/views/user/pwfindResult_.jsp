<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Ticket</title>
		<link href="${pageContext.request.contextPath}/resources/user/css/st1.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/user/css/st2.css" rel="stylesheet"/>
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
	
  //가입시 비밀번호 확인
    function pwsigns() {
      var pws1 = document.getElementById('pwsign').value;
      var pws2 = document.getElementById('pwsignOk').value;
      if(pws1.length < 8) {
          alert('8글자 이상이어야 합니다.');
          return false;
      }
      
      if( pws1 != pws2 ) {
        alert("비밀번호 불일치");
        return false;
      } else{
        alert("비밀번호가 일치합니다");
        return true;
      }
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
		<table style="width: 350px; margin: 0 auto;">
			<tr>
				<td>새 비밀번호
			        <input type="password" id="pwsign" name="pwsign" placeholder="8자 이상" style="width: 400px; height: 50px;">
				</td>
			</tr>
			<tr>
				<td>새 비밀번호 확인
			        <input type="password" id="pwsignOk" name="pwsignOk" placeholder="8자 이상" style="width: 400px; height: 50px;">
				</td>
			</tr>
			<tr>
				<td>
					<button id="loginbtn" type="button" onclick="pwsigns()" style="width: 400px; height: 50px;">
					확인
					</button>
				</td>
			</tr>
		</table>
		</div>
		<jsp:include page="/resources/user/include/footer.jsp" />