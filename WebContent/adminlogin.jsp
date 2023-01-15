<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login Page</title>
<link rel="stylesheet" 
	href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css"><!--https://www.jsdelivr.com/package/npm/water.css-->
</head>
<body>
<h2> Administrator Account Login</h2>
<br>
	<form method="post" action="checkAdminLogin.jsp">
		 username: <input type="text" name="uname">
		 <br>
		 password: <input type="text" name="upass">
		 <br>
		 <input type="submit" value="Login">
	</form>
<br>
</body>
</html>
