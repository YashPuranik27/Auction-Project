<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question Handler</title>
</head>
<body>
<% 
PreparedStatement ps = null;
Connection conn = null;
try {
	ApplicationDB db = new ApplicationDB();
	conn = db.getConnection();
	String username = (session.getAttribute("user")).toString();
	String question = request.getParameter("question");
	if (question != null) {
		String insert = "INSERT INTO questions (username, user_questions, answers)" + "VALUES (?, ?, ?)";
		ps = conn.prepareStatement(insert);
		ps.setString(1, username);
		ps.setString(2, question);
		ps.setString(3, "Customer rep hasnt answered yet");
		int result = 0;
		result = ps.executeUpdate();
		if (result < 1) {
	out.println("Insert failed");
		} else {
	out.print("<h3>Your question has been submitted successfully. Please be patient, a representative will respond shortly.</h3>");
	out.print("<a href='searchQuestions.jsp'>Search for questions</a><br>");
	out.print("<a href='enduserlanding.jsp'>Return to landing</a>");
	return;
		}
	} else {
		%>
		<h2>Please input a question</h2>
		<p><%=session.getAttribute("user")%>, <a href="questionForm.jsp">Click
				here to ask a question.</a>
		</p>
		<p>
			Otherwise, <a href="enduserlanding.jsp">click here to return to the
				home page.</a><% 
		return;
	}
} catch (Exception e) {
	out.print("<p>Error connecting to MYSQL server.</p>" + e);
} finally {
	try {
		ps.close();
	} catch (Exception e) {
	}
	try {
		conn.close();
	} catch (Exception e) {
	}
}
%>
</html>
