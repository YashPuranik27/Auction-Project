<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Questions</title>
</head>
<body>
	<a href="questionForm.jsp">Return to question form</a>
	<h3>Search Questions based on Keywords</h3>
	<form>
		<input type="text" name="search" placeholder="question">
		<button type="submit">Search</button>
	</form>

	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String entity = request.getParameter("search");
		String str = "SELECT user_questions,answers FROM questions WHERE user_questions LIKE'%" + entity + "%' or answers like '%" + entity + "%'";
		ResultSet result = stmt.executeQuery(str);
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>");
		out.print("Question");
		out.print("</td>");
		out.print("<td>");
		out.print("Answer");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Answered By Customer Rep Username");
		out.print("</td>");
		
		out.print("</tr>");
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("user_questions"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("answers"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("customerrep_username"));
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		con.close();
	} catch (Exception e) {
	}
	%>
</body>
</html>
