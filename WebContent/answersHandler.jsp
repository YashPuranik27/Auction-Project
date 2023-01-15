<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answers Handler</title>
</head>
<body>
	<%
	PreparedStatement ps = null;
	try {
		ApplicationDB db = new ApplicationDB();
		Connection conn = db.getConnection();
		String username = session.getAttribute("customerrep_username").toString();
		int question_id = Integer.parseInt(request.getParameter("question_id"));
		String answers = request.getParameter("answers");
		if (answers != null) {
			String insert = "UPDATE questions SET answers=?, customerrep_username = ? WHERE question_id=?";
			ps = conn.prepareStatement(insert);
			ps.setString(1, answers);
			ps.setString(2, username);
			ps.setInt(3, question_id);
			int result = 0;
			result = ps.executeUpdate();
			if (result < 1) {
		out.println("Error: Answering Questions failed.");
			} else {
	%>

	<div class="frontend">
		<h2>Question was successfully answered.</h2>
	</div>
	<a href="answerQuestions.jsp"> Answer anymore questions</a>
	<%
	}
	} else {
	response.sendRedirect("questionError.jsp");
	return;
	}
	} catch (Exception e) {
	out.print("<p>Error</p>" + e);
	e.printStackTrace();
	} finally {
	//ps.close();
	}
	%>
</body>
</html>
