<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Auctions</title>
</head>
<body>

	<% 	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement statement = con.createStatement();
	ResultSet result = null;
	PreparedStatement prepared = null;
	try
	{
		String newAuction = request.getParameter("auction_id");
	String isClosed = "SELECT status FROM auction WHERE auction_id = ? ";
	prepared = con.prepareStatement(isClosed);
	prepared.setString(1, newAuction);
	result = prepared.executeQuery();
	result.next();
	if(result.getString("status").equals ("open"))
	{
		String delete = "DELETE FROM auction WHERE auction_id ='" + request.getParameter("auction_id") + "'";
        statement.executeUpdate(delete);
		response.sendRedirect(".jsp"); <!--add a reference to customer rep auction management jsp page-->
	}
	else
	{
		out.print("Auction is closed. Cannot be deleted.");	
	}	
	}		
	
	catch (Exception x) 
	{
			out.print(x);
	}
	finally
	{
		if (result != null) result.close();
		if (statement != null) statement.close();
		if (con != null) con.close();
	}%>

</body>
</html>
