<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Delivery Details</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:linear-gradient(135deg,#fff8f0,#ffe7d6);
font-family:Arial,sans-serif;
}

.card{
border:none;
border-radius:20px;
box-shadow:0px 10px 30px rgba(0,0,0,.15);
}

.title{
font-size:32px;
font-weight:bold;
color:#ff4d4d;
}

.subtitle{
color:gray;
margin-bottom:25px;
}

.form-control,.form-select{
border-radius:12px;
height:50px;
}

textarea{
border-radius:12px;
}

.btn{
border-radius:30px;
padding:12px 30px;
font-size:18px;
font-weight:bold;
}

.payment-box{
background:#f8f9fa;
padding:15px;
border-radius:15px;
margin-top:20px;
}

</style>

</head>

<body>

<div class="container mt-5 mb-5">

<div class="card p-5">

<div class="text-center">

<div class="title">🚚 Delivery Details</div>

<p class="subtitle">
Please enter your delivery information carefully.
</p>

</div>

<form action="OrderServlet" method="post">

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">Full Name</label>

<input
type="text"
name="name"
class="form-control"
placeholder="Enter Full Name"
required>

</div>

<div class="col-md-6 mb-3">

<label>Email Address</label>

<input
type="email"
name="email"
class="form-control"
placeholder="Enter Email"
required>

</div>

<div class="col-md-6 mb-3">

<label>Phone Number</label>

<input
type="text"
name="phone"
class="form-control"
placeholder="10 Digit Mobile Number"
required>

</div>

<div class="col-md-6 mb-3">

<label>Delivery Date</label>

<input
type="date"
name="date"
class="form-control"
required>

</div>

<div class="col-md-6 mb-3">

<label>Preferred Delivery Time</label>

<input
type="time"
name="time"
class="form-control">

</div>

<div class="col-md-6 mb-3">

<label>City</label>

<input
type="text"
name="city"
class="form-control"
placeholder="Enter City">

</div>

</div>

<div class="mb-3">

<label>Delivery Address</label>

<textarea
name="address"
rows="4"
class="form-control"
placeholder="House No, Street, Area, Landmark..."
required></textarea>

</div>

<div class="payment-box">

<h5>💳 Payment Method</h5>

<div class="form-check">

<input
class="form-check-input"
type="radio"
name="payment"
value="Cash on Delivery"
checked 
onclick="showPayment('cod')">

<label class="form-check-label">
Cash on Delivery
</label>

</div>

<div class="form-check">

<input
class="form-check-input"
type="radio"
name="payment"
value="UPI"
onclick="showPayment('upi')">

<label class="form-check-label">
UPI
</label>

</div>

<div class="form-check">

<input
class="form-check-input"
type="radio"
name="payment"
value="Credit/Debit Card"
onclick="showPayment('card')">

<label class="form-check-label">
Credit / Debit Card
</label>

</div>

<div class="form-check">

<input
class="form-check-input"
type="radio"
name="payment"
value="Net Banking"
onclick="showPayent('bank')">

<label class="form-check-label">
Net Banking
</label>

</div>
<!-- Cash on Delivery -->
<div id="codBox" class="payment-option mt-3">
    <div class="alert alert-success">
        💵 Pay when your order is delivered.
    </div>
</div>

<!-- UPI -->
<div id="upiBox" class="payment-option mt-3" style="display:none;">

    <h5>Choose UPI App</h5>

    <div class="form-check">
        <input class="form-check-input" type="radio" name="upi">
        <label class="form-check-label">📱 PhonePe</label>
    </div>

    <div class="form-check">
        <input class="form-check-input" type="radio" name="upi">
        <label class="form-check-label">🟢 Google Pay</label>
    </div>

    <div class="form-check">
        <input class="form-check-input" type="radio" name="upi">
        <label class="form-check-label">🔵 Paytm</label>
    </div>

    <br>

    <img src="https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=BiteBuddyUPI"
         width="180">

    <p class="mt-2"><b>UPI ID:</b> bitebuddy@upi</p>

</div>

<!-- Card -->
<div id="cardBox" class="payment-option mt-3" style="display:none;">

    <input type="text"
           class="form-control mb-2"
           placeholder="Card Number">

    <input type="text"
           class="form-control mb-2"
           placeholder="Card Holder Name">

    <div class="row">

        <div class="col">
            <input type="text"
                   class="form-control"
                   placeholder="MM/YY">
        </div>

        <div class="col">
            <input type="password"
                   class="form-control"
                   placeholder="CVV">
        </div>

    </div>

</div>

<!-- Net Banking -->
<div id="bankBox" class="payment-option mt-3" style="display:none;">

<select class="form-select">

<option>Select Bank</option>

<option>SBI</option>

<option>HDFC Bank</option>

<option>ICICI Bank</option>

<option>Axis Bank</option>

<option>Canara Bank</option>

<option>Union Bank</option>

</select>

</div>

</div>

<div class="mt-4">

<label>Special Instructions</label>

<textarea
name="instruction"
rows="3"
class="form-control"
placeholder="Ring the bell once, Don't call, etc."></textarea>

</div>

<div class="d-flex justify-content-between mt-5">

<a href="checkout.jsp"
class="btn btn-secondary">

⬅️ Back to Bill Details

</a>

<button
type="submit"
class="btn btn-success">

✅ Place Order

</button>

</div>

</form>
<script>

function showPayment(type){

document.getElementById("codBox").style.display="none";
document.getElementById("upiBox").style.display="none";
document.getElementById("cardBox").style.display="none";
document.getElementById("bankBox").style.display="none";

if(type=="cod")
document.getElementById("codBox").style.display="block";

if(type=="upi")
document.getElementById("upiBox").style.display="block";

if(type=="card")
document.getElementById("cardBox").style.display="block";

if(type=="bank")
document.getElementById("bankBox").style.display="block";

}

</script>

</div>

</div>

</body>
</html>

