<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel ="stylesheet" href ="login.css" type ="text/css">
<title>ログインエラー解除画面</title>
</head>
<body>
	<div align="center">
	<div align="center">
		<h2 id="header">従業員管理システム</h2>
	</div>
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
	</script><br><br>
	<div align="center">
	<footer>
	<font size="1">Copyright(C) 2018 Cteam. All Rights Reserved.</font>
	</footer>
	</div>
</body>
</html>