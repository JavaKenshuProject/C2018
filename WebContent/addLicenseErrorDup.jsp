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
	<p id="header"></p><br>
        <h1>入力された情報は既に登録されています</h1>
    </div><br>
     <div align="center">
        <form action="addLicense.jsp" method="POST">
        	<p><input type="submit" value="戻る"></p>
        </form>
        <footer>
         <font size="1">Copyright(C) 2018 Cteam. All Rights Reserved.</font>
        </footer>
    </div>
</body>
</html>