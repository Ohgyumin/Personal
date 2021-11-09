<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>에러발생</h1>
<button type="button" onclick="back()">이전페이지 되돌아가기</button>
<script type="text/javascript">
function back(){
	alert('다시 한번 확인하세요.');
	history.go(-1);
}
</script>
</body>
</html>