<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Edit Account Information</title>
	</head>
	<body>
		<h1>Edit Account Information</h1>
		
		<% 
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			String userid = (String) session.getAttribute("user");
			ResultSet rs = st.executeQuery("SELECT * FROM account NATURAL JOIN end_user WHERE username = '" + userid + "' AND `member_user` = '" + userid + "'");
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
		
		
		
		<h2>Change Username</h2>
		<form method="post" action="EUAccountEdit1.jsp">
			<p>Username:<br><input type="text" name="username" maxlength="50" required value="" /></p>
			<input type="submit" value="Edit" />
		</form>
		<h2>Change Password</h2>
		<form method="post" action="EUAccountEdit2.jsp">
			<p>Password:<br><input type="password" id="password" name="password" maxlength="50" required value="" /></p>
			<input type="submit" value="Submit" id="Submit" />
		</form>
		<h2>Change Email</h2>
		<form method="post" action="EUAccountEdit3.jsp">
			<p>Email:<br><input type="text" name="email" maxlength="50" required value="" /></p>
			<input type="submit" value="Edit" />
		</form>
		<h2>Change Full Name</h2>
		<form method="post" action="EUAccountEdit4.jsp">
			<p>Full Name:<br><input type="text" name="fullname" maxlength="100" required value="" /></p>
			<input type="submit" value="Edit" />
		</form>
		<h2>Change Phone Number</h2>
		<form method="post" action="EUAccountEdit5.jsp">
			<p>Phone:<br><input type="tel" name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required value="" /></p>
			<input type="submit" value="Edit" />
			<small>Format: 123-456-7890</small>
		</form>
		<h2>Change Address</h2>
		<form method="post" action="EUAccountEdit6.jsp">
			<p>Address:<br><input type="text" name="address" maxlength="100" required value="" /></p>
			<input type="submit" value="Edit" />
		</form>
		<br><a href='LoginUser.jsp'>Return</a>
	</body>
</html>