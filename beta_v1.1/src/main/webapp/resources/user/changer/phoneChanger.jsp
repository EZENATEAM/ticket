<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Ticket</title>
		<link href="../css/st1.css" rel="stylesheet"/>
	</head>
	
	<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
      if(pws1.length < 11) {
          alert('연락처를 다시 입력해주세요');
          return false;
      } else if(pws1.length > 11) {
          alert("연락처를 다시 입력해주세요");
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
		    
		    
		<div class="table-container">
		<table style="width: 350px; margin: 0 auto;">
			<tr>
				<td>연락처 수정
			        <input type="number" id="pwsign" name="pwsign" placeholder="ex) 01012345678" style="width: 400px; height: 50px;">
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인
			        <input type="password" id="pwsignOk" name="pwsignOk" style="width: 400px; height: 50px;">
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
		    </div>
</div>
	</body>
</html>
		