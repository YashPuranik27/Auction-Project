<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Me- Frequently asked questions</title>
</head>
<body>
	<button onclick="window.location.href='questionForm.jsp';">Go back to questions form</button>

<h3> View all Questions</h3>
	<%
	PreparedStatement ps = null;
	ResultSet result = null;
	ApplicationDB db = new ApplicationDB();
	Connection conn = db.getConnection();
	try {
		String username = (session.getAttribute("user")).toString();
		String questionsQuery = "SELECT * FROM questions";
		String check = "Customer rep hasnt answered yet";
		ps = conn.prepareStatement(questionsQuery);
		result = ps.executeQuery();
		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Question ID");
		out.print("</th>");
		out.print("<th>");
		out.print("Question");
		out.print("</th>");
		out.print("<th>");
		out.print("Answers");
		out.print("</th>");
		out.print("<th>");
		out.print("Answered By Customer Rep Username");
		out.print("</th>");
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("question_id"));
			out.print("</td>");
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
	} catch (SQLException e) {
		out.print("<p>Error</p>");
		e.printStackTrace();
	} finally {
		try {
			result.close();
		} catch (Exception e) {
		}
		try {
			conn.close();
		} catch (Exception e) {
		}
	}
	%>
</body>
</html>
