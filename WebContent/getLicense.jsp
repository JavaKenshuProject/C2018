<%@ page import="java.util.List" %>
<%@ page import="model.entity.EmployeeBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>資格取得画面</title>
</head>
<body>
	<%
		String sectionName = (String)session.getAttribute("sectionName");
		if("総務部".equals(sectionName)) {
	%>
	<h1 align ="center"><font color="#000aff">資格取得画面</font></h1>
		<form action ="EmployeeServlet" method ="POST">
		<div align="left">

		<table>
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
				<td><%=employee.getEmpCode() %>%nbsp;</td>
				<td><%=employee.getLKanji() %>%nbsp;<%=employee.getFKanji() %></td>
				<td><%=employee.getLKana() %>%nbsp;<%=employee.getFKana() %></td>
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
						if(employee.getLicenseName() != null){
					%>
						<%= employee.getLicenseName()%>
					<%
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

		<br><br>
		資格			：<select name ="licenseName">
						  <option value ="なし">なし</option>
		<%
		List<String> licenseList =(List<String>) session.getAttribute("licenseList");
		if(licenseList != null){

			for(String i : licenseList){
		%>


						  <option value ="<%=i%>"><%=i%></option>

		<%
				}
			}
		%>
						  </select>

		取得日			：<select name ="licenseY">
			 			  <%
			 			  	int M = 0;
							for(int Y =1918; Y < 1996; Y++) {
						  %>
						  <option value="<%= Y %>"><%= Y %></option>
						  <%
							}
						  %>
						  </select>年
						  <select name="licenseM">
						   <%
							for(M =1; M < 13; M++) {
						  %>
						  <option value="<%= M %>"><%= M %></option>
						  <%
							}
						  %>
						  </select>月
				 		  <select name="licenseD">
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
						  </select>日<br>
						  <br>
		<br>
		<script type="text/javascript">
		<!--
			function check() {
				if(window.confirm('【確認】\n保有資格を登録しますか？')) {
					return true;
				} else {
					window.alert('キャンセルされました');
					return false;
				}
			}
		-->
		</script>
		<input type ="submit" value ="取得" onclick ="return check()">
		</div>
		</form>

		<div align ="right">
		<form action="menu.jsp" method="POST">
		<input type ="submit" value ="メニュー画面に戻る">
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