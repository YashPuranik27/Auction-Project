<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Buy Me</title>
	</head>
	
<body>

		BuyMe <!-- the usual HTML way -->
		<% out.println("Welcome to BuyMe!"); %> 
		<h4> Select an account type and login</h4>
			<a href="customerRepLogin.jsp">Customer Rep</a><br>
			<a href="login.jsp">User</a><br>
			<a href="adminlogin.jsp">Admin</a>
</body>
</html>
