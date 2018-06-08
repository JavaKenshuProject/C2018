<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Timer"%>
<%@ page import="java.util.TimerTask"%>

<!DOCTYPE html>
<html>
<head>
<style>
.counter {
	border-style: none
}

input {
	font-size: 110%
}
</style>
<meta charset="UTF-8" />
<link rel="stylesheet" href="login.css" type="text/css">
<title>ログインエラー画面</title>
</head>
<body>
	<div align="center">
		<h2 id="header">従業員管理システム</h2>
		<br><br><br><br>
	</div>

	<br>
	<%
	if(session.getAttribute("count")==null){
	%>
	<div align="center">
	<br>
	<h3>このページにはアクセスできません</h3>
	<h3>5秒後にメニュー画面に遷移します</h3>
	</div>
	<script>
		var countreset = function() {
			window.location.href = 'menu.jsp';
		}
		setTimeout(countreset, 5000);
		</script>
	<%}else{
		int count = (int) session.getAttribute("count");
		if (count < 5) {
	%>
	<div align="center">
		<h2>
			ログイン失敗(<%=count%>回目)<br> ユーザIDまたはパスワードが違います
		</h2>
	</div>
	<br>
	<div align="center">
		<form action="login.jsp" method="POST">
			<p>
				<input type="submit" value="戻る">
			</p>
		</form>
	</div>
	<%
		} else {
	%>
	<div align="center">
		<h3>1分間ログインできません</h3>
		<script>
			var countreset = function() {
				window.location.href = 'loginCountReset.jsp';
			}
			setTimeout(countreset, 60000);
		</script>

		<form style="display: inline" name="form_count">
			<input name="counter" type="text" style="text-align: right" size="2"
				class="counter">
		</form>
		秒お待ちください

	</div>

	<script type="text/javascript">
	<!--
		count = 60; //カウントの初期値
		timerID = setInterval('countdown()', 1000); //1秒毎にcountup()を呼び出し

		function countdown() {
			if (count > 0) {
				count--;
			}
			document.form_count.counter.value = count;
		}
		-->
	</script>

	<%
		}}
	%>
	<div align="center">
		<footer>
			<font size="1">Copyright(C) 2018 Cteam. All Rights Reserved.</font>
		</footer>
	</div>
</body>
</html>