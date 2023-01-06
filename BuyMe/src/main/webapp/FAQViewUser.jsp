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
			String keyword1 = request.getParameter("keyword1");
			String keyword2 = request.getParameter("keyword2");
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM faq");
		%>
		
		<table BORDER="1">
			<tr>
				<th>Question</th>
				<th>Answer</th>
			</tr>
			<% while(rs.next()){ %>
			<tr>
				<td> <%= rs.getString(2) %></td>
				<td> <%= rs.getString(3) %></td>
			</tr>
			<% } %>
		</table>
		
		<h2>Find by Keywords</h2>
		<form method="post" action="FAQViewUserLimited.jsp">
			<p><input type="text" name="keyword1" required value="" /></p>
			<p><input type="text" name="keyword2" value="" /></p>
			<input type="submit" value="Search" />
		</form>
		<br><a href='LoginUser.jsp'>Return</a>
	</body>
</html>