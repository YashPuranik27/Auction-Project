<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filter Items</title>
	
</head>
<body>
	<button onclick="window.location.href='enduserlanding.jsp';">Return to landing</button><br>

	<b>Search items</b>
	<br><b> items in the * are needed </b><br><br>
	<form method="post" action="filterItemsHandler.jsp">
	<label for="category">*Category</label> <select name="category"
				id="category" required>
				<option value="" disabled selected hidden="true">select
					category</option>
				<option value="Cards">Cards</option>
			</select> <br>
		<table>
		<tr>
				<td>Brand:</td>
				<td><input type="text" name="brand"></td>
			</tr>
			<tr>
				<td>Card Color:</td>
				<td><input type="text" name="cardcolor"></td>
			</tr>
			<tr>
				<td>Box Size:</td>
				<td><input type="text" name="boxsize"></td>
			</tr>
			<tr>
				<td>Seller:</td>
				<td><input type="text" name="seller"></td>
			</tr>
			<tr>
				<td>Price less than:</td>
				<td><input type="text" name="price"></td>
			</tr>
		</table>
		<label for="status">*status</label> <select name="status"
				id="status" required >
				<option value="" disabled selected hidden="true">Select
					category</option>
				<option value="open">open</option>
				<option value="close">closed</option>
				<option value="both">both</option>
				
			</select> <br>
		<input type="submit" value="Search">
	</form>
</body>
</html>
