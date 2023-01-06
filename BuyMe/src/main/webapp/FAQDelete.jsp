<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    int faq_ID = Integer.parseInt(request.getParameter("faq"));    
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet rs1;
    
    rs1 = st.executeQuery("select * from faq where faq_ID='" + faq_ID + "'");
    
    if (rs1.next()) {
		st.executeUpdate("delete from adjusts where faq_ID='" + faq_ID + "'");
		st.executeUpdate("delete from faq where faq_ID='" + faq_ID + "'");
		response.sendRedirect("FAQDeleteSuccess.jsp");
    } else {
		response.sendRedirect("FAQDeleteInvalid.jsp");
	}
%>