<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search the list of items by various criteria</title>
</head>
<body>
<button onclick="window.location.href='filterItems.jsp';">Return to Filter Items Page</button><br>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet result = null;
	String user = session.getAttribute("user").toString();
	List<Object> parameters = new ArrayList<Object>();
	
	try {
		String categoryv, brandv,cardcolorv, boxsizev, sellerv, statusv;
		
		if(!request.getParameter("category").isEmpty())
		{
			categoryv = request.getParameter("category");
			parameters.add(categoryv);
		}
		else 
		{
			categoryv = null;
		} 
		
		if(!request.getParameter("brand").isEmpty())
		{
			brandv = request.getParameter("brand");
			parameters.add(brandv);
		}
		else 
		{
			brandv = null;
		} 
		
		if(!request.getParameter("cardcolor").isEmpty())
		{
			cardcolorv= request.getParameter("cardcolor");
			parameters.add(cardcolorv);
		}
		else 
		{
			cardcolorv = null;
		} 
		if(!request.getParameter("boxsize").isEmpty())
		{
			boxsizev= request.getParameter("boxsize");
			parameters.add(boxsizev);
		}
		else 
		{
			boxsizev = null;
		}
		
		if(request.getParameter("status").isEmpty() || request.getParameter("status").equals("both"))
		{
			statusv = null;
			
		}
		else 
		{
			statusv = request.getParameter("status");
			parameters.add(statusv);
		} 
		
		if(!request.getParameter("seller").isEmpty())
		{
			sellerv= request.getParameter("seller");
			parameters.add(sellerv);
		}
		else 
		{
			sellerv= null;
		}
		String priceParameter = request.getParameter("price");
		if(priceParameter.isEmpty())
		{
			priceParameter = "0";
		}
		else
		{
			Float price = Float.parseFloat(priceParameter);
			parameters.add(price);
		}
		
		StringBuilder query = new StringBuilder("SELECT * FROM item JOIN auction on item.item_id=auction.item_id WHERE ");
		if (!request.getParameter("category").isEmpty()) {
		    query.append(" category = ?");
		}
		if (!request.getParameter("brand").isEmpty()) {
		    query.append(" AND brand = ?");
		}
		if (!request.getParameter("cardcolor").isEmpty()) {
		    query.append(" AND cardcolor = ?");
		}
		if (!request.getParameter("boxsize").isEmpty()) {
		    query.append(" AND boxsize = ?");
		}
		if (!request.getParameter("status").isEmpty() && !request.getParameter("status").equals("both")) {
		    query.append(" AND status = ?");
		}
		if (!request.getParameter("seller").isEmpty()) {
		    query.append(" AND seller = ?");
		}
		if (!request.getParameter("price").isEmpty()) {
		    query.append(" AND price < ?");
		}
		String realQuery = query.toString();
		stmt = con.prepareStatement(realQuery);
		PreparedStatement ps3 = null;
		ps3 = con.prepareStatement(realQuery);
		int i = 1;
		for (Object parameter : parameters) {
		    ps3.setObject(i++, parameter);
		}
		result=ps3.executeQuery();
		out.print("<table>");
		out.print("<tr>");
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
		out.print("Price");
		out.print("</th>");
		out.print("<th>");
		out.print("Seller");
		out.print("</th>");
		out.print("<th>");
		out.print("Status of auction");
		out.print("</th>");

		while (result.next()) {
			out.print("<tr>");
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
			out.print(result.getFloat("price"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("seller"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("status"));
			out.print("</td>");
			
			String status1 = result.getString("status");
			
			if (!status1.equals("close") && result.getString("seller").equalsIgnoreCase(user) == false) {
				out.print("<td>");
				out.print("<form action='bidOnItem.jsp' method='post'><button name='auction_id' type='submit' value='"
						+ result.getInt("auction_id") + "'> Bid on Item </button></form>");
				out.print("</td>");
					}

					out.print("<td>");
					out.print("<form action='bidHistory.jsp' method='post'><button name='auction_id' type='submit' value='"
					+ result.getInt("auction_id") + "'> View Bid History </button></form>");
					out.print("</td>");

					out.print("<td>");
					out.print("<form action='viewSimilarItems.jsp' method='post'><button name='auction_id' type='submit' value='"
					+ result.getInt("auction_id") + "'> View Similar Items </button></form>");
					out.print("</td>");

					out.print("</tr>");

		}

		out.print("</table>");

	}

	catch (Exception e) {
		out.print(e);
	} finally {
		if (result != null)
			result.close();
		if (stmt != null)
			stmt.close();
		if (con != null)
			con.close();
	}
	%>

</body>
</html>
