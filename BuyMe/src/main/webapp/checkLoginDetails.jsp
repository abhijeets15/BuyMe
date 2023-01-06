<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();
    Statement st = con.createStatement();
    ResultSet rs1, rs2, rs3;
    rs1 = st.executeQuery("select * from account natural join end_user where username='" + userid + "' and password='" + pwd + "' and account.username = end_user.member_user");
    if (rs1.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        response.sendRedirect("LoginUser.jsp");
    } else {
    	rs2 = st.executeQuery("select * from account natural join administrator where username='" + userid + "' and password='" + pwd + "' and account.username = administrator.admin_user");
    	if (rs2.next()) {
    		session.setAttribute("user", userid); // the username will be stored in the session
            response.sendRedirect("LoginAdmin.jsp");
    	} else {
    		rs3 = st.executeQuery("select * from account natural join customer_representative_creates where username='" + userid + "' and password='" + pwd + "' and account.username = customer_representative_creates.customer_rep_user");
    		if (rs3.next()) {
    			session.setAttribute("user", userid); // the username will be stored in the session
                response.sendRedirect("LoginRep.jsp");
    		} else {
    			out.println("Invalid login credentials. <br> <a href='login.jsp'>Try again.</a>");
    		}
    	}
    }
%>