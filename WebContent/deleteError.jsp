<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel ="stylesheet" href ="login.css" type ="text/css">
<title>削除エラー画面</title>
</head>
<body>
	<div align="center">
		<h2 id="header">従業員管理システム</h2>
		<br><br><br><br>
        <h2>従業員を選択してください</h2>
		<br><br><br><br><br>
        <form action="EmployeeServlet" method="POST">
        	<input type="submit" name="action" value="戻る">
        </form>
        <footer>
        <font size="1">Copyright(C) 2018 Cteam. All Rights Reserved.</font>
        </footer>
    </div>
</body>
</html>