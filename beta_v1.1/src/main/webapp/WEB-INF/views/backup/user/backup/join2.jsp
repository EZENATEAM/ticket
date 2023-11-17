<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>join</title>
<!-- 		<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script> -->
			<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
			<script>
				function test()
				{
					var msg = $("#uname").val();
					alert(msg);
				}
				
				// id 중복 체크를 했는지 저장할 플래그
				var checkIdFlag = false;
				var checkIdVal = "";
				
				function checkID()
				{
					var id_val = $("input[name=id]").val();
					alert("checkID() called : " + id_val );
					// ajax로 checkid.do에 id='id입력값'을 보내 결과를 받습니다.
					$.ajax({
						url : "checkid.do",
						data : "id=" + id_val,
						type : "get",
						success : function(data){
							//alert(data);
							if( data == 1 )
							{
								alert("중복된 ID입니다.");
								$("input[name=id]").val("");
								$("input[name=id]").focus();
								checkIdFlag = false;
								checkIdVal = "";
							}else
							{
								alert("사용할 수 있는 ID입니다.");
								checkIdFlag = true;
								checkIdVal = id_val;
							}
						}
					});
				}
				
				function blurId(obj)
				{
					if( checkIdVal != obj.value ) checkIdFlag = false;
					else checkIdFlag = true;
				}
				
				function DoSubmit()
				{
					alert($("input[name=pw]").val());
					/* 각 입력 폼에 값이 있는지 확인 */
					if( $("input[name=pw]").val() != $("input[name=pwc]").val() )
					{
						alert("비번확인해주세요");
						$("input[name=pw]").val("");
						$("input[name=pwc]").val("");
						$("input[name=pw]").focus();
						return false;
					}
					
					/* 사용할 수 있는 id인지 체크 */
					if( !checkIdFlag )
					{
						alert("아이디 중복확인을 해주세요");
						return false;
					}
					return true;
				}
				
			</script>
	</head>
	<body>
		회원가입 페이지입니다.
		<!-- form으로 이름, 나이, id, pw, pwc를 입력받는 태그를 작성하세요 -->
		<hr>
		<form method="POST" action="join.do" onsubmit="return DoSubmit()">
			<table>
				<tr>
					<td>이름 : </td>
					<td><input type="text" id="uname" name="name" required></td>
				</tr>
				<tr>
					<td>ID : </td>
					<td>
						<input type="text" name="id" required onblur="blurId(this)">
						<button type="button" onclick="checkID()">중복체크</button>
					</td>
				</tr>
				<tr>
					<td>PW : </td>
					<td><input type="password" name="pw" required></td>
				</tr>
				<tr>
					<td>PWC : </td>
					<td><input type="password" name="pwc" required></td>
				</tr>
				<tr>
					<td>주소 : </td>
					<td><input type="text" name="addr"></td>
				</tr>
			</table>
			<input type="submit" value="가입하기">
			<input type="reset" value="취소">
			<button type="button" onclick="test();">jquery확인</button>
			<button type="button" onclick="DoSubmit();">DoSubmit함수 호출</button>
		</form>
		
		<a href="checkid.do?id=ezen">ezen 중복 확인</a>
		<a href="checkid.do?id=test">test 중복 확인</a>
		<a href="checkid.do?id=admin">admin 중복 확인</a>
	</body>
</html>
