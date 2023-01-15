<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Earning Per Item</title>
</head>
<body>
	<button onclick="window.location.href='generateSalesReports.jsp';">Return to Generate Sales Report Page</button>

<% 			
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
PreparedStatement ps = null;
ResultSet result = null;
try 
{
	out.print("<b>Earning per Item: </b>");
	String str = "SELECT p.item_id, p.brand, p.category, p.cardcolor, p.boxsize, sum(a.current_bid) FROM item p, auction a WHERE p.item_id=a.item_id and a.status = 'close' and a.current_bid >= a.min_price group by p.brand, p.category, p.boxsize, p.cardcolor";
	
	result = stmt.executeQuery(str);
	out.print("<table>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Item ID");
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
	out.print("	Earning Per Item");
	out.print("</th>");
	out.print("</tr>");
	
	while (result.next()) 
	{	
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
		out.print("$" + result.getFloat("sum(a.current_bid)"));
		out.print("</td>");
		out.print("</tr>");
	}
	out.print("</table>");	
	out.print("<br/>");
	
	
}
catch (Exception e) 
{
		out.print(e);
}
finally
{
	if (result != null) result.close();
	if (ps != null) ps.close();
	if (stmt != null) stmt.close();
	if (con != null) con.close();
}%>


</body>
</html>
