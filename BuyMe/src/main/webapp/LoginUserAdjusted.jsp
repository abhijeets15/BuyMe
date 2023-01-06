<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><%=session.getAttribute("user")%></title>
	</head>
	<body>
		<h1><%=session.getAttribute("user")%> Home Page</h1>
		
		<h2>Service Requests</h2>
			<a href='EUTickets.jsp'>View and Open Service Requests</a><br><br>
		
		<h2>Edit Account Information</h2>
			<a href='EUAccount.jsp'>Edit Your Account Information</a><br><br>
			
		<h2>FAQ</h2>
			<a href='FAQViewUser.jsp'>View Frequently Asked Questions</a><br><br>
			
		<h2>Session</h2>
			<a href='logout.jsp'>Logout</a><br>
	</body>
</html>