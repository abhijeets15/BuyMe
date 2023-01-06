<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Create New Account</title>
	</head>
	<body>
		<form method="post" action="auctionitem.jsp">
			<table border="1">
				<thead>
					<tr>
						<th colspan="2">Post Item for Auction</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Auction End Date (YYYY-MM-DD)</td>
						<td><input type="text" name="exp_date" required value="" /></td>
					</tr>
					<tr>
						<td>Auction End Time (00:00 to 23:59)</td>
						<td><input type="text" name="exp_time" required value="" /></td>
					</tr>
					<tr>
						<td>Minimum Selling Price</td>
						<td><input type="number" name="min_price" required value="" /></td>
					</tr>
					<tr>
						<td>Material</td>
						<td><input type="text" name="material" required value="" /></td>
					</tr>
					<tr>
						<td>Color</td>
						<td><input type="text" name="color" required value="" /></td>
					</tr>
					<tr>
						<td>Size</td>
						<td><input type="text" name="size" required value="" /></td>
					</tr>
					<tr>
						<td>Type</td>
						<td><input type="text" name="type" required value="" /></td>
					</tr>
					<tr>
						<td>Brand</td>
						<td><input type="text" name="brand" required value="" /></td>
					</tr>
					<tr>
						<td>Condition</td>
						<td><input type="text" name="condition" required value="" /></td>
					</tr>
					<tr>
						<td>Serial</td>
						<td><input type="text" name="serial" required value="" /></td>
					</tr>
					<tr>
						<td>Bank Account Number</td>
						<td><input type="text" name="bank_no" required value="" /></td>
					</tr>
					<tr>
						<td>Bank Routing Number</td>
						<td><input type="text" name="bank_route" required value="" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="Submit" required /></td>
						<td><input type="reset" value="Reset" /></td>
					</tr>
					<tr>
						<td colspan="2"><a href="LoginUser.jsp">Return</a></td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>