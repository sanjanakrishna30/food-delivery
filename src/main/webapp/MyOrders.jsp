<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Orders</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#f8f9fa;
padding:40px;
}

.card{
border-radius:20px;
box-shadow:0 10px 25px rgba(0,0,0,.15);
}

.table th{
background:#ff6b35;
color:white;
}

h2{
color:#ff6b35;
font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

<div class="card p-4">

<h2>My Orders</h2>

<table class="table table-bordered table-hover mt-4">

<tr>

<th>Order ID</th>

<th>Items</th>

<th>Total</th>

<th>Date & Time</th>
<th>Status</th>

</tr>


<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/bitebuddy_db",
"root",
"root@123");

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from orders order by id desc");

while(rs.next()){
	Timestamp orderTime = rs.getTimestamp("order_time");

	long diff = System.currentTimeMillis() - orderTime.getTime();

	String status;

	if(diff < 30000){
	    status = "Preparing";
	}
	else if(diff < 60000){
	    status = "Out for Delivery";
	}
	else{
	    status = "Delivered";
	}

%>

<tr>

<td><%=rs.getInt("id")%></td>

<td><%=rs.getString("restaurant_name")%></td>

<td>₹ <%=rs.getDouble("amount")%></td>

<td><%=rs.getTimestamp("order_time")%></td>
<td>
<%
if(status.equals("Preparing")){
%>
<span style="color:orange;font-weight:bold;">🍳 Preparing</span>

<%
}else if(status.equals("Out for Delivery")){
%>
<span style="color:blue;font-weight:bold;">🛵 Out for Delivery</span>

<%
}else{
%>
<span style="color:green;font-weight:bold;">✅ Delivered</span>
<%
}
%>
</td>
</tr>

<%

}

con.close();

}catch(Exception e){

out.println(e);

}

%>

</table>

<a href="restaurants.html" class="btn btn-success">

 Back to Restaurants

</a>

</div>

</div>

</body>

</html>