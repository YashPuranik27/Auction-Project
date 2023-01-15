<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
</head>
<body>
<h2>User Account Login</h2>
<br>
	<form method="post" action="checkLogin.jsp">
		 username: <input type="text" name="uname">
		 <br>
		 password: <input type="text" name="upass">
		 <br>
		 <input type="submit" value="Login">
	</form>
	<a href="createAccount.jsp">Don't have an account? Register here.</a>
<br>
</body>
</html>
