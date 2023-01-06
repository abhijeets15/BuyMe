<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    int bid = Integer.parseInt(request.getParameter("bid"));    
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet rs1;
    rs1 = st.executeQuery("select * from removes where bid_number='" + bid + "'");
    
    if (rs1.next()) {
    	st.executeUpdate("delete from removes where bid_number='" + bid + "'");
    	st.executeUpdate("delete from bid_alert where bid_number='" + bid + "'");
    	st.executeUpdate("delete from bid_posts_for where bid_number='" + bid + "'");
		response.sendRedirect("USRBidDeleteSuccess.jsp");
    } else {
		response.sendRedirect("USRBidDeleteInvalid.jsp");
	}
%>