<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Bids</title>
</head>
<body>
	<% 	
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement statement = con.createStatement();
	ResultSet result = null;
	PreparedStatement prepare = null;
	float current_bid =0;
	String name = "";
	String str ;
	try
	{
		int bid_id = Integer.parseInt(request.getParameter("bid_id")); 
		
		String delete = "DELETE FROM bid WHERE bid_id =" + bid_id;
        statement.executeUpdate(delete);
    	
    	int auction_id = Integer.parseInt(session.getAttribute("auction_id").toString());
    	
    	String str2 = "select max(amount) from bid where auction_id = ?";
    	PreparedStatement prepare3 = con.prepareStatement(str2);
    	prepare3.setInt(1,auction_id);
    	ResultSet result2 = prepare3.executeQuery();
    	if(result2.next())
    	{
    	current_bid = result2.getFloat("max(amount)");
    	}

    	if(current_bid == 0){
    		name = "";
    	}
    	else{
   		 	str = "SELECT buyer from bid join auction using (auction_id) where amount = ? and auction_id = ?";
    		prepare = con.prepareStatement(str);
    		prepare.setFloat(1, current_bid);
    		prepare.setInt(2, auction_id);
    		ResultSet result3 = prepare.executeQuery();
    		result3.next();
    		name = result3.getString("buyer");
		}
	
    	str = "UPDATE auction a SET a.current_bid=? , a.winner=? where a.auction_id = ?";
    	prepare = con.prepareStatement(str);
    	prepare.setString(2, name);
    	prepare.setFloat(1, current_bid);
    	prepare.setInt(3, auction_id);
    	prepare.executeUpdate();
    	
  		
    	
		response.sendRedirect("manageAuctions.jsp");
	}		
	
	catch (Exception e) 
	{
			out.print(e);
	}
	finally
	{
		if (result != null) result.close();
		if (statement != null) statement.close();
		if (con != null) con.close();
	}%>

</body>
</html>
