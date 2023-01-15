<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>View Similar Items</title>
<body>
	<button onclick="window.location.href='sortAuctions.jsp';">Return to Auctions Page</button>
<h2>View Similar Items</h2>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	PreparedStatement ps = null;
	ResultSet result = null;
	String user = session.getAttribute("user").toString();
	int auction_id = Integer.parseInt(request.getParameter("auction_id"));
	String str = "SELECT * FROM auction a, item p WHERE a.item_id=p.item_id and a.auction_id=" + auction_id;
	result = stmt.executeQuery(str);
	result.next();

	String category = result.getString("category");
	String brand = result.getString("brand");
	String cardcolor = result.getString("cardcolor");
	String boxsize = result.getString("boxsize");
	java.sql.Timestamp start_date = result.getTimestamp("start_date");
	java.sql.Timestamp end_date = result.getTimestamp("end_date");

	str = "SELECT * FROM auction a, item p WHERE a.item_id=p.item_id and (p.cardcolor='" + cardcolor + "' or p.boxsize='"
			+ boxsize + "' or p.category='" + category + "' or p.brand='" + brand
			+ "') and a.start_date >= DATE_ADD(NOW(), INTERVAL -1 MONTH)";
	Statement stmt1 = con.createStatement();
	result = stmt1.executeQuery(str);

	out.print("<table>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Auction ID ");
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
	out.print("Current Bid");
	out.print("</th>");
	

	out.print("<th>");
	out.print("Price");
	out.print("</th>");
	
	out.print("<th>");
	out.print("New Bid Increment");
	out.print("</th>");

	out.print("<th>");
	out.print("End Time");
	out.print("</th>");

	out.print("<th>");
	out.print("Status");
	out.print("</th>");

	out.print("<th>");
	out.print(" ");
	out.print("</th>");
	out.print("</tr>");

	while (result.next()) {
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getInt("auction_id"));
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

		out.print("<td>");
		out.print(result.getFloat("current_bid"));
		out.print("</td>");

		out.print("<td>");
		out.print("$" + result.getFloat("price"));
		out.print("</td>");
		
		out.print("<td>");
		out.print("$" + result.getFloat("new_bid_increment"));
		out.print("</td>");

		out.print("<td>");
		out.print(result.getString("end_date"));
		out.print("</td>");

		out.print("<td>");
		String status = result.getString("status");
		out.print(result.getString("status"));
		out.print("</td>");
		
		String status1= result.getString("status");
		if (!status1.equals("close") && result.getString("seller").equalsIgnoreCase(user) == false) {
			out.print("<td>");
			out.print("<form action='bidOnItem.jsp' method='post'><button name='auction_id' type='submit' value='"
					+ result.getInt("auction_id") + "'> Bid on Item </button></form>");
			out.print("</td>");
				}
		
		out.print("</tr>");
	}
	out.print("</table>");
	%>
</body>
</html>
