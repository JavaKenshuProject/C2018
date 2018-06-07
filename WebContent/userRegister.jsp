<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel ="stylesheet" href ="login.css" type ="text/css">
<title>システム利用者登録画面</title>
</head>
<body>
	<%
		if("総務部".equals(session.getAttribute("sectionName"))){
	%>

	<div align="center">
        <h1 id="header">システム利用者登録</h1>
    </div><br>
    <div align="center">
        <form action="UserServlet" method="POST">
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
           			 所属部署<select name="sectionName">
           			 		<option value=null selected="selected">選択してください</option>
            				<option value="経理部">経理部</option>
            				<option value="人事部">人事部</option>
            				<option value="営業部">営業部</option>
            				<option value="総務部">総務部</option>
            				</select>

            <br>
            <input type="submit" value="登録" onClick="return check()">
        </form>
    </div>

    <div align="right">
  	<form action="menu.jsp" method="POST">
		<p><input type="submit" value="メニュー画面に戻る"></p>
		</form>
    </div>

    <script type="text/javascript">
			<!--
				function check() {

					if (window.confirm('                  【確認】\n新規システム利用者を登録しますか？')) { // 確認ダイアログを表示

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