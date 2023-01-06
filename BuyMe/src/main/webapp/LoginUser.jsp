<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>End-User</title>
	</head>
	<body>
		<h1>End-User Home Page</h1>
		<h2>Service Requests</h2>
			<a href='EUTickets.jsp'>Submit a service request.</a><br><br>
			
			<a href='FAQViewUser.jsp'>Browse and search for frequently asked questions and their answers.</a><br><br>
			
			<a href='EUAccount.jsp'>Edit account information.</a><br><br>
		
		<h2>Items</h2>
		
			<a href='bid.jsp'>Place a bid on an item.</a><br><br>
	
			<a href='sell.jsp'>Put an item up for auction.</a><br><br>
		
			<a href='EndUser.jsp'>Search for items, set item alerts, browse records.</a><br><br>
			
		<h2>Auction Alerts</h2>
			<a href='alerts.jsp'>View auction alerts.</a><br><br>
		
		<h2>Session</h2>
			<a href='logout.jsp'>Logout</a><br>
	</body>
</html>