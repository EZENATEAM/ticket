<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이젠 AWS 풀스택 ateam test web app</title>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<style>
			body	{ background-color: gray; }
			.main	{ width : 900px; margin : auto; }
			th		{ text-align : center; }
			.footer	{ height : 3rem; text-align : right; vertical-align : bottom; }
			ul		{ margin:0; }
		</style>
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<script>
		
		let total		= 0;
		let page		= 1;
		let perPage		= 10;
		let maxBlock	= 10;
		let startBlock	= 1;
		let endBlock	= startBlock + maxBlock - 1;
		
		function pageInfo()
		{
			console.log("============================");
			console.log("total : " + total);
			console.log("page : " + page);
			console.log("perPage : " + perPage);
			console.log("maxBlock : " + maxBlock);
			console.log("startBlock : " + startBlock);
			console.log("endBlock : " + endBlock);
			console.log("============================");
		}

		function getTotal()
		{
			console.log("============================");
			console.log("getTotal()");
			pageInfo();
			$.ajax({
				url : "${pageContext.request.contextPath}/open/total.do",
				type : "get",
				success : function(data){
					if( data == "undefined" || data == null || data == "" ) return;
					// 전체 게시글 수
					total = parseInt(data,10);
					pageInfo();
					setTotal(page);
				}
			});
		}
		
		function setTotal( curPage )
		{
			console.log("============================");
			console.log("setTotal()");
			console.log("curPage : " + curPage);
			pageInfo();
			
			// 최대 페이지 개수를 계산한다
			let maxPage = parseInt(( total - 1 ) / perPage, 10) + 1;
			
			// 입력받은 페이지 번호가 최대 페이지 번호보다 크면 수정한다
			if( curPage > maxPage ) { curPage = maxPage; }
	
			// 시작 블럭 번호와 끝 블럭 번호를 계산한다
			startBlock	= parseInt( (curPage - 1) / maxBlock , 10 ) * maxBlock + 1;
			endBlock	= startBlock + maxBlock - 1;
			if( endBlock > maxPage )
			{	// 계산된 끝 블럭 번호가 최대 페이지 번호보다 크면 수정한다
				endBlock = maxPage;
			}
			pageInfo();
			
			makePageSelecter();
		}
		
		function makePageSelecter()
		{
			console.log("============================");
			console.log("makePageSelecter()");
			pageInfo();
			// 셀렉트 객체 할당
			let select_num = document.querySelector("#pageNum");
			// 옵션 삭제
			$(select_num).empty();

			console.log(select_num.length);
			
			for( let i = startBlock; i <= endBlock; i++ )
			{	
				console.log("i : " + i);
				$(select_num).append("<option value='"+ (startBlock+select_num.length)+"'>" + i + "</option>")
			}
			$(select_num).val(page).prop("selected","selected");
		}
		
		function getList()
		{
			console.log("============================");
			console.log("getList()");
			$.ajax({
				url : "${pageContext.request.contextPath}/open/list.do",
				type : "get",
				data : "page="+page,
				success : function(data){
					if( data == "undefined" || data == null || data == "" ) return;
					var html = "";
					html += "<table class='table table-striped'>"
					html += "<tr>"
					html += "<td>title</td>"
					html += "</tr>"
					for(var item of data.response.body.items.item)
					{
						html += "<tr>"
						html += "<td>"
						for( var key in item )
						{
							html += key + " : " + item[key] + "<br>"
							if( key == "referenceIdentifier" && item[key] != null )
							{
								console.log(item[key]);
								html += "<img src='" + item[key] + " width=400px'><br>";
							}
						}
						html += "</td>"
						html += "</tr>"
					}
					html += "</table>"
					$("#sec_list").html(html);
				}
			});
		}
		
		$(document).ready(function(){
			page = 1213;
			getTotal();
			getList();
		});
		</script>
	</head>
	<body>
		<!-- header  영역 시작 --------------------------------------------------------------------------------- -->
		<header class="main">
			<table class="table table-borderless" style="margin:0;height: 3rem;">
				<tr>
					<td style="background-color:white;">
						<a href="${pageContext.request.contextPath}/" style="font-size: 2rem;font-weight:bold;">Ateam test board</a>
					</td>
					<td style="text-align:right;background-color:white; vertical-align : bottom;">
					<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
					현재 로그인된 유저는 ${user.NAME} 입니다.<br>
					부여된 권한은 <br/>
					<c:forEach var="authority" items="${user.authorities}">
					    ${authority}<br/>
					</c:forEach>
						<c:if test="${ user == null }">
							<a href="${pageContext.request.contextPath}/user/join.do" class="btn btn-primary btn-sm">회원가입</a>&nbsp;
							<a href="${pageContext.request.contextPath}/user/login.do" class="btn btn-success btn-sm">로그인</a>&nbsp;
						</c:if>
						<c:if test="${ user != null }">
							<button type="button" class="btn btn-outline-dark btn-sm" disabled>${ user.NAME }</button>
							<a href="${pageContext.request.contextPath}/user/view.do" class="btn btn-outline-danger btn-sm">계정관리</a>
							<a href="${pageContext.request.contextPath}/user/logout.do" class="btn btn-outline-dark btn-sm">LOGOUT</a>
						</c:if>
					</td>
				</tr>
			</table>
		</header>
		<!-- header  영역 종료 --------------------------------------------------------------------------------- -->
		<table class="main table table-bordered">
			<tr>
				<td valign="top" style="background-color:white;width:13rem;">
		<!-- nav     영역 시작 --------------------------------------------------------------------------------- -->
					<nav class="d-grid gap-2 col-10 mx-auto">
						<a href="${pageContext.request.contextPath}/board/list.do" class="btn btn-dark">회원관리</a>
						<a href="" class="btn btn-light">축제관리</a>
						<a href="" class="btn btn-light">예약관리</a>
					</nav>
		<!-- nav     영역 시작 --------------------------------------------------------------------------------- -->
				</td>
				<td style="background-color:white;">
		<!-- section 영역 시작 --------------------------------------------------------------------------------- -->
					<section>
		<!-- section 내부 header 영역 시작 --------------------------------------------------------------------- -->
						<header>
							<div style="font-size:1.2rem;font-weight:bold;">board1</div>
							<div style="width:100%; text-align:right;">
								<a href="${pageContext.request.contextPath}/board/write.do" class="btn btn-warning btn-sm">글쓰기</a>
							</div>
							<form method="get" action="list.do">
								<select name="searchType">
									<option value="title" <c:if test="${ param.searchType eq 'title' }">selected</c:if> >제목</option>
									<option value="note" <c:if test="${ param.searchType eq 'note' }">selected</c:if> >내용</option>
								</select>
								<input type="text" name="searchVal" value="${ param.searchVal }">
								<button>검색</button>
								<select name="sortCol">
									<option value="title" <c:if test="${ param.sortCol eq 'title' }">selected</c:if> >제목</option>
									<option value="wdate" <c:if test="${ param.sortCol eq 'wdate' }">selected</c:if> >작성일</option>
								</select>
								<select name="sortOrder">
									<option value="DESC" <c:if test="${ param.sortOrder eq 'DESC' }">selected</c:if> >내림차순</option>
									<option value="ASC" <c:if test="${ param.sortOrder eq 'ASC' }">selected</c:if> >올림차순</option>
								</select>
								<select id="pageNum" name="page">
								</select>
							</form>
						</header>
		<!-- section 내부 header 영역 종료 --------------------------------------------------------------------- -->
		<!-- section 내부 section 영역 시작 -------------------------------------------------------------------- -->
						<section id="sec_list">
						</section>
		<!-- section 내부 section 영역 종료 -------------------------------------------------------------------- -->
		<!-- section 내부 footer 영역 시작 --------------------------------------------------------------------- -->
						<footer>
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
							</ul>
						</footer>
		<!-- section 내부 footer 영역 종료 --------------------------------------------------------------------- -->
					</section>
		<!-- section 영역 종료 --------------------------------------------------------------------------------- -->
				</td>
			</tr>
		</table>
		<!-- footer 영역 시작 ---------------------------------------------------------------------------------- -->
		<footer class="main footer" style="background-color:white;">
			Copyright by EZEN IT All right reserved. <br>${serverTime}
			<br>
			<c:forEach var="item" items="${arr}">
			${ item } &nbsp;
			</c:forEach>
			<c:forEach var="item" items="${arry}">
			${ item } &nbsp;
			</c:forEach>
		</footer>
		<!-- footer 영역 종료 ---------------------------------------------------------------------------------- -->
	<%-- <img src="/resources/image/cat.jpg" width="100px"><br>
	<img src="./resources/image/cat.jpg" width="100px"><br>
	<img src="<%=request.getContextPath()%>/resources/image/cat.jpg" width="100px"><br> --%>
<%-- 	<a href="<%= request.getContextPath() %>/fileupload.do">파일 업로드하러가기!!</a>
	<a href="${pageContext.request.contextPath}/fileupload.do">파일 업로드하러가기!!</a> --%>
	</body>
</html>
