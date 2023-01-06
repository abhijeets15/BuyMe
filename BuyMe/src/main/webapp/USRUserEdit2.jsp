<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String password = request.getParameter("password");
	String serviceaccount = (String) session.getAttribute("serviceaccount");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    st.executeUpdate("update account set password='" + password + "' where username='" + serviceaccount + "'");
	response.sendRedirect("USRUserEditNext.jsp");
%>