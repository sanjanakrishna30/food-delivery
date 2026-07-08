<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Food Menu</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f8f9fa;
        }

        .title {
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            margin: 20px;
            text-transform: uppercase;
        }

        .food-card {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: 0.3s;
            background: white;
        }

        .food-card:hover {
            transform: scale(1.03);
        }

        .food-img {
            width: 100%;
            height: 160px;
            object-fit: cover;
        }

        .food-body {
            padding: 10px;
            text-align: center;
        }

        .price {
            color: green;
            font-weight: bold;
        }

        .btn {
            margin-top: 5px;
        }
    </style>
</head>

<body>

<h2 id="title" class="title"></h2>

<div class="container">
    <div class="row" id="foodList"></div>
</div>

<script>
let params = new URLSearchParams(window.location.search);
let type = params.get("type");

// set title
document.getElementById("title").innerText = type + " Menu";

// DATA (10 items each category)
let data = {
    pizza: [
    	 ["Cheese Pizza", "₹200", "https://picsum.photos/400/300?random=101"],
    	    ["Veg Pizza", "₹180", "https://picsum.photos/400/300?random=102"],
    	    ["Pepperoni Pizza", "₹250", "https://picsum.photos/400/300?random=103"],
    	    ["Margherita Pizza", "₹220", "https://picsum.photos/400/300?random=104"],
    	    ["BBQ Pizza", "₹270", "https://picsum.photos/400/300?random=105"],
    	    ["Farmhouse Pizza", "₹230", "https://picsum.photos/400/300?random=106"],
    	    ["Cheese Burst Pizza", "₹260", "https://picsum.photos/400/300?random=107"],
    	    ["Paneer Pizza", "₹240", "https://picsum.photos/400/300?random=108"],
    	    ["Spicy Pizza", "₹210", "https://picsum.photos/400/300?random=109"],
    	    ["Italian Pizza", "₹280", "https://picsum.photos/400/300?random=110"]
    ],

    biryani: [
        ["Chicken Biryani", "₹150", "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8"],
        ["Mutton Biryani", "₹220", "https://images.unsplash.com/photo-1631515243349-e0cb75fb8d4f"],
        ["Egg Biryani", "₹120", "https://images.unsplash.com/photo-1604908176997-125f25cc500f"],
        ["Hyderabadi Biryani", "₹250", "https://images.unsplash.com/photo-1601050690597-df0568f70950"],
        ["Kolkata Biryani", "₹230", "https://images.unsplash.com/photo-1626509653292-f1d90b9b9d9b"],
        ["Paneer Biryani", "₹180", "https://images.unsplash.com/photo-1604908554162-45f8a8f7b6f0"],
        ["Veg Biryani", "₹140", "https://images.unsplash.com/photo-1604908177520-472c7d3b3d64"],
        ["Spicy Biryani", "₹160", "https://images.unsplash.com/photo-1612874742237-6526221588e3"],
        ["Chicken Dum Biryani", "₹260", "https://images.unsplash.com/photo-1631452180519-c014fe946bc7"],
        ["Special Biryani", "₹300", "https://images.unsplash.com/photo-1625944525533-473e4a9f0f9a"]
    ],

    burger: [
        ["Veg Burger", "₹90", "https://images.unsplash.com/photo-1568901346375-23c9450c58cd"],
        ["Chicken Burger", "₹120", "https://images.unsplash.com/photo-1550547660-d9450f859349"],
        ["Cheese Burger", "₹140", "https://images.unsplash.com/photo-1551782450-a2132b4ba21d"],
        ["Double Burger", "₹180", "https://images.unsplash.com/photo-1568901346375-23c9450c58cd"],
        ["Spicy Burger", "₹130", "https://images.unsplash.com/photo-1606755962773-d324e0a13086"],
        ["Paneer Burger", "₹110", "https://images.unsplash.com/photo-1606755962773-d324e0a13086"],
        ["Chicken Cheese Burger", "₹160", "https://images.unsplash.com/photo-1551782450-a2132b4ba21d"],
        ["Crunchy Burger", "₹150", "https://images.unsplash.com/photo-1606755962773-d324e0a13086"],
        ["Mini Burger", "₹70", "https://images.unsplash.com/photo-1550547660-d9450f859349"],
        ["Special Burger", "₹200", "https://images.unsplash.com/photo-1568901346375-23c9450c58cd"]
    ],

    thali: [
        ["Veg Thali", "₹130", "https://images.unsplash.com/photo-1601050690597-df0568f70950"],
        ["South Indian Thali", "₹150", "https://images.unsplash.com/photo-1631515243349-e0cb75fb8d4f"],
        ["North Indian Thali", "₹180", "https://images.unsplash.com/photo-1604908176997-125f25cc500f"],
        ["Special Thali", "₹200", "https://images.unsplash.com/photo-1625944525533-473e4a9f0f9a"],
        ["Mini Thali", "₹100", "https://images.unsplash.com/photo-1601050690597-df0568f70950"],
        ["Full Meals Thali", "₹220", "https://images.unsplash.com/photo-1604908177520-472c7d3b3d64"],
        ["Deluxe Thali", "₹250", "https://images.unsplash.com/photo-1631515243349-e0cb75fb8d4f"],
        ["Festival Thali", "₹300", "https://images.unsplash.com/photo-1626509653292-f1d90b9b9d9b"],
        ["Rajasthani Thali", "₹280", "https://images.unsplash.com/photo-1604908554162-45f8a8f7b6f0"],
        ["Gujarati Thali", "₹260", "https://images.unsplash.com/photo-1604908176997-125f25cc500f"]
    ]
};

// render items
let container = document.getElementById("foodList");

if (data[type]) {
    let html = "";

    data[type].forEach(item => {
        html += `
        <div class="col-md-4 mb-3">
            <div class="food-card">
            <img src="${item[2]}" class="food-img" alt="${item[0]}">
            <div class="food-body">
            <h5>${item[0]}</h5>

            <p style="color:green;font-weight:bold;">
                ⭐ 4.5
            </p>

            <p class="price">${item[1]}</p>

            <button class="btn btn-danger w-100"
                onclick="addToCart('${item[0]}','${item[1]}')">
                🛒 Add to Cart
            </button>
        </div>
            </div>
        </div>`;
    });

    container.innerHTML = html;

}
function addToCart(name, price) {

    let form = document.createElement("form");
    form.method = "POST";
    form.action = "cartAction";

    form.innerHTML = `
        <input type="hidden" name="itemName" value="${name}">
        <input type="hidden" name="itemPrice" value="${price.replace('₹','')}">
        <input type="hidden" name="quantity" value="1">
    `;

    document.body.appendChild(form);
    form.submit();
}
</script>

</body>
</html>