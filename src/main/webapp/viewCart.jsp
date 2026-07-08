<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

HashMap<String, Integer> cart =
    (HashMap<String, Integer>) session.getAttribute("cart");

HashMap<String, Double> prices =
    (HashMap<String, Double>) session.getAttribute("prices");

double total = 0;
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Your Food Basket - BiteBuddy</title>
    <style>
     .cart-container {
            margin: 0 auto;
            width: 80%;
            text-align: center;
            font-family: Arial, sans-serif;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        .qty-controls {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Poppins', 'Segoe UI', sans-serif; }
        
        /* Vibrant, delicious food-themed background gradient */
        body { 
            background: linear-gradient(135deg, #ff9f43 0%, #ff5252 100%); 
            min-height: 100vh;
            padding: 40px 20px; 
            display: flex; 
            justify-content: center; 
            align-items: center;
        }
        
        /* Modern Glassmorphism Container Card */
        .cart-container { 
            background: rgba(255, 255, 255, 0.96); 
            padding: 40px; 
            border-radius: 24px; 
            box-shadow: 0 15px 35px rgba(0,0,0,0.2); 
            width: 100%; 
            max-width: 800px; 
        }
        
        h2 { 
            color: #2c3e50; 
            margin-bottom: 25px; 
            font-size: 28px; 
            border-bottom: 3px solid #ff4757; 
            padding-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        
        th { 
            background-color: #ff4757; 
            color: white; 
            font-weight: 600; 
            padding: 15px;
            text-align: left;
            font-size: 16px;
        }
        th:first-child { border-top-left-radius: 12px; border-bottom-left-radius: 12px; }
        th:last-child { border-top-right-radius: 12px; border-bottom-right-radius: 12px; }
        
        td { 
            padding: 16px 15px; 
            text-align: left; 
            border-bottom: 1px solid #f1f2f6; 
            color: #57606f; 
            font-size: 15px; 
        }
        
        tr:hover td { background-color: #fffaf0; }
        
        .food-name { font-weight: 600; color: #2c3e50; }
        .subtotal-val { font-weight: 600; color: #ff4757; }
        
        .total-section { 
            text-align: right; 
            margin-top: 30px; 
            font-size: 22px; 
            font-weight: 800; 
            color: #2c3e50;
            background: #fff5f5;
            padding: 15px 25px;
            border-radius: 12px;
            display: inline-block;
            float: right;
            width: 100%;
        }
        
        .actions { 
            margin-top: 35px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            clear: both;
        }
        
        .btn-back { 
            color: #ff4757; 
            text-decoration: none; 
            font-weight: 700; 
            font-size: 16px; 
            transition: transform 0.2s;
        }
        .btn-back:hover { transform: translateX(-5px); }
        
        .btn-checkout { 
            background: linear-gradient(135deg, #2ecc71, #218c74); 
            color: white; 
            border: none; 
            padding: 14px 30px; 
            border-radius: 12px; 
            font-weight: 700; 
            font-size: 16px;
            cursor: pointer; 
            text-decoration: none; 
            box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3); 
            transition: all 0.2s;
        }
        .btn-checkout:hover { 
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(46, 204, 113, 0.4);
        }
        
        .empty-msg { 
            text-align: center; 
            color: #57606f; 
            padding: 40px 20px; 
            font-size: 18px; 
            line-height: 1.6;
        }
    </style>
</head>
<body>
<div class="cart-container">
     <h2>Your Basket</h2>

        <table>
<tr>
    <th>Item Details</th>
    <th>Price</th>
    <th>Qty</th>
    <th>Subtotal</th>
</tr>

<%
if(cart != null && !cart.isEmpty()){

    for(String itemName : cart.keySet()){

        int qty = cart.get(itemName);

        double price = prices.getOrDefault(itemName,0.0);
%>

<tr>

<td><%= itemName %></td>

<td>₹<%= price %></td>

<td class="qty-controls">

<a href="CartServlet?action=update&itemName=<%=itemName%>&change=-1">-</a>

<strong><%= qty %></strong>

<a href="CartServlet?action=update&itemName=<%=itemName%>&change=1">+</a>

</td>

<td>₹<%= qty*price %></td>

</tr>

<%
    }

}else{
%>

<tr>

<td colspan="4" style="text-align:center;">
Your cart is empty.
</td>

</tr>

<%
}
%>

</table>
        <%
double totalAmount = 0;

if(cart != null){
    for(String item : cart.keySet()){
        totalAmount += cart.get(item) * prices.get(item);
    }
}
%>

<div style="margin-top:30px;text-align:right;">

<h3>Total Amount : ₹ <%= totalAmount %></h3>

<br>

<a href="restaurants.html"
class="btn btn-warning">
➕ Add More Items
</a>

<a href="checkout.jsp"
class="btn btn-success">
Proceed To Checkout →
</a>
    </div>
</body>
</html>