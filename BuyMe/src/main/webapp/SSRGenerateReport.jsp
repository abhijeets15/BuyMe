<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String reportDateString = request.getParameter("reportDate");
	reportDateString = reportDateString.replace("-","");
	int reportDate = Integer.parseInt(reportDateString);
    float totalEarned = Float.parseFloat(request.getParameter("totalEarned"));
    String bestUser = request.getParameter("bestUser");
    String bestItem = request.getParameter("bestItem");
    float userEarned = Float.parseFloat(request.getParameter("userEarned"));
    float itemEarned = Float.parseFloat(request.getParameter("itemEarned"));
    float typeEarned = Float.parseFloat(request.getParameter("typeEarned"));
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet rs1, rs2;
    rs1 = st.executeQuery("select report_ID from summary_sales_report where report_ID='" + reportDate + "'");
    
    if (rs1.next()) {
    	response.sendRedirect("SSRGenerateInvalid.jsp");
    } else {
    	String userid = (String) session.getAttribute("user");
    	st.executeUpdate("insert into summary_sales_report values ('" + reportDate + "','" + totalEarned + "','" + bestUser + "','" + bestItem + "','" + userEarned + "','" + itemEarned + "','" + typeEarned + "')");
    	st.executeUpdate("insert into generates values ('" + reportDate + "','" + userid + "')");
		response.sendRedirect("SSRGenerateSuccess.jsp");
	}
%>