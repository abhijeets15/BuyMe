<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.time.*"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="ISO-8859-1">
			<title>item Alerts</title>
		</head>
		<body>
			<h2>See all your item alerts if they have any matching auction</h2>
			<br>
			<h3>Prints those alerts that have a match</h3>
			<%
			
			

			try {

				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();	
				
				//Create a SQL statement
				Statement stmt = con.createStatement();
				
				String name = request.getParameter("UsernameAlert");
				//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
				//String str = ("select * from item_alert where buyer_user==")
				//Run the query against the database.
				ResultSet result = stmt.executeQuery("select * from item_alert where buyer_user='" + name + "'");

				//Make an HTML table to show the results in:
				out.print("<table>");

				//make a row
				out.print("<tr>");
				
				//make a column
				out.print("<td>");
				//print out column header
				out.print("desired_type");
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				//print out column header
				out.print("desired_brand");
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				//print out column header
				out.print("desired_color");
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				//print out column header
				out.print("Match_Auction");
				out.print("</td>");
				
				out.print("</tr>");
				
				while(result.next()) {
					out.print("<tr>");out.print("</tr>");
					String type = result.getString("desired_type");
					String brand = result.getString("desired_brand");
					String color = result.getString("desired_color");
					if(type.isEmpty()) {
						type="<>'Nothing'";
					}
					else {
						type="='" + type + "'";
					}
					if(brand.isEmpty()) {
						brand="<>'Nothing'";
					}
					else {
						brand="='" + brand + "'";
					}
					if(color.equals("")) {
						color="<>'Nothing'";
					}
					else {
						color="='" + color + "'";
					}

					
					Statement stmt2 = con.createStatement();
					ResultSet res2 = stmt2.executeQuery("select * from item_auctions where type" + type +" and brand" + brand + " and color" + color);
					
					while(res2.next()) {
						out.print("<tr>");
						
						//make a column
						out.print("<td>");
						//Print out current bar name:
						out.print(result.getString("desired_type"));
						out.print("</td>");
						
						//make a column
						out.print("<td>");
						//Print out current bar name:
						out.print(result.getString("desired_brand"));
						out.print("</td>");
						
						//make a column
						out.print("<td>");
						//Print out current bar name:
						out.print(result.getString("desired_color"));
						out.print("</td>");
						
						//make a column
						out.print("<td>");
						//Print out current bar name:
						out.print(res2.getInt("auction_ID"));
						out.print("</td>");
						out.print("</tr");
						
					}
				}
				
				out.print("</table>");
			}catch(Exception e) {}
				
			%>
			
		<br><a href='EndUser.jsp'>Return</a>
		</body>
	</html>