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
			String userid = (String) session.getAttribute("user");
			ResultSet rs1, rs2, rs3;
			rs1 = st.executeQuery("SELECT * FROM `service_request` a NATURAL JOIN `requests` LEFT JOIN `performs` b ON a.`request_ID` = b.`request_ID` LEFT JOIN `amends` c ON a.`request_ID` = c.`request_ID` LEFT JOIN `removes` d ON a.`request_ID` = d.`request_ID` WHERE `member_user`='" + userid + "' ORDER BY a.`request_ID`");
		%>
		
		<table BORDER="1">
			<tr>
				<th>Request Number</th>
				<th>User</th>
				<th>Ticket</th>
				<th>Modified By</th>
				<th>Feedback</th>
				<th>Action Performed</th>
			</tr>
			<% while(rs1.next()){ %>
			<tr>
				<td> <%= rs1.getString(1) %></td>
				<td> <%= rs1.getString(5) %></td>
				<td> <%= rs1.getString(2) %></td>
				<td> <%= rs1.getString(7) %></td>
				<td> <%= rs1.getString(3) %></td>
				<td> <%= rs1.getString(4) %></td>
			</tr>
			<% } %>
		</table>
		
		<h2>Your Auctions</h2>
		<% 
			rs2 = st.executeQuery("SELECT * FROM item_auctions WHERE seller_user='" + userid + "'");
		%>
		
		<table BORDER="1">
			<tr>
				<th>Auction ID</th>
				<th>Expiration Date</th>
				<th>Expiration Time</th>
				<th>Leading Bid</th>
				<th>Bid Increment</th>
				<th>Minimum Price</th>
			</tr>
			<% while(rs2.next()){ %>
			<tr>
				<td> <%= rs2.getString(1) %></td>
				<td> <%= rs2.getString(3) %></td>
				<td> <%= rs2.getString(4) %></td>
				<td> <%= rs2.getString(5) %></td>
				<td> <%= rs2.getString(7) %></td>
				<td> <%= rs2.getString(8) %></td>
			</tr>
			<% } %>
		</table>
		
		<h2>Your Bids</h2>
		<% 
			rs3 = st.executeQuery("SELECT * FROM bid_posts_for WHERE buyer_user='" + userid + "'");
		%>
		
		<table BORDER="1">
			<tr>
				<th>Bid ID</th>
				<th>Auction ID</th>
				<th>Post Date</th>
				<th>Post Time</th>
				<th>Bid Amount</th>
			</tr>
			<% while(rs3.next()){ %>
			<tr>
				<td> <%= rs3.getString(1) %></td>
				<td> <%= rs3.getString(3) %></td>
				<td> <%= rs3.getString(4) %></td>
				<td> <%= rs3.getString(5) %></td>
				<td> <%= rs3.getString(6) %></td>
			</tr>
			<% } %>
		</table>
		
		<h2>Create Service Request</h2>
		<form method="post" action="EUTicketCreate.jsp">
			<p>Auction ID:<br><input type="text" name="auction" value="" />
			<p>Bid ID:<br><input type="text" name="bid" value="" />
			<p>Request:<br><textarea name="userrequest" maxlength = "255" rows="5" cols="50" required></textarea></p>
			<input type="submit" value="Submit" />
		</form>
		<br><a href='LoginUser.jsp'>Return</a>
	</body>
</html>