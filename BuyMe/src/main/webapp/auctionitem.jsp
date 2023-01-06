<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String exp_date = request.getParameter("exp_date");    
	String exp_time = request.getParameter("exp_time");   
    float min_price = Float.parseFloat(request.getParameter("min_price"));
    String material = request.getParameter("material");
    String color = request.getParameter("color");
    String size = request.getParameter("size");
    String type = request.getParameter("type");
    String brand = request.getParameter("brand");
    String condition = request.getParameter("condition");
    String serial = request.getParameter("serial");
    String bank_no = request.getParameter("bank_no");
    String bank_route = request.getParameter("bank_route");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    String userid = (String) session.getAttribute("user");
    st.executeUpdate("insert into seller values ('" + userid + "','" + bank_no + "','" + bank_route + "') on duplicate key update bank_account_number = '" + bank_no + "',bank_routing_number = '" + bank_route + "'");
    st.executeUpdate("insert into item_auctions (seller_user,post_date,expiration_date,expiration_time,leading_bid,initial_bid,bid_increment,minimum_price,material,color,size,type,brand,item_condition,serial) values ('" + userid + "',current_date,'" + exp_date + "','" + exp_time + "',0.00,0.00,0.00,'" + min_price + "','" + material + "','" + color + "','" + size + "','" + type + "','" + brand + "','" + condition + "','" + serial + "')");
	response.sendRedirect("AuctionItemSuccess.jsp");
%>