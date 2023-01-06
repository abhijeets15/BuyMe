<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Search results</title>
	</head>
	<body>
		<h1>
		Following items are on auction
		</h1>
		<%
		String color= "<>'Nothing";
		String size= "<>'Nothing";
		String brand= "<>'Nothing";
		String material= "<>'Nothing";
		String condition= "<>'Nothing";
		String type= "<>'Nothing";
		String serial= "<>'Nothing";
		String orderBy = "'";
		
		if(!(request.getParameter("color").trim().equalsIgnoreCase(""))) {
			color="='" + request.getParameter("color").trim();
		}
		if(!(request.getParameter("brand").trim().equalsIgnoreCase(""))) {
			brand="='" + request.getParameter("brand").trim();
		}
		if(!(request.getParameter("material").trim().equalsIgnoreCase(""))) {
			material="='" + request.getParameter("material").trim();
			
		}
		if(!(request.getParameter("condition").trim().equalsIgnoreCase(""))) {
			condition="='" + request.getParameter("condition").trim();
		}
		if(!(request.getParameter("size").trim().equalsIgnoreCase(""))) {
			size="='" + request.getParameter("size").trim();
		}
		if(!(request.getParameter("type").trim().equalsIgnoreCase(""))) {
			type="='" + request.getParameter("type").trim();
		}
		if(!(request.getParameter("serial").trim().equalsIgnoreCase(""))) {
			serial= "='" + request.getParameter("serial").trim();
		}
		if(!(request.getParameter("sorting").toString().equals(""))) {
			orderBy = "' order by " + request.getParameter("sorting");
		}

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "select * from item_auctions where color" + color + "' and material" + material + "' and brand" + brand + "' and type" + type +  "' and serial" + serial + "' and size" + size + orderBy;
			//String str = ("select * from item_auctions");
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			
			//make a column
			out.print("<td>");
			//print out column header
			out.print("auction_ID");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			//print out column header
			out.print("seller_user");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			//print out column header
			out.print("expiration_date");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			//print out column header
			out.print("expiration_time");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			//print out column header
			out.print("leading_bid");
			out.print("</td>");
			
			
			
			//make a column
			out.print("<td>");
			//print out column header
			out.print("initial_bid");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			//print out column header
			out.print("bid_increment");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			//print out column header
			out.print("minimum_price");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			//print out column header
			out.print("color");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("brand");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("material");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("condition");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("serial");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("type");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("size");
			out.print("</td>");
			
			
			
			
			out.print("</tr>");


			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("auction_ID"));
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("seller_user"));
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("expiration_date"));
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("expiration_time"));
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("leading_bid"));
				out.print("</td>");
				
				
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("initial_bid"));
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("bid_increment"));
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("minimum_price"));
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("color"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("brand"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out current price
				out.print(result.getString("material"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out current price
				out.print(result.getString("item_condition"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out current price
				out.print(result.getString("serial"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out current price
				out.print(result.getString("type"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out current price
				out.print(result.getString("size"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
		
		%>
		
		<h2>Get the history of any specific auction by typing its auction ID</h2>
		<form method="get" action="History.jsp">
			Auction ID:<input type="text" name="auctionID"/> <br/>
			<input type="submit" value="Search"/>
		</form>
		<br><a href='EndUser.jsp'>Return</a>
	</body>
</html>