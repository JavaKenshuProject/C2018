<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel ="stylesheet" href ="login.css" type ="text/css">
<title>従業員情報変更画面</title>
</head>
<body>
	<%
		String uSectionName = (String)session.getAttribute("sectionName");
		if("総務部".equals(uSectionName)) {
	%>
	<form action ="EmployeeServlet" method ="POST">
	<div align="center">
		<h2 id="header">従業員管理システム</h2>

		<h3 id="menu">従業員情報変更</h3>
		<%
		String lKanji = (String)session.getAttribute("lKanji");
		String fKanji = (String)session.getAttribute("fKanji");
		String lKana = (String)session.getAttribute("lKana");
		String fKana = (String)session.getAttribute("fKana");

		byte sex = -1;
		if(session.getAttribute("sex") != null){
			sex = (byte)session.getAttribute("sex");
		}

		String sectionName = (String)session.getAttribute("sectionName2");
		%>
		<table id="menutable">
		<tr>
		<td>氏名</td><td><input type ="text" width ="100" name ="lKanji" value="<%=lKanji %>">
		      		      <input type ="text" width ="100" name ="fKanji" value="<%=fKanji%>"></td>
		<tr>
		<td>氏名（フリガナ)</td><td><input type ="text" width ="100" name ="lKana" value="<%=lKana%>">
						  <input type ="text" width ="100" name ="fKana" value="<%=fKana%>"></td>
		<%
			if(sex == 0){
		%>
		<tr>
		<td>性別</td><td><input type ="radio" name ="sex" value="0" checked>男性
			              <input type ="radio" name="sex" value ="1" >女性</td>
		</tr>
		<%
			}else {
		%>
		<tr>
		<td>性別</td><td><input type ="radio" name ="sex" value="0" >男性
			              <input type ="radio" name="sex" value ="1" checked>女性</td>
		</tr>
		<%
			}
		%>
		<tr>
		<td>所属部署</td><td><select name ="sectionName" >
		<%
			if("経理部".equals(sectionName)){
		%>
						  <option value="経理部" selected="selected">経理部</option>
						  <option value="人事部" >人事部</option>
						  <option value="営業部" >営業部</option>
						  <option value="総務部">総務部</option>
		<%
			}else if("人事部".equals(sectionName)){
		%>
						  <option value="経理部" >経理部</option>
						  <option value="人事部" selected="selected">人事部</option>
						  <option value="営業部" >営業部</option>
						  <option value="総務部" >総務部</option>
		<%
			}else if("営業部".equals(sectionName)){
		%>
						  <option value="経理部" >経理部</option>
						  <option value="人事部" >人事部</option>
						  <option value="営業部" selected="selected">営業部</option>
						  <option value="総務部" >総務部</option>
		<%
			}else {
		%>
						  <option value="経理部" >経理部</option>
						  <option value="人事部" >人事部</option>
						  <option value="営業部" >営業部</option>
						  <option value="総務部" selected="selected">総務部</option>
		<%
			}
		%>
						  </select></td>
		</tr>
		</table>
		<br>
		<script type="text/javascript">
		<!--
			function check() {
				if(window.confirm('【確認】\n従業員情報を変更しますか？')) {
					return true;
				} else {
					window.alert('キャンセルされました');
					return false;
				}
			}
		-->
		</script>
		<input type ="submit" name="action" value ="更新" onclick="return check()">
	</div>

		<div align ="right">
		<input type="submit" name="action" value="従業員一覧画面に戻る">
		</div>
	</form>
	<%
		} else {
	%>
	<div align="center">
	<h2 id="header">従業員管理システム</h2><br><br>
	<h3>このページにはアクセスできません</h3>
	<h3>5秒後にメニュー画面へ遷移します</h3>
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