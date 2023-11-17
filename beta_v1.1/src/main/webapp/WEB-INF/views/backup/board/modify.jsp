<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 수정</title>
		<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
		<script>
			function deleteItem()
			{
				if(!confirm("글을 삭제하시겠습니까?")) return;
				var bidx = $("input[name=bidx]").val();
				var uidx = $("input[name=uidx]").val();
				$.ajax({
					url : "delete.do",
					data : { "bidx" : bidx, "uidx" : uidx },
					type : "get",
					success : function(data){
						if( data == 1 )
						{
							// 글 삭제 성공
							alert("게시글을 삭제했습니다.");
							location.href="${pageContext.request.contextPath}/board/list.do";
						}else
						{
							// 글 삭제 실패
							alert("삭제하지 못했습니다.");
						}
					}
				});
			}
		</script>
		
		
	</head>
	<body>
		<form method="post" action="modify.do" >
			<table>
				<tr>
					<td>글 번호 : </td>
					<td><input type="text" name="bidx" value="${ vo.bidx }" readonly></td>
				</tr>
				<tr>
					<td>제목 : </td>
					<td><input type="text" name="title" value="${ vo.title }"></td>
				</tr>
				<tr>
					<td>내용 : </td>
					<td><textarea name="note">${ vo.note }</textarea></td>
				</tr>
				<tr>
					<td>작성일 : </td>
					<td><input type="datetime-local" name="wdate" value="${ vo.wdate }" readonly></td>
				</tr>
				<tr>
					<td>조회수 : </td>
					<td><input type="number" name="hit" value="${ vo.hit }" readonly></td>
				</tr>
				<tr>
					<td>작성자번호 : </td>
					<td><input type="number" name="uidx" value="${ vo.uidx }" readonly> / ${ vo.name }</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="글수정">
						<input type="reset" value="취소">
						<button type="button" onclick="deleteItem()">글 삭제</button>
						<a href="${pageContext.request.contextPath}/board/view.do?bidx=${vo.bidx}">글 조회로</a>
						<a href="<%=request.getContextPath()%>/">메인으로</a>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>