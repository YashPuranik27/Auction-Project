<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answer User Questions</title>
</head>
<body>
	<button onclick="window.location.href='customerRepresentativeLanding.jsp';">Return to Customer Rep Landing page</button>

<h2>View Questions</h2>
<p> Answer any unanswered questions</p>

	<%
	PreparedStatement ps = null;
	ResultSet result = null;
	ApplicationDB db = new ApplicationDB();
	Connection conn = db.getConnection();
	try {
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
		out.print("Answer");
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
			if (result.getString("answers").equals("Customer rep hasnt answered yet")) {
	%>

	<form
		action="answersHandler.jsp?question_id=<%=result.getInt("question_id")%>"
		method="POST">
		<td><textarea type="textarea" name="answers"></textarea> <input
			type="submit" value="answers"></td>
	</form>
	<%
	} else {
	out.print("<td>");
	out.print(result.getString("answers"));
	out.print("</td>");
	out.print("<td>");
	out.print(result.getString("customerrep_username"));
	out.print("</td>");
	}
	}
	out.print("</tr>");
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
