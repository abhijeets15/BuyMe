<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    int ticket = Integer.parseInt(request.getParameter("request"));    
	String feedback = request.getParameter("feedback");
	String perform = request.getParameter("perform");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet rs1, rs2;
    rs1 = st.executeQuery("select * from service_request where request_ID='" + ticket + "'");
    
    if (rs1.next()) {
    	String userid = (String) session.getAttribute("user");
    	st.executeUpdate("update service_request set rep_feedback = '" + feedback +"', modified_user_data ='" + perform + "' where request_ID= '" + ticket + "'");
		rs2 = st.executeQuery("select * from performs where request_ID='" + ticket + "'");
    	if (rs2.next()) {
    		st.executeUpdate("update performs set customer_rep_user='" + userid + "' where request_ID ='" + ticket + "'");
    		response.sendRedirect("USRTicketModifySuccess.jsp");
    	} else {
    		st.executeUpdate("insert into performs values ('" + ticket + "','" + userid + "')");
    		response.sendRedirect("USRTicketModifySuccess.jsp");
    	}
    } else {
		response.sendRedirect("USRTicketModifyInvalid.jsp");
	}
%>