<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
</head>
<body>


	<%
		if (session.getAttribute("count") == null || (int) session.getAttribute("count") < 5) {
	%>
	<div align="center">
		<font size="10" color="#000aff">従業員情報管理システム</font>
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
			</table>
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
			<input type="submit" name="action" value="ログイン"
				onClick="return check()">
		</form>
	</div>
	<%
		} else {
	%>
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
</body>
</html>