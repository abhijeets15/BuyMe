<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    int auction = Integer.parseInt(request.getParameter("auction"));    
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet rs1;
    
    rs1 = st.executeQuery("select * from amends where auction_ID='" + auction + "'");
    
    if (rs1.next()) {
    	st.executeUpdate("delete from bid_alert where auction_ID='" + auction + "'");
    	st.executeUpdate("delete from removes where auction_ID='" + auction + "'");
		st.executeUpdate("delete from bid_posts_for where auction_ID='" + auction + "'");
    	st.executeUpdate("delete from retrieves where auction_ID='" + auction + "'");
    	st.executeUpdate("delete from amends where auction_ID='" + auction + "'");
    	st.executeUpdate("delete from within where auction_ID='" + auction + "'");
    	st.executeUpdate("delete from item_auctions where auction_ID='" + auction + "'");
    	response.sendRedirect("USRAuctionDeleteSuccess.jsp");
    } else {
		response.sendRedirect("USRAuctionDeleteInvalid.jsp");
	}
%>