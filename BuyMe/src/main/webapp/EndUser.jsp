<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>
	Search auctioned items based on any criteria
	</h1>
	<form method="get" action="SearchDetails.jsp">
				color: <input type="text" name="color"/> <br/>
				type:<input type="text" name="type"/> <br/>
				size:<input type="text" name="size"/> <br/>
				brand:<input type="text" name="brand"/> <br/>
				material:<input type="text" name="material"/> <br/>
				condition:<input type="text" name="condition"/> <br/>
				serial:<input type="text" name="serial"/> <br/>
				<label for="sorting">Sort by:</label>
				<select name="sorting" id="sorting">
					<option value="seller_user">Seller</option>
  					<option value="expiration_date">Expiration date</option>
  					<option value="expiration_time">Expiration time</option>
  					<option value="leading_bid">Leading bid</option>
  					<option value="initial_bid">Initial bid</option>
  					<option value="bid_increment">Bid increment</option>
  					<option value="minimum_price">Minimum price</option>
    				<option value="color">Color</option>
  					<option value="type">Type</option>
  					<option value="brand">Brand</option>
  					<option value="serial">Serial</option>
  					<option value="size">Size</option>
  					<option value="Material">Material</option>
  					
				</select>
				<input type="submit" value="Search"/>
	</form>
	
	<h2>Get all the auctions a specific buyer or seller has participated in</h2>
		<form method="get" action="Participation.jsp">
			Username:<input type="text" name="Username"/> <br/>
			<input type="submit" value="Search"/>
		</form>
	<h2>See similar items on auction in the last month</h2>
			<a href='Similar.jsp'>Check!</a><br>
			

	
	<h2>See all your item alerts</h2>
		<form method="get" action="itemAlert.jsp">
			Please type your Username:<input type="text" name="UsernameAlert"/> <br/>
			<input type="submit" value="Search"/>
		</form>
	
	<h2>Add a new item alert</h2>
	
	<form method="get" action="AdditemAlert.jsp">
				Please type your Username:<input type="text" name="UsernameAlert1"/> <br/>
				desired_type: <input type="text" name="type"/> <br/>
				desired_brand:<input type="text" name="brand"/> <br/>
				desired_color:<input type="text" name="color"/> <br/>
			<input type="submit" value="Search"/>
		</form>
	<br><a href='LoginUser.jsp'>Return</a>
</body>
</html>