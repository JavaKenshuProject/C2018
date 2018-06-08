<%@ page import="java.util.List" %>
<%@ page import="model.entity.EmployeeBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel ="stylesheet" href ="login.css" type ="text/css">
<title>従業員登録画面</title>
</head>
<body>
	<h2 id="header">従業員管理システム</h2>
	<%
		String sectionName = (String)session.getAttribute("sectionName");
		if("総務部".equals(sectionName) || "人事部".equals(sectionName)) {
	%>
		<div align ="center"><br><br>
		<h3 id="menu">従業員登録</h3>


		<form action ="EmployeeServlet" method ="POST">
		<table id="menutable">
		<tr>
		<td>従業員コード</td><td><input type ="text" width ="100" name ="empCode"></td>
		</tr><tr>
		<td>氏名</td><td><input type ="text" width ="100" name ="lKanji">
		      		      <input type ="text" width ="100" name ="fKanji"></td>
		</tr><tr>
		<td>氏名（フリガナ)</td><td><input type ="text" width ="100" name ="lKana">
						  <input type ="text" width ="100" name ="fKana"></td>
		</tr><tr>
		<td>性別</td><td><input type ="radio" name ="sex" value="0">男性
			              <input type ="radio" name="sex" value ="1">女性</td>
		</tr><tr>
		<td>生年月日</td><td><select name ="birthY">
			 			  <%
			 			  	int M = 0;
							for(int Y =1918; Y < 1996; Y++) {
						  %>
						  <option value="<%= Y %>"><%= Y %></option>
						  <%
							}
						  %>
						  </select>年
						  <select name="birthM">
						   <%
							for(M =1; M < 13; M++) {
						  %>
						  <option value="<%= M %>"><%= M %></option>
						  <%
							}
						  %>
						  </select>月
				 		  <select name="birthD">
				 		  <%
				 		   if(M == 4 || M == 6 || M == 9 || M == 11){

								for(int D =1; D < 31; D++) {
						  %>

						  <option value="<%= D %>"><%= D %></option>

						  <%
								}
							} else if(M==2) {

				 		   		for(int D =1; D < 29; D++) {
						  %>

						  <option value="<%= D %>"><%= D %></option>

						  <%
								}
							} else {

				 		   		for(int D =1; D < 32; D++) {
						  %>

						  <option value="<%= D %>"><%= D %></option>

						  <%
				 		   		}
				 		   	}
						  %>
						  </select>日</td>
		</tr><tr>
		<td>所属部署</td><td><select name ="sectionName">
						  <option value ="経理部">経理部</option>
						  <option value ="人事部">人事部</option>
						  <option value ="営業部">営業部</option>
						  <option value ="総務部">総務部</option>
						  </select></td>
		</tr><tr>
		<td>入社日</td><td><select name ="empY">
					  	  <%
							for(int Y =1918; Y < 1996; Y++) {
						  %>
						  <option value="<%= Y %>"><%= Y %></option>
						  <%
							}
						  %>
						  </select>年
						  <select name ="empM">
						  <%
							for(M =1; M < 13; M++) {
						  %>
						  <option value="<%= M %>"><%= M %></option>
						  <%
							}
						  %>
						  </select>月
						  <select name="empD">
				 		  <%
				 		   if(M == 4 || M == 6 || M == 9 || M == 11){

								for(int D =1; D < 31; D++) {
						  %>

						  <option value="<%= D %>"><%= D %></option>

						  <%
								}
							} else if(M==2) {

				 		   		for(int D =1; D < 29; D++) {
						  %>

						  <option value="<%= D %>"><%= D %></option>

						  <%
								}
							} else {

				 		   		for(int D =1; D < 32; D++) {
						  %>

						  <option value="<%= D %>"><%= D %></option>

						  <%
				 		   		}
				 		   	}
						  %>
						  </select>日</td>
		</tr><tr>
		<td>資格</td><td><select name ="licenseName">
						  <option value="なし">なし</option>

		<%
			List<String> licenseList =(List<String>) session.getAttribute("licenseList");
			if(licenseList != null){

				for(String i : licenseList){

		%>

						  <option value="<%=i%>"><%=i%></option>
		<%
			}
		}
		%>
						  </select></td>
		</tr>
		</table>
		<br>
		<script type="text/javascript">
		<!--
			function check() {
				if(window.confirm('【確認】\n従業員を登録しますか？')) {
					return true;
				} else {
					window.alert('キャンセルされました');
					return false;
				}
			}
		-->
		</script>
		<input type ="submit" name="action" value ="登録" onclick ="return check()">
		</form>
		</div>

		<div align ="right">
		<form action="menu.jsp" method="POST">
		<input type ="submit" value ="メニュー画面に戻る">
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