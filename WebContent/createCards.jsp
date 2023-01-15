<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Card</title>
</head>
<body>
   	<button onclick="window.location.href='enduserlanding.jsp';">Return to landing</button>
   	<h2> Create a new card</h2>
	<div class="content"> 
		
		<form action="checkCreateCards.jsp" method="POST">
			<label for="category">Category</label> <select name="category"
				id="category" required>
				<option value="" disabled selected hidden="true">Select
					category</option>
				<option value="Trading Cards">Trading Cards</option>
				<option value="Trading Card Boxes">Trading Card Boxes</option>
				<option value="Trading Card Packs">Trading Card Packs</option>
			</select> <br>
			<table>
				<tr>
					<td>Brand:</td>
					<td><input type="text" name="brand" required></td>
				</tr>
				<tr>
					<td>Card Color:</td>
					<td><input type="text" name="cardcolor" required></td>
				</tr>
				<tr>
					<td>Box Size:</td>
					<td><input type="text" name="boxsize" required></td>
				</tr>
				<tr>
			</table>
			<input type="submit" value="Create Cards">
		</form>
	</div>
</body>
</html>
