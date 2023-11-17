<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="./css/st1.css" rel="stylesheet"/>
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
		        
		<a style="margin-left: 48%;" class="fas fa-home" >ateam </a>    
		<div class="table-container">
		<table style="width: 350px; margin: 0 auto;">
			<tr>
				<td colspan="3">
					<form>
			        	<input type="text" name="idin" placeholder="아이디" style="width: 400px; height: 50px;">
	    			</form>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<form>
			        	<input type="text" name="pwin" placeholder="비밀번호" style="width: 400px; height: 50px;">
	    			</form>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<button id="loginbtn" type="button" onclick="location.href='./Festival.jsp'" style="width: 400px; height: 50px;">
					로그인
					</button>
				</td>
			</tr>
			<tr>
				<td style="border-bottom: 1px solid #ccc;" colspan="3">
					<input type="checkbox" name="autologin" id="autologin"><label for="autologin"> 자동 로그인  </label>&nbsp; &nbsp;
					<input type="checkbox" name="savelogin" id="savelogin"><label for="savelogin"> 아이디 저장  </label>
				</td>
			</tr>
		</table>
		</div>