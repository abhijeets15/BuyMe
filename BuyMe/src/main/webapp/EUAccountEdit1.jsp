<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");
	String userid = (String) session.getAttribute("user");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    ResultSet rs1;
    
    rs1 = st.executeQuery("select username from account where username='" + username + "'");
    
    if (rs1.next()) {
		response.sendRedirect("EUAccountTaken.jsp");
    } else {
    	st.executeUpdate("update account set username='" + username + "' where username='" + userid + "'");
    	session.setAttribute("user", username);
		response.sendRedirect("EUAccount.jsp");
    }
%>