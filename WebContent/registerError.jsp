<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel ="stylesheet" href ="login.css" type ="text/css">
<title>従業員情報登録エラー画面</title>
</head>
<body>
	<div align="center">
		<h2 id="header">従業員管理システム</h2><br>
        <h2>入力された情報に不備があります</h2>
    </div><br>
     <div align="center">
        <form action="employeeDataRegister.jsp" method="POST">
        	<p><input type="submit" value="戻る"></p>
        </form>
        <footer>
        <font size="1">Copyright(C) 2018 Cteam. All Rights Reserved.</font>
        </footer>
    </div>
</body>
</html>