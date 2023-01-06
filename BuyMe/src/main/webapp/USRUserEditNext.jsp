<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Edit End User Account</title>
	</head>
	<body>
		<h1>End User Account</h1>
		
		<% 
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			String serviceaccount = (String) session.getAttribute("serviceaccount");
			ResultSet rs = st.executeQuery("SELECT * FROM account NATURAL JOIN end_user WHERE username = '" + serviceaccount + "' AND `member_user` = '" + serviceaccount + "'");
		%>
		
		<table BORDER="1">
			<tr>
				<th>Username</th>
				<th>Password</th>
				<th>Email</th>
				<th>Full Name</th>
				<th>Phone</th>
				<th>Address</th>
			</tr>
			<% while(rs.next()){ %>
			<tr>
				<td> <%= rs.getString(1) %></td>
				<td> <%= rs.getString(2) %></td>
				<td> <%= rs.getString(3) %></td>
				<td> <%= rs.getString(5) %></td>
				<td> <%= rs.getString(6) %></td>
				<td> <%= rs.getString(7) %></td>
			</tr>
			<% } %>
		</table>
		
		
		
		<h2>Change User Name</h2>
		<form method="post" action="USRUserEdit1.jsp">
			<p>Username:<br><input type="text" name="username" maxlength="50" required value="" /></p>
			<input type="submit" value="Edit" />
		</form>
		<h2>Change User Password</h2>
		<form method="post" action="USRUserEdit2.jsp">
			<p>Password:<br><input type="text" name="password" maxlength="50" required value="" /></p>
			<input type="submit" value="Edit" />
		</form>
		<h2>Change User Email</h2>
		<form method="post" action="USRUserEdit3.jsp">
			<p>Email:<br><input type="text" name="email" maxlength="50" required value="" /></p>
			<input type="submit" value="Edit" />
		</form>
		<h2>Change User Full Name</h2>
		<form method="post" action="USRUserEdit4.jsp">
			<p>Full Name:<br><input type="text" name="fullname" maxlength="100" required value="" /></p>
			<input type="submit" value="Edit" />
		</form>
		<h2>Change User Phone Number</h2>
		<form method="post" action="USRUserEdit5.jsp">
			<p>Phone:<br><input type="tel" name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required value="" /></p>
			<input type="submit" value="Edit" />
			<small>Format: 123-456-7890</small>
		</form>
		<h2>Change User Address</h2>
		<form method="post" action="USRUserEdit6.jsp">
			<p>Address:<br><input type="text" name="address" maxlength="100" required value="" /></p>
			<input type="submit" value="Edit" />
		</form>
		<br><a href='USRView.jsp'>Return</a>
	</body>
</html>