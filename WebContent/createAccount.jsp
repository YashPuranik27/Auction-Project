<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Account</title>
<link rel="stylesheet" 
	href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css"><!--https://www.jsdelivr.com/package/npm/water.css-->
</head>
<body>
<h2> Create a New Account</h2>
	<form action="checkCreateAccount.jsp" method="POST">
		Enter name: <input type="text" name="name" /> <br /> 
		Enter username: <input type="text" name="username" /> <br /> 
		Enter password: <input type="password" name="password" /> <br /> 
		Enter address: <input type="text" name="address" /> <br /> 
		Enter email: <input type="text" name="email" /> <br /> 
		
		<input type="submit" value="Submit" />
	</form>
</body>
</html>
