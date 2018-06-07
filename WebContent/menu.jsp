<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>メニュー画面</title>
</head>
<body>
<%
if(session.getAttribute("sectionName")!=null){
%>
	<div align="center">
        <font size="10" color="#000aff">メニュー</font>
    </div><br>
     <div align="center">

	<%!String sectionName = null;%>
	<%
		sectionName = (String) session.getAttribute("sectionName");
	%>
	<form action="EmployeeServlet" method="POST">
		<p><input type="submit" name="action" value="従業員一覧表示"></p>
		<%
			if("総務部".equals(sectionName)||"人事部".equals(sectionName)){
		%>
       	<p><input type="submit" name="action" value="従業員登録"></p>
       	<%
			}
			if("総務部".equals(sectionName)){
       	%>
       	<p><input type="submit" name="action" value="資格取得"></p>
       	<%
			}
       	%>
    </form>
  		<%
			if("総務部".equals(sectionName)){
       	%>
    <form action="addLicense.jsp" method="POST">
    	<p><input type="submit" name="action" value="資格追加"></p>
    </form>
    <form action="userRegister.jsp" method="POST">
    	<p><input type="submit" name="action" value="システム利用者登録"></p>
    </form>
   		<%
			}
   		%>
	<form action="LoginServlet" method="POST">
		<p><input type ="submit" name="action" value="ログアウト"></p>
	</form>

	</div>
<%
		}else{
	%>
	<div align="center">
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
</body>
</html>