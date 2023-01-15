<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ask a question here</title>
</head>
<body>
	<button onclick="window.location.href='enduserlanding.jsp';">Return to landing</button>
	<div class="frontend">
		<h2>Submit a new question:</h2>
		<form action="questionsHandler.jsp" method="post">
			<textarea style="font-size: 16pt" rows="1" cols="60" maxlength="250"
				name="question" placeholder = 'ask a question here'></textarea>
			<br> <input type="submit" value="submit">
		</form>
	</div>
	<h2>
		<a href="questionList.jsp">View FAQs</a><br>
		<a href="searchQuestions.jsp">Search for Questions</a>
	</h2>
</body>
</html>
