<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>FAQ Board</title>
	</head>
	<body>
		<h1>FAQ Board</h1>
		
		<% 
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM faq");
		%>
		
		<table BORDER="1">
			<tr>
				<th>FAQ ID</th>
				<th>Question</th>
				<th>Answer</th>
			</tr>
			<% while(rs.next()){ %>
			<tr>
				<td> <%= rs.getString(1) %></td>
				<td> <%= rs.getString(2) %></td>
				<td> <%= rs.getString(3) %></td>
			</tr>
			<% } %>
		</table>
		
		<h2>Create FAQ Entry</h2>
		<form method="post" action="FAQCreate.jsp">
			<p>Question:<br><textarea name="question" maxlength = "255" rows="5" cols="50" required></textarea></p>
			<p>Answer:<br><textarea name="answer" maxlength = "255" rows="5" cols="50" required></textarea></p>
			<input type="submit" value="Submit" />
		</form>
		<h2>Delete FAQ Entry</h2>
		<form method="post" action="FAQDelete.jsp">
			<p>FAQ:<br><input type="number" name="faq" required value="" /></p>
			<input type="submit" value="Delete" />
		</form>
		<br><a href='LoginRep.jsp'>Return</a>
	</body>
</html>