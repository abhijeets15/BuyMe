<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Create New Account</title>
	</head>
	<body>
		<form method="post" action="SignUpAcct.jsp">
			<table border="1">
				<thead>
					<tr>
						<th colspan="2">Create New Account</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Username</td>
						<td><input type="text" name="username" maxlength="50" required value="" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" maxlength="50" required value="" /></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="text" name="email" maxlength="50" required value="" /></td>
					</tr>
					<tr>
						<td>Full Name</td>
						<td><input type="text" name="fullname" maxlength="100" required value="" /></td>
					</tr>
					<tr>
						<td>Phone Number</td>
						<td><input type="tel" name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required value="" />
						<br><small>Format: 123-456-7890</small></td>
					</tr>
					<tr>
						<td>Address</td>
						<td><input type="text" name="address" maxlength="100" required value="" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="Submit" required /></td>
						<td><input type="reset" value="Reset" /></td>
					</tr>
					<tr>
						<td colspan="2"><a href="login.jsp">Return</a></td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>