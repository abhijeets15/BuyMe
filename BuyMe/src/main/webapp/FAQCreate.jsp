<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String question = request.getParameter("question");
	String answer = request.getParameter("answer");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    ResultSet rs1;
    
    String userid = (String) session.getAttribute("user");
    
    st.executeUpdate("insert into faq values (default, '" + question + "', '" + answer + "')");
    rs1 = st.executeQuery("select faq_ID from faq where question='" + question + "' and answer='" + answer + "'");
    if (rs1.next()) {
    	String faqID = rs1.getString(1);
    	st.executeUpdate("insert into adjusts values ('" + faqID + "', '" + userid + "')");
    	response.sendRedirect("FAQCreateSuccess.jsp");
    } else {
    	st.executeUpdate("delete from faq where question='" + question + "' and answer='" + answer + "'");
    	response.sendRedirect("FAQCreateError.jsp");
    }
%>