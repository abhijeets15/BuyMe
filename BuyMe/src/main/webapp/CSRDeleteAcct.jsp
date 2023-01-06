<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String username = request.getParameter("username");    
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet rs1, rs2;
    rs1 = st.executeQuery("select customer_rep_user from customer_representative_creates where customer_rep_user='" + username + "'");
    
    if (rs1.next()) {
		st.executeUpdate("delete from performs where customer_rep_user='" + username + "'");
		st.executeUpdate("delete from customer_representative_creates where customer_rep_user='" + username + "'");
		st.executeUpdate("delete from staff where staff_user='" + username + "'");
    	st.executeUpdate("delete from account where username='" + username + "'");
    	response.sendRedirect("CSRDeleteSuccess.jsp");
    } else {
    	response.sendRedirect("CSRDeleteInvalidUser.jsp");
	}
%>