<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String fullname = request.getParameter("fullname");
	String userid = (String) session.getAttribute("user");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    st.executeUpdate("update end_user set name='" + fullname + "' where member_user='" + userid + "'");
	response.sendRedirect("EUAccount.jsp");
%>