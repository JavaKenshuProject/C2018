<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel ="stylesheet" href ="login.css" type ="text/css">
<title>資格追加画面</title>
</head>
<body>
<%
if("総務部".equals(session.getAttribute("sectionName"))){
%>
	<div align="center">
		<h1 id="header">資格追加画面</h1>
		<form action ="LicenseServlet" method ="POST">
		資格コード		：<input type ="text" width ="100" name ="licenseCode"><br>
		資格名		    ：<input type ="text" width ="100" name ="licenseName"><br>
		<br>
		<input type ="submit" value ="追加" onClick="return check()">
		</form>
	</div>
		<div align ="right">
		<form action = "menu.jsp" method="POST">
			<input type="submit" value="メニュー画面に戻る">
		</form>
		</div>

		<script type="text/javascript">
			<!--
				function check() {

					if (window.confirm('       【確認】\n資格を追加しますか？')) { // 確認ダイアログを表示

						return true; // 「OK」時は送信を実行

					} else { // 「キャンセル」時の処理

						window.alert('キャンセルされました'); // 警告ダイアログを表示
						return false; // 送信を中止

					}

				}
			// -->
			</script>
<%
		}else{
	%>
	<div align="center">
	<p id="header"></p>
	<h3>このページにはアクセスできません</h3>
	<h3>5秒後にメニュー画面に遷移します</h3>
	</div>
	<script>
		var countreset = function() {
			window.location.href = 'menu.jsp';
		}
		setTimeout(countreset, 5000);
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