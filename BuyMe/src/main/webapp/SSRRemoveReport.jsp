<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String reportDateString = request.getParameter("reportDate");
	reportDateString = reportDateString.replace("-","");
	int reportDate = Integer.parseInt(reportDateString);
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet rs1, rs2;
    rs1 = st.executeQuery("select report_ID from summary_sales_report where report_ID='" + reportDate + "'");
    
    if (rs1.next()) {
    	st.executeUpdate("delete from generates where report_ID='" + reportDate + "'");
    	st.executeUpdate("delete from summary_sales_report where report_ID='" + reportDate + "'");
		response.sendRedirect("SSRRemoveSuccess.jsp");
    } else {
		response.sendRedirect("SSRRemoveInvalid.jsp");
	}
%>