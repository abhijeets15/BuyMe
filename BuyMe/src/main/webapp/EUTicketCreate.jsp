<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String auction = request.getParameter("auction");
	String bid = request.getParameter("bid");
	String userrequest = request.getParameter("userrequest");
	String userid = (String) session.getAttribute("user");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    ResultSet rs1, rs2, rs3;
    
    if (bid != "" && auction != "") {
    	rs1 = st.executeQuery("SELECT bid_number FROM bid_posts_for WHERE bid_number='" + Integer.parseInt(bid) + "' AND buyer_user='" + userid + "'");
    	if (rs1.next()) {
    		rs2 = st.executeQuery("SELECT auction_ID FROM item_auctions WHERE auction_ID='" + Integer.parseInt(auction) + "'");
    		if (rs2.next()) {
	    		st.executeUpdate("INSERT INTO service_request (request_ID, user_request) VALUES (default, '" + userrequest + "')");
	    		rs3 = st.executeQuery("SELECT request_ID FROM service_request WHERE user_request='" + userrequest + "'");
	    		if (rs3.next()) {
	    			String serviceID = rs3.getString(1);
		    		st.executeUpdate("INSERT INTO requests VALUES ('" + serviceID + "', '" + userid + "')");
		    		st.executeUpdate("INSERT INTO removes VALUES ('" + serviceID + "', '" + bid + "', '" + auction + "')");
		    		response.sendRedirect("EUTicketSuccess.jsp");
	    		} else {
	    			st.executeUpdate("DELETE FROM service_request WHERE user_request='" + userrequest + "'");
	    			response.sendRedirect("EUTicketFailed.jsp");
	    		}
    		} else {
    			response.sendRedirect("EUTicketAuctionInvalid.jsp");
    		}
    	}
    	else {
    		response.sendRedirect("EUTicketBidInvalid.jsp");
    	}
    } else if (auction != "") {
    	rs1 = st.executeQuery("SELECT auction_ID FROM item_auctions WHERE auction_ID='" + Integer.parseInt(auction) + "' AND seller_user='" + userid + "'");
    	if (rs1.next()) {
    		st.executeUpdate("INSERT INTO service_request (request_ID, user_request) VALUES (default, '" + userrequest + "')");
    		rs2 = st.executeQuery("SELECT request_ID FROM service_request WHERE user_request='" + userrequest + "'");
    		if (rs2.next()) {
    			String serviceID = rs2.getString(1);
	    		st.executeUpdate("INSERT INTO requests VALUES ('" + serviceID + "', '" + userid + "')");
	    		st.executeUpdate("INSERT INTO amends VALUES ('" + serviceID + "', '" + auction + "')");
	    		response.sendRedirect("EUTicketSuccess.jsp");
    		} else {
    			st.executeUpdate("DELETE FROM service_request WHERE user_request='" + userrequest + "'");
    			response.sendRedirect("EUTicketFailed.jsp");
    		}
    	}
    	else {
    		response.sendRedirect("EUTicketAuctionInvalid.jsp");
    	}
    } else {
    	st.executeUpdate("INSERT INTO service_request (request_ID, user_request) VALUES (default, '" + userrequest + "')");
		rs1 = st.executeQuery("SELECT request_ID FROM service_request WHERE user_request='" + userrequest + "'");
		if (rs1.next()) {
			st.executeUpdate("INSERT INTO requests VALUES ('" + rs1.getString(1) + "', '" + userid + "')");
			response.sendRedirect("EUTicketSuccess.jsp");
		} else {
			st.executeUpdate("DELETE FROM service_request WHERE user_request='" + userrequest + "'");
			response.sendRedirect("EUTicketFailed.jsp");
		}
    }
%>