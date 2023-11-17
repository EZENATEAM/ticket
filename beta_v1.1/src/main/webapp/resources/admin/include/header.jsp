<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Ticket</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link href="${pageContext.request.contextPath}/resources/admin/css/st1.css" rel="stylesheet"/>
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
	function logout(){
     location.href = "./index.html";
}
</script>
	
	
	
	<body>
		<header>
		<!-- 최상단 이동 -->
			    <div id="top"></div>
	   			<a href="#top" class="scroll-top">TOP</a>
				
			<table width="100%">
				<tr>
					<td style="align:center;">
						<br>
						<a href="${pageContext.request.contextPath}/admin/list" ><img style="width: 200px;" id="logo" src="${pageContext.request.contextPath}/resources/admin/include/logo.png"></a>

					</td>
					<td>
						<div class="center-align">        
					        <form method="get" id="searchbar">
						        <input type="text" name="query" placeholder="검색어를 입력하세요">
						        <input type="submit" value="검색">
				    		</form>
				    	</div>
				    </td>
					<td style="text-align:right;background-color:white; vertical-align : bottom;">
				    		<input type="button" class="btn btn-success me-1" onclick="logout();" value="로그아웃">
				    		<br><br>
							<a href="${pageContext.request.contextPath}/admin/Membership" >회원관리</a>
					        <a href="${pageContext.request.contextPath}/admin/list" >축제목록</a>
					        <a href="${pageContext.request.contextPath}/admin/rlist" >예약목록</a>
					</td>
					        
				</tr>
				    
			</table>
		</header>
		
		<hr>
		<div class="wrap">
		
		