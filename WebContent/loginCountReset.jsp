<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<h2>再度IDとパスワードをご確認の上ログインしてください</h2>
	<h3>ログイン画面に移動します</h3>
	</div>
	<%
		session.setAttribute("count", 0);
	%>
	<script>
		var countreset = function() {
			window.location.href = 'login.jsp';
		}
		setTimeout(countreset, 3000);
	</script>
</body>
</html>