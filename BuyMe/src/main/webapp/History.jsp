<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>History of bids</title>
	</head>
	<body>
		<h1>History of bids for Auction ID=<%out.print(request.getParameter("auctionID")); %></h1>
		<%
		String auctionID = request.getParameter("auctionID");
		if(auctionID.trim().isEmpty()) {
			out.print("Please enter a valid AuctionID");
		}
		
		
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = ("select bid_number,buyer_user,post_date,current_bid from bid_posts_for where auction_ID=" + auctionID);

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			
			//make a column
			out.print("<td>");
			out.print("bid_Number");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Bidder");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Bid_Amount");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("post_date");
			out.print("</td>");
			
			
			
			out.print("</tr>");

			while(result.next()) {
				
					//make a row
					out.print("<tr>");
					
					//make a column
					out.print("<td>");
					//Print out current bar name:
					out.print(result.getString("bid_number"));
					out.print("</td>");
					
					//make a column
					out.print("<td>");
					//Print out current bar name:
					out.print(result.getString("buyer_user"));
					out.print("</td>");
					
					//make a column
					out.print("<td>");
					//Print out current bar name:
					out.print(result.getString("current_bid"));
					out.print("</td>");
					
					//make a column
					out.print("<td>");
					//Print out current bar name:
					out.print(result.getString("post_date"));
					out.print("</td>");
				
					out.print("<tr>");
				
			}
			out.print("<table>");

			
		} catch (Exception e) {
		}
		
		%>
		<br><a href='EndUser.jsp'>Return</a>
	</body>
</html>