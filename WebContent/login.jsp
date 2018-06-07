<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel ="stylesheet" href ="login.css" type ="text/css">
<title>ログイン画面</title>
</head>
<body>


	<%
		if (session.getAttribute("count") == null || (int) session.getAttribute("count") < 5) {
	%>
	<div align="center">
		<h1 id="header">Login</h1>
	</div>
	<br>
	<div align="center">
		<form action="LoginServlet" method="POST">
			<table>
				<tr>
					<td align="left">ユーザID</td>
					<td align="left"><input type="text" name="userId"></td>
				</tr>
				<tr>
					<td align="left">パスワード</td>
					<td align="left"><input type="password" name="password"></td>
				</tr>

			<br>
			<%
			if (session.getAttribute("count") != null && (int) session.getAttribute("count") == 4) {
			%>

			<script type="text/javascript">
			<!--
				function check() {

					if (window.confirm('4回連続失敗しています。ID、パスワードは確認しましたか？')) { // 確認ダイアログを表示

						return true; // 「OK」時は送信を実行

					} else { // 「キャンセル」時の処理

						window.alert('キャンセルされました'); // 警告ダイアログを表示
						return false; // 送信を中止

					}

				}
			// -->
			</script>

			<%
				}
			%>
			<tr>
				<td></td><td><input type="submit" name="action" value="ログイン"
				onClick="return check()"></td>
		</table>
		</form>

	<%
		} else {
	%>
	<p id="header"></p>
	<h1>ログインできません</h1>
	<script>
		var countreset = function() {
			window.location.href = 'loginError.jsp';
		}
		setTimeout(countreset, 3000);
	</script>
	<%
		}
	%>
	<footer>
	<font size="1">Copyright(C) 2018 Cteam. All Rights Reserved.</font>
	</footer>
	</div>
</body>
</html>