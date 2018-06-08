<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel ="stylesheet" href ="login.css" type ="text/css">
<style type="text/css">
#btn{width:150px;}
</style>
<title>メニュー画面</title>
</head>
<body>
<%
if(session.getAttribute("sectionName")!=null){
%>
	<div align="center">
        <h2 id="header">従業員管理システム</h2>
    </div><br><br>
    <div align="center">

    <h3 id="menu">メニュー</h3>

	<table id="menutable">

	<%!String sectionName = null;%>
	<%
		sectionName = (String) session.getAttribute("sectionName");
	%>
	<tr><td>
	<form action="EmployeeServlet" method="POST">
		<input type="submit" name="action" value="従業員一覧表示" id="btn">
	</form>
	</td></tr>
		<%
			if("総務部".equals(sectionName)||"人事部".equals(sectionName)){
		%>
	<tr><td>
	<form action="EmployeeServlet" method="POST">
		<input type="submit" name="action" value="従業員登録" id="btn">
	</form>
	</td></tr>
       	<%
			}
			if("総務部".equals(sectionName)){
       	%>
	<tr><td>
	<form action="EmployeeServlet" method="POST">
		<input type="submit" name="action" value="資格取得" id="btn">
	</form>
	</td></tr>
       	<%
			}
			if("総務部".equals(sectionName)){
       	%>
	<tr><td>
    <form action="addLicense.jsp" method="POST">
    	<input type="submit" name="action" value="資格追加" id="btn">
    </form>
    </td></tr>
    <tr><td>
    <form action="userRegister.jsp" method="POST">
    	<input type="submit" name="action" value="システム利用者登録" id="btn">
    </form>
    </td></tr>
   		<%
			}
   		%>
	<tr><td>
	<form action="LoginServlet" method="POST">
		<input type ="submit" name="action" value="ログアウト" id="btn">
	</form>
	</td></tr>
	</table>
	</div>
<%
		}else{
	%>
	<div align="center">
	<p id="header"></p><br><br>
	<h3>ログイン画面に遷移します</h3>
	</div>
	<script>
		var countreset = function() {
			window.location.href = 'login.jsp';
		}
		setTimeout(countreset, 1000);
	</script>
	<%
		}
	%>
	<div align="center">
	<footer>
	<font size = "1">Copyright(C) 2018 Cteam. All Rights Reserved.</font>
	</footer>
	</div>
</body>
</html>