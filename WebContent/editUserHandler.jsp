<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit User</title>
</head>
<body>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement st = con.createStatement();
		Statement st2 = con.createStatement();
		ResultSet rs1, rs2;
		String newName = request.getParameter("newName");
		String newEmail = request.getParameter("newEmail");
		String password = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String username = request.getParameter("username");
			PreparedStatement update = con
			.prepareStatement("UPDATE users SET password = ?, email = ?, name = ?  WHERE username = ?");
			update.setString(3, newName);
			update.setString(2, newEmail);
			update.setString(1, newPassword);
			update.setString(4, username);
			int res = update.executeUpdate();
			if (res >= 1) {
		out.println("Changes have been saved.");
		out.println("<a href='customerRepresentativeLanding.jsp'>Return to dashboard.</a>");
			} else {
		out.println("Changes failed.");
		out.println("<a href='customerRepresentativeLanding.jsp'>Return to dashboard.</a>");
			}
	} catch (SQLException se) {
		out.println("Error: Cannot Update <br>");
		out.println("<a href='manageUsers.jsp'>Return to list of users</a>");
		out.println("<a href='customerRepresentativeLanding.jsp'>Return to dashboard.</a>");
		se.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>
