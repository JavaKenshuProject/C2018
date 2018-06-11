<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel ="stylesheet" href ="login.css" type ="text/css">
<title>資格追加エラー画面</title>
</head>
<body>
	<div align="center">
		<h2 id="header">従業員管理システム</h2>
		<br><br><br><br>
        <% String error = (String)session.getAttribute("error"); %>
        <h2><%= error %></h2>
		<br><br><br><br><br>
        <form action="addLicense.jsp" method="POST">
        	<input type="submit" value="戻る">
        </form>
        <footer>
        <font size="1">Copyright(C) 2018 Cteam. All Rights Reserved.</font>
        </footer>
    </div>
</body>
</html>