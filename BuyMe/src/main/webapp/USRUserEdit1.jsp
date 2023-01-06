<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");
	String serviceaccount = (String) session.getAttribute("serviceaccount");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    ResultSet rs1;
    
    rs1 = st.executeQuery("select username from account where username='" + username + "'");
    
    if (rs1.next()) {
		response.sendRedirect("USRUserEditTaken.jsp");
    } else {
    	st.executeUpdate("update account set username='" + username + "' where username='" + serviceaccount + "'");
		response.sendRedirect("USRUserEditNext.jsp");
    }
%>