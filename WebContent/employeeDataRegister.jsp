<%@ page import="java.util.List" %>
<%@ page import="model.entity.EmployeeBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>従業員登録画面</title>
</head>
<body>
	<%
		String sectionName = (String)session.getAttribute("sectionName");
		if("総務部".equals(sectionName) || "人事部".equals(sectionName)) {
	%>
		<h1 align ="center"><font color="#000aff">従業員登録画面</font></h1>
		<form action ="EmployeeServlet" method ="POST">
		従業員コード	：<input type ="text" width ="100" name ="empCode"><br>
		氏名			：<input type ="text" width ="100" name ="lKanji">
		      		      <input type ="text" width ="100" name ="fKanji"><br>
		氏名（フリガナ) ：<input type ="text" width ="100" name ="lKana">
						  <input type ="text" width ="100" name ="fKana"><br>
		性別			：<input type ="radio" name ="sex" value="0">男性
			              <input type ="radio" name="sex" value ="1">女性<br>
		生年月日		：<select name ="birthY">
			 			  <%
			 			  	int M = 0;
							for(int Y =1918; Y < 1996; Y++) {
						  %>
						  <option value="<%= Y %>"></option>
						  <%
							}
						  %>
						  </select>年
						  <select name="birthM">
						   <%
							for(M =1; M < 13; M++) {
						  %>
						  <option value="<%= M %>"></option>
						  <%
							}
						  %>
						  </select>月
				 		  <select name="birthD">
				 		   <%
				 		   switch(M){
				 		   	case 4:
				 		   	case 6:
				 		   	case 9:
				 		   	case 11:

								for(int D =1; D < 31; D++) {
						  %>

						  <option value="<%= D %>"></option>

						  <%
						  	break;
							}
				 		   	case 2:
				 		   		for(int D =1; D < 29; D++) {
						  %>

						  <option value="<%= D %>"></option>

						  <%
						  	break;
							}
				 		   	default:
				 		   		for(int D =1; D < 32; D++) {
						  %>

						  <option value="<%= D %>"></option>

						  <%
						  	break;
				 		   }
				 		   }
						  %>

						  </select>日<br>

		所属部署		：<select name ="sectionName">
						  <option value ="経理部">経理部</option>
						  <option value ="人事部">人事部</option>
						  <option value ="営業部">営業部</option>
						  <option value ="総務部">総務部</option>
						  </select><br>
		入社日			：<select name ="empY">
					  	  <%
							for(int Y =1918; Y < 1996; Y++) {
						  %>
						  <option value="<%= Y %>"></option>
						  <%
							}
						  %>
						  </select>年
						  <select name ="empM">
						  <%
							for(M =1; M < 13; M++) {
						  %>
						  <option value="<%= M %>"></option>
						  <%
							}
						  %>
						  </select>月
						  <select name="empD">
						   <%
				 		   switch(M){
				 		   	case 4:
				 		   	case 6:
				 		   	case 9:
				 		   	case 11:

								for(int D =1; D < 31; D++) {
						  %>

						  <option value="<%= D %>"></option>

						  <%
						  	break;
							}
				 		   	case 2:
				 		   		for(int D =1; D < 29; D++) {
						  %>

						  <option value="<%= D %>"></option>

						  <%
						  	break;
							}
				 		   	default:
				 		   		for(int D =1; D < 32; D++) {
						  %>
						  <option value="<%= D %>"></option>

						  <%
						  	break;
				 		   }
				 		   }
						  %>

						  </select>日<br>

		資格			：<select name ="licenseName">
						  <option value="なし"></option>

		<%
			List<String[]> licenseList =(List<String[]>) session.getAttribute("licenseList");
			if(licenseList != null){

				for(String[] i : licenseList){

		%>

						  <option value="<%=i%>"></option>
		<%
			}
		}
		%>
						  </select><br>
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
		<input type ="submit" value ="登録" onclick ="return check()">
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