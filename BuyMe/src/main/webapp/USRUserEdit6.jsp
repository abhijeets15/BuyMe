<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String address = request.getParameter("address");
	String serviceaccount = (String) session.getAttribute("serviceaccount");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    st.executeUpdate("update end_user set home_address='" + address + "' where member_user='" + serviceaccount + "'");
	response.sendRedirect("USRUserEditNext.jsp");
%>