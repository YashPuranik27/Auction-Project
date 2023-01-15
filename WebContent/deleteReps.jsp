<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Customer Representatives</title>
</head>
<body>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement st = con.createStatement();
		String user = request.getParameter("username");
		int result = st.executeUpdate("DELETE FROM customerrep WHERE username='" + user + "'");
		if (result > 0) {
			out.println("Representative deleted");
			out.println("<br><a href='adminlanding.jsp'>Return to dashboard.</a>");
		}
	} catch (SQLException se) {
		out.println("<a href='adminlanding.jsp'>Return to dashboard.</a>");
		se.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>
