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
	<h2 id="header">従業員管理システム</h2>
	<%
		String sectionName = (String)session.getAttribute("sectionName");
		if(sectionName != null) {
	%>
	<div align="center"><br><br>
		<h3 id="menu">従業員一覧</h3>
	</div><br>
	<form action="EmployeeServlet" method="POST">
	<div align="right">
		<select name="column">
			<option value="氏名">氏名</option>
			<option value="部署名">部署名</option>
		</select>
		<input type="text" name="value"><input type="submit" name="action" value="検索">
		<hr>
	</div>
	<div align="left">

		<table id="employeetable">
			<tr>
				<th> </th>
				<th>従業員コード</th>
				<th>氏名</th>
				<th>氏名（フリガナ）</th>
				<th>性別</th>
				<th>生年月日</th>
				<th>所属部署</th>
				<th>入社日</th>
				<th>保有資格</th>
			</tr>

		<%
			List<EmployeeBean> empList =
					(List<EmployeeBean>) session.getAttribute("empList");
			if(empList != null){
				for(int i = 0; i<empList.size(); i++){
					EmployeeBean employee =empList.get(i);
		%>
			<tr>
				<td><input type="radio" name="empCode" value="<%=employee.getEmpCode() %>"></td>
				<td><%=employee.getEmpCode() %>&nbsp;</td>
				<td><%=employee.getLKanji() %>&nbsp;<%=employee.getFKanji() %></td>
				<td><%=employee.getLKana() %>&nbsp;<%=employee.getFKana() %></td>
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
				<td><%=employee.getSectionName() %></td>
				<td><%=employee.getEmpDate() %></td>
				<td><%
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
					%>
					</td>
			</tr>
		<%
				}
			}
		%>
		</table>
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
		<input type="submit" name="action" value="従業員情報変更">
		<input type ="submit" name="action" value="削除" onclick ="return check()">
		</p>
		</div>
		</form>

		<div align ="right">
		<form action="menu.jsp" method="POST">
		<input type="submit" value="メニュー画面に戻る">
		</form>
		</div>
	<%
		} else {
	%>
	<div align="center">
	<h3 >このページにはアクセスできません</h3>
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