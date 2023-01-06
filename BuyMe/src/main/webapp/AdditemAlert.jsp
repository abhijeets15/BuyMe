<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.time.*"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>New Item Alert</title>
	</head>
	<body>
		<%
		String username = "'" + request.getParameter("UsernameAlert1") + "'";
		String type = request.getParameter("type");
		String brand = request.getParameter("type");		
		String color = request.getParameter("color");
		
		if(type.isEmpty()) {
			type="' '";
		}
		else{
			type="'" + type + "'";
		}
		if(brand.isEmpty()) {
			brand="' '";
		}
		else{
			brand="'" + brand + "'";
		}
		if(color.isEmpty()) {
			color="' '";
		}
		else{
			color="'" + color + "'";
		}

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery("select * from item_alert");
			int count=0;
			while(res.next()) {
				count++;
			}

			count=count+5;		

			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = ("Insert into item_alert(alertID,buyer_user,desired_type,desired_color,desired_brand) values(" + count + "," + username + "," + type + "," + color + "," + brand + ");");
			Statement stmt2 = con.createStatement();

			//Run the query against the database.
			stmt2.executeUpdate(str);
		}catch(Exception e) {}
		%>
		<h2>Added the alert</h2>
			<a href='EndUser.jsp'>Okay!</a><br>

	</body>
</html>