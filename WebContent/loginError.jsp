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
<link rel ="stylesheet" href ="login.css" type ="text/css">
<title>ログインエラー画面</title>
</head>
<body>
	<div align="center">
	<p id="header"></p><br>
	</div>
	<%
		int count = (int) session.getAttribute("count");
		if (count < 5) {
	%>
	<div align="center">
		<h1>ログイン失敗(<%=count%>回目)<br>
		ユーザIDまたはパスワードが違います。</h1>
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
	<p id="header"></p><br>
	<h3>1分間ログインできません</h3>
	<script>
		var countreset = function() {
			window.location.href = 'loginCountReset.jsp';
		}
		setTimeout(countreset, 20000);
	</script>

	<form style="display: inline" name="form_count">
		<input name="counter" type="text" style="text-align: right" size="2"
			class="counter">
	</form>
	秒お待ちください

	</div>

	<script type="text/javascript">
	<!--
		count = 20; //カウントの初期値
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
		}
	%>
	<div align="center">
	<footer>
	<font size="1">Copyright(C) 2018 Cteam. All Rights Reserved.</font>
	</footer>
	</div>
</body>
</html>