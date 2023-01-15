<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Auction</title>
</head>
<body>  
	<button onclick="window.location.href='enduserlanding.jsp';">Return to dashboard</button>

<h3>New Auction</h3>
	<div class="content">
		<form action="checkCreateAuction.jsp" method="POST">	
	<table>
	 <tr> 
	 <td>
	<input type="hidden" name="item_id" value = <%=request.getParameter("item_id")%>>
	</td>
	</tr> 
	<tr>    
	<td>End Date and Time: <br><p>Enter the auction end date in yyyy-MM-dd hh:mm:ss</p> </td><td><input type="text" name="end_datetime" id="end_datetime" placeholder="yyyy-MM-dd hh:mm:ss" required></td>
	</tr> 
	<tr>    
	<td>Set Minimum Price: <br><p>Enter the minimum price of the auction</p><br> <p>price must be larger than 0 </p> </td><td><input type="number" name="min_price" placeholder="0" required></td>
	</tr>	
	<tr>    
	<td>Set Starting Price: <br><p>Enter the starting price of the auction</p><br> <p>starting price must be less than the minimum price </p> </td><td><input type="number" name="starting_price" placeholder="0" required></td>
	</tr>	
	<tr>    
	<td>Set Bid Increment: <br><p>Enter the Bid Increment for the next valid bid</p> </td><td><input type="number" name="new_bid_increment" placeholder="0" required></td>
	</tr>	
	</table>
	<input type="submit" value="Create Auction">
	</form>
	</div>
</body>
</html>
