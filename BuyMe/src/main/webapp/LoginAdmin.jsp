<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Administrator</title>
	</head>
	<body>
		<h1>Administrator Home Page</h1>
		<h2>User Accounts</h2>
			<a href='UserViewAdmin.jsp'>View End-User Accounts.</a><br><br>
		
		<h2>Customer Service Representative Accounts</h2>
			<a href='CSRView.jsp'>Manage Customer Service Representative Accounts.</a><br><br>
		
		<h2>Summary Sales Reports</h2>
			<a href='SSRView.jsp'>View All Summary Sales Reports</a><br><br>
	
		<h2>Session</h2>
			<a href='logout.jsp'>Logout</a><br>
	</body>
</html>