<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    
	int auction_id = Integer.parseInt(request.getParameter("auction_id"));    
    float bid = Float.parseFloat(request.getParameter("bid"));
    float bid_ul = Float.parseFloat(request.getParameter("bid_ul"));
    float bid_inc = Float.parseFloat(request.getParameter("bid_inc"));
    String ship_add = request.getParameter("ship_add");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet rs;
    rs = st.executeQuery("select * from item_auctions where auction_ID='" + auction_id + "'");
    if (rs.next() == false) {
    	response.sendRedirect("itemdoesnotexist.jsp");
    } else {
    
    String userid = (String) session.getAttribute("user");
    
    ResultSet rs1;
    rs1 = st.executeQuery("select leading_bid from item_auctions where auction_ID='" + auction_id + "'");
    rs1.next();
    float c_bid = rs1.getFloat(1);
    
    ResultSet rs2;
    rs2 = st.executeQuery("select bid_increment from item_auctions where auction_ID='" + auction_id + "'");
    rs2.next();
    float c_bid_inc = rs2.getFloat(1);
    
    ResultSet rs3;
    rs3 = st.executeQuery("SELECT bid_limit from bid_posts_for where bid_number = (SELECT MAX(bid_number) from bid_posts_for where auction_ID='" + auction_id + "') and auction_ID='" + auction_id + "'");
    float c_bid_ul;
    if (rs3.next() == false) {
    	c_bid_ul = 0;
    } else {
    	c_bid_ul = rs3.getFloat(1);
    }
    
    ResultSet rs4;
    rs4 = st.executeQuery("SELECT buyer_user from bid_posts_for where bid_number = (SELECT MAX(bid_number) from bid_posts_for where auction_ID='" + auction_id + "') and auction_ID='" + auction_id + "'");
    String c_bid_user;
    if (rs4.next() == false) {
    	c_bid_user = userid;
    } else {
    	c_bid_user = rs4.getString(1);
    }
    
    ResultSet rs5;
    rs5 = st.executeQuery("SELECT MAX(bid_number) from bid_posts_for where auction_ID='" + auction_id + "'");
    int c_bid_num;
    if (rs5.next() == false) {
    	c_bid_num = 0;
    } else {
    	c_bid_num = rs5.getInt(1);
    }
    
    ResultSet rs6;
    rs6 = st.executeQuery("SELECT * FROM item_auctions where auction_ID='" + auction_id + "' and ((expiration_date=current_date and current_time<expiration_time) or (current_date<expiration_date))");
    
    if (rs6.next() == false) {
    	response.sendRedirect("bidtoolate.jsp");
    } else {
    
    	if (bid_ul <= c_bid_ul) {
    		while (c_bid < bid_ul) {
    			c_bid = c_bid + c_bid_inc;
    			if (c_bid > c_bid_ul) {
    				c_bid = c_bid_ul;
    			}
    		}
    		st.executeUpdate("update item_auctions set leading_bid ='" + c_bid + "' where auction_ID='" + auction_id + "'");
    		st.executeUpdate("insert into bid_posts_for (buyer_user,auction_id,post_date,post_time,current_bid,bid_limit) values ('" + c_bid_user + "','" + auction_id + "', current_date, current_time,'" + c_bid + "','" + c_bid_ul + "')");
    		response.sendRedirect("bidtoolow.jsp");
    	} else {
    		while (bid < c_bid_ul) {
    			bid = bid + bid_inc;
    			if (bid > bid_ul) {
    				bid = bid_ul; 
    			}
    		}
    		st.executeUpdate("update item_auctions set leading_bid ='" + bid + "' where auction_ID='" + auction_id + "' ");
    		st.executeUpdate("update item_auctions set bid_increment ='" + bid_inc + "' where auction_ID='" + auction_id + "' ");
    		if (c_bid_num == 0) {
    			st.executeUpdate("update item_auctions set initial_bid ='" + bid + "' where auction_ID='" + auction_id + "' ");
    		}
    		st.executeUpdate("insert into buyer values ('" + userid + "','" + ship_add + "') on duplicate key update shipping_address = '" + ship_add + "'");
    		st.executeUpdate("insert into bid_posts_for (buyer_user,auction_id,post_date,post_time,current_bid,bid_limit) values ('" + userid + "','" + auction_id + "', current_date, current_time,'" + bid + "','" + bid_ul + "')");
    		if (!c_bid_user.equals(userid)) {
    			st.executeUpdate("insert into bid_alert values ('" + c_bid_user + "','" + c_bid_num + "','" + auction_id + "')");
    		}
    		response.sendRedirect("bidset.jsp");
    	}
    }
    }
%>