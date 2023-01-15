<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Show All Cards</title>
</head>
<body>

	
	<button onclick="window.location.href='enduserlanding.jsp';">Return to user landing</button>
<h3> List of all available Cards.</h3>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String str = "select * from item;";
		ResultSet result = null;
		result = stmt.executeQuery(str);
		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Item ID ");
		out.print("</th>");
		out.print("<th>");
		out.print("Category");
		out.print("</th>");
		out.print("<th>");
		out.print("Brand");
		out.print("</th>");
		out.print("<th>");
		out.print("Card Color");
		out.print("</th>");
		out.print("<th>");
		out.print("Box Size");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Seller");
		out.print("</th>");
		out.print("<th>");
		out.print(" ");
		out.print("</th>");
		out.print("</tr>");
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("item_id"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("category"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("brand"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("cardcolor"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("boxsize"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("seller"));
			out.print("</td>");
			
			
			if(result.getString("seller").equalsIgnoreCase(session.getAttribute("user").toString()))
			{
			
			out.print("<td>");
			out.print("<form action='createAuction.jsp' method='post'><button name='item_id' type='submit' value='"
			+ result.getInt("item_id") + "'>Create Auction</button></form>");
			out.print("</td>");
			}
			
			else{
			out.print("<td>");
			out.print("<form action='createAlertItem.jsp' method='post'><button name='item_id' type='submit' value='"
			+ result.getInt("item_id") + "'> Alert Me! </button></form>");
			out.print("</td>");
			}
			
			out.print("</tr>");
		}
		out.print("</table>");
		con.close();
	} catch (Exception e) {
	}
	%>

</body>
</html>
