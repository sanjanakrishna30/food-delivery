<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>

<%
HashMap<String,Integer> cart=(HashMap<String,Integer>)session.getAttribute("cart");
HashMap<String,Double> prices=(HashMap<String,Double>)session.getAttribute("prices");

double menuTotal=0;

if(cart!=null && prices!=null){
    for(String item:cart.keySet()){
        menuTotal += cart.get(item) * prices.get(item);
    }
}

double deliveryFee=40;
double platformFee=6;
double gst=menuTotal*0.05;
double total=menuTotal+deliveryFee+platformFee+gst;
%>

<!DOCTYPE html>
<html>
<head>
<style>

body{

background:#f8f5ef;

}

.card{

border-radius:20px;

}

table tr td{

vertical-align:middle;

}

.alert-success{

font-size:22px;

font-weight:bold;

}

</style>
<meta charset="UTF-8">
<title>Checkout</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container mt-5 mb-5">

<div class="row justify-content-center">

<div class="col-lg-8">

<div class="card shadow-lg border-0 p-4">

<h2 class="fw-bold">🧾 Bill Details</h2>

<p class="text-muted">
Review your order and payment details
</p>

<hr>

<h4 class="mb-4">
🛍️ Order Summary
</h4>

<table class="table table-bordered align-middle">

<thead class="table-light">

<tr>

<th>Item</th>

<th>Price</th>

<th>Qty</th>

<th>Total</th>

</tr>

</thead>

<tbody>

<%

if(cart!=null){

for(String item : cart.keySet()){

int qty=cart.get(item);

double price=prices.get(item);

double subtotal=qty*price;

%>

<tr>

<td><%=item%></td>

<td>₹<%=price%></td>

<td><%=qty%></td>

<td>₹<%=subtotal%></td>

</tr>

<%

}

}

%>

</tbody>

</table>
<hr>

<div class="d-flex justify-content-between mb-2">
    <span>Menu Total</span>
    <strong>₹<%=String.format("%.2f", menuTotal)%></strong>
</div>

<div class="d-flex justify-content-between mb-2">
    <span>Delivery Fee</span>
    <strong>₹<%=deliveryFee%></strong>
</div>

<div class="d-flex justify-content-between mb-2">
    <span>Platform Fee</span>
    <strong>₹<%=platformFee%></strong>
</div>

<div class="d-flex justify-content-between mb-3">
    <span>GST (5%)</span>
    <strong>₹<%=String.format("%.2f", gst)%></strong>
</div>

<div class="alert alert-success d-flex justify-content-between align-items-center">
    <h4 class="mb-0">Total Amount</h4>
    <h3 class="mb-0">₹<%=String.format("%.2f", total)%></h3>
</div>

<div class="alert alert-warning">
    <strong>🔒 Safe & Secure Payment</strong><br>
    Your payment information is encrypted and 100% secure.
</div>

<div class="d-flex justify-content-between">

    <a href="viewCart.jsp" class="btn btn-outline-secondary btn-lg">
        ⬅️ Back to Cart
    </a>

    <a href="delivery.jsp" class="btn btn-success btn-lg">
        Proceed to Delivery ➜
    </a>

</div>
</div>
</div>

</body>
</html>