<%@ page import ="java.sql.Date" %>
<%@ page import ="model.entity.EmployeeBean" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel ="stylesheet" href ="login.css" type ="text/css">
<title>従業員一覧画面</title>
</head>
<body>
	<%
		String sectionName = (String)session.getAttribute("sectionName");
		if(sectionName != null) {
	%>
	<div align="center">
		<h2 id="header">従業員管理システム</h2>
		<h3 id="menu">従業員一覧</h3>
	</div>
	<form action="EmployeeServlet" method="POST">
	<div align="right">
		<div id="search">
		<select name="column">
			<%
				String column = (String)session.getAttribute("column");
				String value = (String)session.getAttribute("value");
				if(value == null) {
					value = "";
				}

				if("部署名".equals(column)) {
			%>
			<option value="氏名">氏名</option>
			<option value="部署名" selected="selected">部署名</option>
			<%
				} else {
			%>
			<option value="氏名" selected="selected">氏名</option>
			<option value="部署名">部署名</option>
			<%
				}
			%>
		</select>
		<input type="text" name="value" value=<%=value%>><input type="submit" name="action" value="検索"></div>
	</div>
	<div class="employeetable">
		<div style="position:relative; left:29px;">
		<table class="tablestyle1">
			<tr>
				<th style="width:1.35em;"> </th>
				<th style="width:6em;">従業員コード</th>
				<th style="width:5.3em;">氏名</th>
				<th style="width:11.2em;">氏名（フリガナ）</th>
				<th style="width:2em;">性別</th>
				<th style="width:5.55em;">生年月日</th>
				<th style="width:4em;">所属部署</th>
				<th style="width:5.6em;">入社日</th>
				<th style="width:10.55em;">保有資格</th>
			</tr>
		</table>
		</div>
		<div align="center">
		<div class="scroll">
		<table class="tablestyle">
		<%
			List<EmployeeBean> empList =
					(List<EmployeeBean>) session.getAttribute("empList");
			if(empList != null){
				for(int i = 0; i<empList.size(); i++){
					EmployeeBean employee =empList.get(i);
		%>
			<tr>
				<td><input type="radio" name="empCode" value="<%=employee.getEmpCode() %>"></td>
				<td style="width:6em;"><%=employee.getEmpCode() %>&nbsp;</td>
				<td style="width:5.3em;"><%=employee.getLKanji() %>&nbsp;<%=employee.getFKanji() %></td>
				<td style="width:11.3em;"><%=employee.getLKana() %>&nbsp;<%=employee.getFKana() %></td>
				<td><%
						if(employee.getSex() == 0){
					%>
							男性
					<%
						}else{
					%>
							女性
					<%
						}
					%></td>
				<td><%=employee.getBirthday() %></td>
				<td style="width:4em;"><%=employee.getSectionName() %></td>
				<td><%=employee.getEmpDate() %></td>
				<td style="width:10.7em;"><%
						if(employee.getLicenseNames() != null){
							for(String license : employee.getLicenseNames()) {
					%>
								<%=license %>&nbsp;
					<%
							}
						}else {
					%>
							なし
					<%
						}
					%></td>
			</tr>
		<%
				}
			}
		%>
		</table>
		</div>
		<script type="text/javascript">
		<!--
			function check() {
				if(window.confirm('【確認】\n従業員を削除しますか？')) {
					return true;
				} else {
					window.alert('キャンセルされました');
					return false;
				}
			}
		-->
		</script>
		<p>
		<%
			if("総務部".equals(sectionName)){
		%>
			<input type="submit" name="action" value="従業員情報変更">&nbsp;&nbsp;
			<input type ="submit" name="action" value="削除" onclick ="return check()">
		<%
			}
		%>
		</p>
		</div>
	</div>
		</form>
		<div align="right">
		<form action="menu.jsp" method="POST">
		<input type="submit" value="メニュー画面に戻る">
		</form>
		</div>
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
	<font size = "1">Copyright(C) 2018 Cteam. All Rights Reserved.</font>
	</footer>
	</div>
</body>
</html>