<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.time.*"%>
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="ISO-8859-1">
		<title>Similar items</title>
	</head>
	<body>
		<h1>Similar items on auction in the last month</h1>
		
		
		
		
		<% 
		
		try {
			
			LocalDate now = LocalDate.now(); // 2015-11-24
			LocalDate previousMonth = now.minusMonths(1); // 2015-10-24
			
			

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			//Run the query against the database.
			ResultSet result = stmt.executeQuery("select *,count(*) as count from item_auctions where post_date>='" + previousMonth + "' group by type,brand,color" );
			
			out.print("<table>");
			
			out.print("<tr>");
			
			//make a column
			out.print("<td>");
			out.print("type");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("brand");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			//print out column header
			out.print("color");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Total_Items");
			out.print("</td>");
			
			
			
			out.print("</tr>");
			
			
			
			while (result.next()) {
				//make a row
				out.print("<tr>");
				
				out.print("<td>");
				//Print out current price
				out.print(result.getString("type"));
				out.print("</td>");
				
				
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("brand"));
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("color"));
				out.print("</td>");
				
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("count"));
				out.print("</td>");
				
				out.print("</tr>");

				
			}
						
			out.print("</table>");

			//close the connection.
			con.close();
			
		}catch(Exception e) {
			
		}

		
	%>
		<br><a href='EndUser.jsp'>Return</a>
	</body>
</html>