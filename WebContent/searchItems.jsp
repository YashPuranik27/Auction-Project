<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Search</title>
</head>
<body>
	<button onclick="window.location.href='enduserlanding.jsp';">Return to End user landing</button>

	<h3>keyword search</h3>
	<form action = 'searchItemsHandler.jsp' method ='post'>
		<input type="text" name="search" placeholder="search">
		<button type="submit">Search</button>
	</form>
</body>
</html>
