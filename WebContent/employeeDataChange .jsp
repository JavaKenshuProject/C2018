<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>従業員情報変更画面</title>
</head>
<body>
	<%
		String sectionName = (String)session.getAttribute("sectionName");
		if("総務部".equals(sectionName)) {
	%>
	<h1 align ="center"><font color="#000aff">従業員情報変更画面</font></h1>
		<form action ="EmployeeServlet" method ="POST">
		<%
		String lKanji = (String)session.getAttribute("lKanji");
		String fKanji = (String)session.getAttribute("fKanji");
		String lKana = (String)session.getAttribute("lKana");
		String fKana = (String)session.getAttribute("fKana");
		byte sex =(byte)session.getAttribute("sex");
		%>
		氏名			：<input type ="text" width ="100" name ="lKanji" placeholder="<%=lKanji %>">
		      		      <input type ="text" width ="100" name ="fKanji" placeholder="<%=fKanji%>"><br>
		氏名（フリガナ) ：<input type ="text" width ="100" name ="lKana" placeholder="<%=lKana%>">
						  <input type ="text" width ="100" name ="fKana" placeholder="<%=fKana%>"><br>
		<%
			if(sex == 0){
		%>
		性別			：<input type ="radio" name ="sex" value="0" checked>男性
			              <input type ="radio" name="sex" value ="1" >女性<br>
		<%
			}else {
		%>
		性別			：<input type ="radio" name ="sex" value="0" >男性
			              <input type ="radio" name="sex" value ="1" checked>女性<br>
		<%
			}
		%>

		所属部署		：<select name ="sectionName" >
		<%
			if(sectionName == "経理部"){
		%>
						  <option value="経理部" selected="selected">経理部</option>
						  <option value="人事部" >人事部</option>
						  <option value="営業部" >営業部</option>
						  <option value="総務部">総務部</option>
		<%
			}else if(sectionName == "人事部"){
		%>
						  <option value="経理部" >経理部</option>
						  <option value="人事部" selected="selected">人事部</option>
						  <option value="営業部" >営業部</option>
						  <option value="総務部" ">総務部</option>
		<%
			}else if(sectionName == "営業部"){
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
						  </select><br>

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
		<input type ="submit" value ="更新" onclick="return check()">
		</form>

		<div align ="right">
		<form action="employeeList.jsp" method="POST">
		<input type="submit" value="従業員一覧画面に戻る">
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
</body>
</html>