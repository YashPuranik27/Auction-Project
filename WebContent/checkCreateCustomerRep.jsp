<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Customer Representative Account Creation Details</title>
</head>
<body>
<jsp:include page="checkWinner.jsp" />
	<%
	String userid = request.getParameter("username");
	String pwd = request.getParameter("password");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = null;
	rs = stmt.executeQuery("select * from customerrep where username='" + userid + "'");
	if (rs.next()) {
		out.println("Username exists, please try another <a href='createCustomerRep.jsp'>try again</a>");
	} else {
		int x = stmt.executeUpdate("insert into users values('" + userid + "', '" + pwd + "', '" + address + "', '"
		+ email + "', '" + name + "', 'reps')");
		int y = stmt.executeUpdate("insert into customerrep values('" + userid + "', '" + pwd + "')");
		out.println("Customer Representative account created");
		out.println("<br><a href = 'adminlanding.jsp'>Go back to Admin landing</a>");
	}
	%>
</body>
</html>
