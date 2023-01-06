<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Bid Form</title>
	</head>
	<body>

		<h1>Bid Here!</h1>
		<form method="post" action="autobid.jsp">
			<p>Auction ID:<br><input type="number" name="auction_id" required value="" /></p>
			<p>Bid:<br><input type="number" name="bid" required value="" /></p>
			<p>Bid Upper Limit (for automatic bidding; enter bid amount for manual bidding):<br><input type="number" name="bid_ul" required value="" /></p>
			<p>Bid Increment (for automatic bidding; enter 0.00 for manual bidding):<br><input type="number" name="bid_inc" required value="" /></p>
			<p>Shipping Address:<br><input type="text" name="ship_add" required value="" /></p>
			<input type="submit" value="Bid" />
		</form>
		<a href="LoginUser.jsp">Return</a>
	</body>
</html>