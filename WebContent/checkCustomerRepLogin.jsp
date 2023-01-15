<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Customer Rep Login</title>
</head>
<body>
<jsp:include page="checkWinner.jsp" />
<%
	String userid = request.getParameter("uname");   
	String pwd = request.getParameter("upass");
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection(); 	
	Statement stmt = con.createStatement();	
	
	ResultSet rs;
    rs = stmt.executeQuery("SELECT * FROM customerrep WHERE username='" + userid + "'");
    if (rs.next()){
    	 ResultSet rs1;
    	    rs1 = stmt.executeQuery("select * from customerrep where username='" + userid + "' and password='" + pwd + "'");
    	    	if (rs1.next()) {
    	    		session.setAttribute("customerrep_username", userid);
        	        response.sendRedirect("customerRepresentativeLanding.jsp");
        	        out.println("welcome " + userid);
        	        out.println("<a href='logout.jsp'>Log out</a>");
        	        out.println("<a href='account.jsp'>Account Page</a>");
    	    	} else {
    	        out.println("Invalid password <a href='customerRepLogin.jsp'>Please try again</a>");
    	    }
    } else {
    	out.println("Username doesn't exist. Please check again");
    }
%>
</body>
</html>
