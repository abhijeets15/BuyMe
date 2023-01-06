<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Representative</title>
	</head>
	<body>
		<h1>Customer Service Representative Home Page</h1>
		<h2>User Accounts</h2>
			<a href='UserViewRep.jsp'>View End-User Accounts.</a><br><br>
		
		<h2>User Service Requests</h2>
			<a href='USRView.jsp'>Manage Service Requests</a><br><br>
		
		<h2>FAQ Board</h2>
			<a href='FAQViewRep.jsp'>Manage FAQ Entries</a><br><br>
			
		<h2>Session</h2>
			<a href='logout.jsp'>Logout</a><br>
	</body>
</html>