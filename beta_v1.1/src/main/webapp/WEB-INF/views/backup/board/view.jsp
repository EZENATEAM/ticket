<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 보기</title>
		<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
		<script>
			function DoReply()
			{
				var param = $("#replyform").serialize();
				$.ajax({
					url : "replyw.do",
					data : param,
					type : "post",
					success : function(data){
						if( data == 1 )
						{
							location.href="<%=request.getContextPath()%>/board/view.do?bidx=${ vo.bidx }";
						}else
						{
							// 댓글 등록 실패
							alert("댓글을 등록하지 못했습니다.");
						}
					}
				});
			}
			function DeleteReply( ridx )
			{
				$.ajax({
					url : "replyd.do",
					data : "ridx=" + ridx,
					type : "get",
					success : function(data){
						if( data == 1 )
						{
							location.href="<%=request.getContextPath()%>/board/view.do?bidx=${ vo.bidx }";
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
		<table border="1">
			<tr>
				<td>글 번호 : </td>
				<td>${ vo.bidx }</td>
			</tr>
			<tr>
				<td>제목 : </td>
				<td>${ vo.title }</td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><textarea name="note">${ vo.note }</textarea></td>
			</tr>
			<tr>
				<td>작성일 : </td>
				<td>${ vo.wdate }</td>
			</tr>
			<tr>
				<td>조회수 : </td>
				<td>${ vo.hit }</td>
			</tr>
			<tr>
				<td>작성자번호 : </td>
				<td>${ vo.uidx } / ${ vo.name }</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="list.do">목록으로</a>
					<a href="${pageContext.request.contextPath}/board/modify.do?bidx=${vo.bidx}">
						글 수정하기
					</a>
					<a href="<%=request.getContextPath()%>/">메인으로</a>
				</td>
			</tr>
			<c:if test="${ not empty login }">
				<tr>
					<td colspan="2">
						<form id="replyform">
							<input type="text" name="rnote">
							<input type="hidden" name="bidx" value="${ vo.bidx }">
							<input type="hidden" name="uidx" value="${ login.uidx }">
							<button type="button" onclick="DoReply();">댓글등록</button>
						</form>
					</td>
				</tr>
			</c:if>
			<c:if test="${ not empty list }">
				<c:forEach var="reply" items="${ list }">
					<tr>
						<td>${ reply.name }</td>
						<td>
							${ reply.rnote }
							<c:if test="${ reply.uidx eq login.uidx }">
								<button type="button" onclick="DeleteReply(${ reply.ridx });">댓글삭제</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</body>
</html>