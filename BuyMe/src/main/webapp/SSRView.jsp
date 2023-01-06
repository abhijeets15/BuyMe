<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Summary Sales Reports</title>
	</head>
	<body>
		<h1>Summary Sales Reports</h1>
		
		<% 
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM summary_sales_report") ;
		%>
		
		<table BORDER="1">
			<tr>
				<th>Sales Month</th>
				<th>Total Earned</th>
				<th>Best Selling Users</th>
				<th>Best Selling Items</th>
				<th>Earnings Per Users</th>
				<th>Earnings Per Item</th>
				<th>Earnings Per Item Type</th>
			</tr>
			<% while(rs.next()){ %>
			<tr>
				<td> <%= rs.getString(1) %></td>
				<td> <%= String.format("%.02f", rs.getFloat(2)) %></td>
				<td> <%= rs.getString(3) %></td>
				<td> <%= rs.getString(4) %></td>
				<td> <%= String.format("%.02f", rs.getFloat(5)) %></td>
				<td> <%= String.format("%.02f", rs.getFloat(6)) %></td>
				<td> <%= String.format("%.02f", rs.getFloat(7)) %></td>
			</tr>
			<% } %>
		</table>
        
		<h2>Generate Summary Sales Report</h2>
		<form method="post" action="SSRGenerateReport.jsp">
			<p>Report Date:<br><input type="month" name="reportDate" required value="" /></p>
			<p>Total Earnings:<br><input type="number" step="0.01" name="totalEarned" required value="" /></p>
			<p>Best Selling End-User:<br><input type="text" name="bestUser" value="" /></p>
			<p>Best Selling Item:<br><input type="text" name="bestItem" value="" /></p>
			<p>Earnings Per Users:<br><input type="number" step="0.01" name="userEarned" required value="" /></p>
			<p>Earnings Per Item:<br><input type="number" step="0.01" name="itemEarned" required value="" /></p>
			<p>Earnings Per Item Type:<br><input type="number" step="0.01" name="typeEarned" required value="" /></p>
			<input type="submit" value="Generate" />
		</form>
		<h2>Remove Summary Sales Report</h2>
		<form method="post" action="SSRRemoveReport.jsp">
			<p>Report Date:<br><input type="month" name="reportDate" required value="" /></p>
			<input type="submit" value="Remove" />
		</form>
		<br><a href='LoginAdmin.jsp'>Return</a>
	</body>
</html>