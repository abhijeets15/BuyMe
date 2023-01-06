<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Customer Service Accounts</title>
	</head>
	<body>
		<h1>Customer Service Accounts</h1>
		
		<% 
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM account RIGHT JOIN customer_representative_creates ON username = customer_rep_user") ;
		%>
		
		<table BORDER="1">
			<tr>
				<th>Username</th>
				<th>Password</th>
				<th>Email</th>
			</tr>
			<% while(rs.next()){ %>
			<tr>
				<td> <%= rs.getString(1) %></td>
				<td> <%= rs.getString(2) %></td>
				<td> <%= rs.getString(3) %></td>
			</tr>
			<% } %>
		</table>
        
        <h2>Create Account</h2>
		<form method="post" action="CSRCreateAcct.jsp">
			<p>Username:<br><input type="text" name="username" maxlength="50" required value="" /></p>
			<p>Password:<br><input type="password" name="password" maxlength="50" required value="" /></p>
			<p>Email:<br><input type="text" name="email" maxlength="50" required value="" /></p>
			<input type="submit" value="Create" />
		</form>
		<h2>Delete Account</h2>
		<form method="post" action="CSRDeleteAcct.jsp">
			<p>Username:<br><input type="text" name="username" maxlength="50" required value="" /></p>
			<input type="submit" value="Delete" />
		</form>
		<br><a href='LoginAdmin.jsp'>Return</a>
	</body>
</html>