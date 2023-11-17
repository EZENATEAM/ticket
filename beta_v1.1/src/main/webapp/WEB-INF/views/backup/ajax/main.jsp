<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ajax 실습</title>
		<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
		<script>
		function selectByBidx()
		{
			var msg = $("input[name=bidx]").val();
			$.ajax({
				url : "view.do",
				data : "bidx=" + msg,
				type : "get",
				success : function(data){
					console.log(data);
					if( data == "undefined" || data == null || data == "" ) return;
					var html = "";
					html += "<table border='1'>"
					html += "<tr>"
					html += "<td>글번호</td>"
					html += "<td>제목</td>"
					html += "<td>내용</td>"
					html += "<td>작성자</td>"
					html += "<td>작성일</td>"
					html += "</tr>"
					html += "<tr>"
					html += "<td>" + data.bidx + "</td>"
					html += "<td>" + data.title + "</td>"
					html += "<td>" + data.note + "</td>"
					html += "<td>" + data.name + "</td>"
					html += "<td>" + data.wdate.year + " " + data.wdate.monthValue + " " + data.wdate.dayOfMonth + "</td>"
					html += "</tr>"
					html += "</table>"
					$("div").html(html);
				}
			});
		}
		function selectByKeyword()
		{
			var key = $("input[name=keyword]").val();
			var search = {"searchType": "title","searchVal":key}
			$.ajax({
				url : "list.do",
				data : search,
				type : "get",
				success : function(data){
					console.log(data);
					if( data == "undefined" || data == null || data == "" ) return;
					var html = "";
					html += "<table border='1'>"
					html += "<tr>"
					html += "<td>글번호</td>"
					html += "<td>제목</td>"
					html += "<td>조회수</td>"
					html += "<td>작성자</td>"
					html += "<td>작성일</td>"
					html += "</tr>"
					for(var item of data )
					{
						html += "<tr>"
						html += "<td>" + item.bidx + "</td>"
						html += "<td>" + item.title + "</td>"
						html += "<td>" + item.hit + "</td>"
						html += "<td>" + item.name + "</td>"
						html += "<td>" + item.wdate.year + " " + item.wdate.monthValue + " " + item.wdate.dayOfMonth + "</td>"
						html += "</tr>"
					}
					html += "</table>"
					$("div").html(html);
				}
			});
		}
		</script>
	</head>
	<body>
		글번호 : <input type="text" name="bidx">
		<button type="button" onclick="selectByBidx();">게시글 조회</button><br>
		검색어 : <input type="text" name="keyword">
		<button type="button" onclick="selectByKeyword();">게시글 조회</button><br>
		<div></div>
	</body>
</html>