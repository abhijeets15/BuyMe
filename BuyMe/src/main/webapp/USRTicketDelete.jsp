<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    int ticket = Integer.parseInt(request.getParameter("request"));    
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet rs1;
    
    rs1 = st.executeQuery("select * from service_request where request_ID='" + ticket + "'");
    
    if (rs1.next()) {
    	st.executeUpdate("delete from removes where request_ID='" + ticket + "'");
		st.executeUpdate("delete from amends where request_ID='" + ticket + "'");
    	st.executeUpdate("delete from requests where request_ID='" + ticket + "'");
    	st.executeUpdate("delete from performs where request_ID='" + ticket + "'");
    	st.executeUpdate("delete from service_request where request_ID='" + ticket + "'");
    	response.sendRedirect("USRTicketDeleteSuccess.jsp");
    } else {
		response.sendRedirect("USRTicketDeleteInvalid.jsp");
	}
%>