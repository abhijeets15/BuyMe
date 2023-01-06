<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>User Service Requests</title>
	</head>
	<body>
		<h1>User Service Requests</h1>
		
		<% 
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM `service_request` a NATURAL JOIN `requests` LEFT JOIN `performs` b ON a.`request_ID` = b.`request_ID` LEFT JOIN `amends` c ON a.`request_ID` = c.`request_ID` LEFT JOIN `removes` d ON a.`request_ID` = d.`request_ID` ORDER BY a.`request_ID`");
		%>
		
		<table BORDER="1">
			<tr>
				<th>Request Number</th>
				<th>User</th>
				<th>Ticket</th>
				<th>Modified By</th>
				<th>Feedback</th>
				<th>Action Performed</th>
				<th>Auction ID</th>
				<th>Bid Number</th>
			</tr>
			<% while(rs.next()){ %>
			<tr>
				<td> <%= rs.getString(1) %></td>
				<td> <%= rs.getString(5) %></td>
				<td> <%= rs.getString(2) %></td>
				<td> <%= rs.getString(7) %></td>
				<td> <%= rs.getString(3) %></td>
				<td> <%= rs.getString(4) %></td>
				<td> <%= rs.getString(9) %></td>
				<td> <%= rs.getString(11) %></td>
			</tr>
			<% } %>
		</table>
		
		
		
		<h2>Modify Service Request</h2>
		<form method="post" action="USRTicketModify.jsp">
			<p>Request ID:<br><input type="number" name="request" required value="" /></p>
			<p>Feedback:<br><textarea name="feedback" maxlength = "255" rows="5" cols="50" required></textarea></p>
			<p>Action:<br><textarea name="perform" maxlength = "255" rows="5" cols="50" required></textarea></p>
			<input type="submit" value="Submit" />
		</form>
		<h2>Delete Service Request</h2>
		<form method="post" action="USRTicketDelete.jsp">
			<p>Request ID:<br><input type="number" name="request" required value="" /></p>
			<input type="submit" value="Delete" />
		</form>
		<h2>Delete Auction</h2>
		<form method="post" action="USRAuctionDelete.jsp">
			<p>Auction:<br><input type="number" name="auction" required value="" /></p>
			<input type="submit" value="Delete" />
		</form>
		<h2>Delete Bid</h2>
		<form method="post" action="USRBidDelete.jsp">
			<p>Bid:<br><input type="number" name="bid" required value="" /></p>
			<input type="submit" value="Delete" />
		</form>
		<h2>Edit User Information</h2>
		<form method="post" action="USRUserEdit.jsp">
			<p>Username:<br><input type="text" name="username" required value="" /></p>
			<input type="submit" value="Modify" />
		</form>
		<br><a href='LoginRep.jsp'>Return</a>
	</body>
</html>