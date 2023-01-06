<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Login Form</title>
	</head>
	<body>
		<h1>Welcome to BuyMe!</h1>
		<h2>Please Login!</h2>
			<form method="get" action="checkLoginDetails.jsp">
				Username: <input type="text" name="username"/> <br/>
				Password:<input type="password" name="password"/> <br/>
				<input type="submit" value="Login"/>
			</form>
		
		<h2>Or Sign Up!</h2>
			<a href='SignUp.jsp'>Join Now</a><br>
	</body>
</html>