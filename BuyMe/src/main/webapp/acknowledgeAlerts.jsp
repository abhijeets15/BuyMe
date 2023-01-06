<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	String userid = (String) session.getAttribute("user");
	st.executeUpdate("DELETE FROM bid_alert where buyer_user='" + userid + "'");
	st.executeUpdate("update win_alert set acknowledged=1 where buyer_user='" + userid + "' and acknowledged=0");
	response.sendRedirect("alerts.jsp");
%>