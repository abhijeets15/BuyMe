<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>End User Accounts</title>
	</head>
	<body>
		<h1>End User Accounts</h1>
		
		<% 
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM account RIGHT JOIN end_user ON username = member_user") ;
		%>
		
		<table BORDER="1">
			<tr>
				<th>Username</th>
				<th>Password</th>
				<th>Full Name</th>
				<th>Email</th>
				<th>Phone Number</th>
				<th>Address</th>
			</tr>
			<% while(rs.next()){ %>
			<tr>
				<td> <%= rs.getString(1) %></td>
				<td> <%= rs.getString(2) %></td>
				<td> <%= rs.getString(5) %></td>
				<td> <%= rs.getString(3) %></td>
				<td> <%= rs.getString(6) %></td>
				<td> <%= rs.getString(7) %></td>
			</tr>
			<% } %>
		</table>
        
		<br><a href='LoginRep.jsp'>Return</a>
	</body>
</html>