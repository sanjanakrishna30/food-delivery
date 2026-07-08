<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmed! 🎉</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', sans-serif; }
        body {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .success-card {
            background: white;
            padding: 50px 40px;
            border-radius: 24px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
            text-align: center;
            max-width: 500px;
            width: 100%;
        }
        .checkmark {
            width: 90px;
            height: 90px;
            background: #2ecc71;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 25px;
            box-shadow: 0 8px 20px rgba(46, 204, 113, 0.3);
            font-size: 45px;
            color: white;
        }
        h1 { color: #2c3e50; font-size: 28px; margin-bottom: 12px; }
        p { color: #7f8c8d; font-size: 16px; line-height: 1.6; margin-bottom: 30px; }
        .tracker {
            background: #f8f9fa;
            border-left: 5px solid #2ecc71;
            padding: 15px;
            border-radius: 8px;
            text-align: left;
            margin-bottom: 30px;
            font-weight: 600;
            color: #34495e;
        }
        .btn-home {
            background: linear-gradient(135deg, #ff4757, #ff6b81);
            color: white;
            padding: 14px 30px;
            text-decoration: none;
            font-weight: bold;
            border-radius: 12px;
            display: inline-block;
            box-shadow: 0 5px 15px rgba(255, 71, 87, 0.3);
        }
    </style>
</head>
<body>

<div class="success-card">
    <div class="checkmark">✓</div>
    <h1>Order Placed Successfully!</h1>
    <p>Your meal is registered in our system and sent over to the kitchen. Get ready to eat!</p>
    
    <div class="tracker">
        🛵 Delivery Status: <span style="color: #ff4757;">Arriving in 25 Mins</span>
    </div>
    
    <a href="restaurants.html" class="btn-home">Back to Restaurants</a>
</div>

</body>
</html>