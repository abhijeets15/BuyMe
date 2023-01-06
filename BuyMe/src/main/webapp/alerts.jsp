<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Alerts</title>
	</head>
	<body>
		<h1>Out-bid Alerts</h1>
		
		<% 
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			String userid = (String) session.getAttribute("user");
			ResultSet rs1 = st.executeQuery("SELECT * FROM bid_alert where buyer_user='" + userid + "'");
		%>
		
		<table BORDER="1">
			<tr>
				<th>Username</th>
				<th>Bid Number</th>
				<th>Auction ID</th>
			</tr>
			<% while(rs1.next()){ %>
			<tr>
				<td> <%= rs1.getString(1) %></td>
				<td> <%= rs1.getString(2) %></td>
				<td> <%= rs1.getString(3) %></td>
			</tr>
			<% } %>
		</table>
		
		<h1>Auction Win Alerts</h1>
		
		<%
		st.executeUpdate("insert into win_alert (auction_ID,buyer_user,bid_number,acknowledged) select auction_ID,buyer_user,bid_number,0 from bid_posts_for where bid_number in (select MAX(bid_number) from bid_posts_for group by auction_ID) and auction_ID in (select auction_ID from item_auctions where ((expiration_date=current_date and current_time>expiration_time) or (current_date>expiration_date))) and auction_ID not in (select auction_ID from win_alert) and auction_ID not in (select auction_ID from item_auctions where leading_bid<minimum_price)");
		st.executeUpdate("insert into win_alert (auction_ID,buyer_user,bid_number,acknowledged) select auction_ID,NULL,NULL,1 from bid_posts_for where bid_number in (select MAX(bid_number) from bid_posts_for group by auction_ID) and auction_ID in (select auction_ID from item_auctions where ((expiration_date=current_date and current_time>expiration_time) or (current_date>expiration_date))) and auction_ID not in (select auction_ID from win_alert) and auction_ID in (select auction_ID from item_auctions where leading_bid<minimum_price)");
		ResultSet rs2 = st.executeQuery("SELECT auction_ID FROM win_alert where buyer_user='" + userid + "' and acknowledged=0");
		%>
		
		<table BORDER="1">
			<tr>
				<th>Auction ID</th>
			</tr>
			<% while(rs2.next()){ %>
			<tr>
				<td> <%= rs2.getString(1) %></td>
			</tr>
			<% } %>
		</table>
        
        <br><a href='acknowledgeAlerts.jsp'>Acknowledge Alerts</a>
		<br><a href='LoginUser.jsp'>Return</a>
	</body>
</html>