<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    String pwd = request.getParameter("password");
    String email = request.getParameter("email");
    String fullname = request.getParameter("fullname");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    
    ResultSet rs1;
    rs1 = st.executeQuery("select username from account where username='" + username + "'");
    
    if (rs1.next()) {
    	response.sendRedirect("SignUpTaken.jsp");
    } else {
    	String userid = (String) session.getAttribute("user");
    	st.executeUpdate("insert into account values ('" + username + "','" + pwd + "','" + email + "')");
    	st.executeUpdate("insert into end_user (member_user, name, phone_number, home_address) values ('" + username + "','" + fullname + "','" + phone + "','" + address + "')");
		response.sendRedirect("SignUpSuccess.jsp");
	}
%>