<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Low Bid</title>
	</head>
	<body>
		Unfortunately, your bid was either below the current bid or below the current bid adjusted for automatic bidding.<br>
		Try submitting a higher bid.<br>
		<a href="bid.jsp">Return</a>
	</body>
</html>