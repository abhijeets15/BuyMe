<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet rs1;
    rs1 = st.executeQuery("select * from account where username='" + username + "'");
    if (rs1.next()) {
    	session.setAttribute("serviceaccount", username);
		response.sendRedirect("USRUserEditNext.jsp");
    } else {
		response.sendRedirect("USRUserEditInvalid.jsp");
	}
%>