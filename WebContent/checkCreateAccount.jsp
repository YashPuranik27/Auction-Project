<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Account Creation Details</title>
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
	rs = stmt.executeQuery("select * from users where username='" + userid + "'");
	if (rs.next()) {
		out.println("Username exists, please make another <a href='createAccount.jsp'>try again</a>");
	} else {
		int x = stmt.executeUpdate("insert into users values('" + userid + "', '" + pwd + "', '" + address + "', '"
		+ email + "', '" + name + "', 'user')");
		session.setAttribute("user", userid);
		out.println("<h3> Account Created Successfully");
		out.println("<form action='login.jsp'><input type='submit' value='Login'/></form>");
	}
	%>
</body>
</html>
