<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>파일 업로드</title>
	</head>
	<body>
		<form method="post" action="fileupload.do" enctype="multipart/form-data" accept-charset="UTF-8">
			<input type="text" name="title"><br>
			<input type="text" name="note"><br>
			<input type="file" name="file" multiple="multiple"><br>
			<input type="submit" value="업로드">
		</form>
	</body>
</html>