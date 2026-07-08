<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Menu</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">

<div class="container mt-5">

    <h2 class="text-danger">🍽️ Restaurant Menu</h2>

    <hr>

    <h4 id="restaurantName"></h4>
    <div id="menuItems"></div>
    </div>

   

<script>

const params = new URLSearchParams(window.location.search);

let restaurant = params.get("restaurant");

if (restaurant == null) {
    restaurant = "BiteBuddy Restaurant";
}

document.getElementById("restaurantName").innerText = decodeURIComponent(restaurant);
const menuContainer = document.getElementById("menuItems");

if (restaurant === "Kathi Junction") {

	menuContainer.innerHTML = `

		<div class="card p-3 mt-3">
		<h5>Chicken Roll</h5>
		<p>₹120</p>
		<button class="btn btn-success"
		onclick="addToCart('Chicken Roll',120)">
		Add to Cart
		</button>
		</div>

		<div class="card p-3 mt-3">
		<h5>Paneer Roll</h5>
		<p>₹140</p>
		<button class="btn btn-success"
		onclick="addToCart('Paneer Roll',140)">
		Add to Cart
		</button>
		</div>

		<div class="card p-3 mt-3">
		<h5>Veg Roll</h5>
		<p>₹100</p>
		<button class="btn btn-success"
		onclick="addToCart('Veg Roll',100)">
		Add to Cart
		</button>
		</div>

		<div class="card p-3 mt-3">
		<h5>Shawarma</h5>
		<p>₹170</p>
		<button class="btn btn-success"
		onclick="addToCart('Shawarma',170)">
		Add to Cart
		</button>
		</div>

		<div class="card p-3 mt-3">
		<h5>French Fries</h5>
		<p>₹90</p>
		<button class="btn btn-success"
		onclick="addToCart('French Fries',90)">
		Add to Cart
		</button>
		</div>

		`;
}
else if (restaurant === "The O'rica Fine Dining") {

    menuContainer.innerHTML = `
    <div class="card p-3 mt-3">
        <h5>Paneer Butter Masala</h5>
        <p>₹220</p>
        <button class="btn btn-success" onclick="addToCart('Paneer Butter Masala',220)">Add to Cart</button>
    </div>

    <div class="card p-3 mt-3">
        <h5>Chicken Biryani</h5>
        <p>₹280</p>
        <button class="btn btn-success" onclick="addToCart('Chicken Biryani',280)">Add to Cart</button>
    </div>

    <div class="card p-3 mt-3">
        <h5>Butter Naan</h5>
        <p>₹40</p>
        <button class="btn btn-success" onclick="addToCart('Butter Naan',40)">Add to Cart</button>
    </div>

    <div class="card p-3 mt-3">
        <h5>Jeera Rice</h5>
        <p>₹150</p>
        <button class="btn btn-success" onclick="addToCart('Jeera Rice',150)">Add to Cart</button>
    </div>

    <div class="card p-3 mt-3">
        <h5>Gulab Jamun</h5>
        <p>₹80</p>
        <button class="btn btn-success" onclick="addToCart('Gulab Jamun',80)">Add to Cart</button>
    </div>
    `;

}
else if (restaurant === "Shree Naivedyam") {

    menuContainer.innerHTML = `
    <div class="card p-3 mt-3"><h5>South Indian Thali</h5><p>₹180</p><button class="btn btn-success" onclick="addToCart('South Indian Thali',180)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Masala Dosa</h5><p>₹90</p><button class="btn btn-success" onclick="addToCart('Masala Dosa',90)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Idli Vada</h5><p>₹70</p><button class="btn btn-success" onclick="addToCart('Idli Vada',70)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Lemon Rice</h5><p>₹110</p><button class="btn btn-success" onclick="addToCart('Lemon Rice',110)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Filter Coffee</h5><p>₹40</p><button class="btn btn-success" onclick="addToCart('Filter Coffee',40)">Add to Cart</button></div>
    `;

}
else if (restaurant === "Dino's Pizza") {

    menuContainer.innerHTML = `
    <div class="card p-3 mt-3"><h5>Margherita Pizza</h5><p>₹199</p><button class="btn btn-success" onclick="addToCart('Margherita Pizza',199)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Farmhouse Pizza</h5><p>₹299</p><button class="btn btn-success" onclick="addToCart('Farmhouse Pizza',299)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Garlic Bread</h5><p>₹99</p><button class="btn btn-success" onclick="addToCart('Garlic Bread',99)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Pasta</h5><p>₹180</p><button class="btn btn-success" onclick="addToCart('Pasta',180)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Coke</h5><p>₹50</p><button class="btn btn-success" onclick="addToCart('Coke',50)">Add to Cart</button></div>
    `;

}
else if (restaurant === "Burger King") {

    menuContainer.innerHTML = `
    <div class="card p-3 mt-3"><h5>Veg Whopper</h5><p>₹199</p><button class="btn btn-success" onclick="addToCart('Veg Whopper',199)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Chicken Whopper</h5><p>₹249</p><button class="btn btn-success" onclick="addToCart('Chicken Whopper',249)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Crispy Veg Burger</h5><p>₹149</p><button class="btn btn-success" onclick="addToCart('Crispy Veg Burger',149)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>French Fries</h5><p>₹99</p><button class="btn btn-success" onclick="addToCart('French Fries',99)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Coke</h5><p>₹60</p><button class="btn btn-success" onclick="addToCart('Coke',60)">Add to Cart</button></div>
    `;
}
else if (restaurant === "Adil Hotel & Biryani") {

    menuContainer.innerHTML = `
    <div class="card p-3 mt-3"><h5>Chicken Biryani</h5><p>₹220</p><button class="btn btn-success" onclick="addToCart('Chicken Biryani',220)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Mutton Biryani</h5><p>₹320</p><button class="btn btn-success" onclick="addToCart('Mutton Biryani',320)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Chicken Kabab</h5><p>₹180</p><button class="btn btn-success" onclick="addToCart('Chicken Kabab',180)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Chicken Fried Rice</h5><p>₹170</p><button class="btn btn-success" onclick="addToCart('Chicken Fried Rice',170)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Falooda</h5><p>₹120</p><button class="btn btn-success" onclick="addToCart('Falooda',120)">Add to Cart</button></div>
    `;

}
else if (restaurant === "Pakashala") {

    menuContainer.innerHTML = `
    <div class="card p-3 mt-3"><h5>Masala Dosa</h5><p>₹120</p><button class="btn btn-success" onclick="addToCart('Masala Dosa',120)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Idli Vada</h5><p>₹80</p><button class="btn btn-success" onclick="addToCart('Idli Vada',80)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>South Indian Meals</h5><p>₹180</p><button class="btn btn-success" onclick="addToCart('South Indian Meals',180)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Pongal</h5><p>₹100</p><button class="btn btn-success" onclick="addToCart('Pongal',100)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Filter Coffee</h5><p>₹40</p><button class="btn btn-success" onclick="addToCart('Filter Coffee',40)">Add to Cart</button></div>
    `;
}
else if (restaurant === "Meghana Foods") {

    menuContainer.innerHTML = `
    <div class="card p-3 mt-3"><h5>Chicken Biryani</h5><p>₹320</p><button class="btn btn-success" onclick="addToCart('Chicken Biryani',320)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Mutton Biryani</h5><p>₹380</p><button class="btn btn-success" onclick="addToCart('Mutton Biryani',380)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Paneer Biryani</h5><p>₹260</p><button class="btn btn-success" onclick="addToCart('Paneer Biryani',260)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Chicken Kebab</h5><p>₹240</p><button class="btn btn-success" onclick="addToCart('Chicken Kebab',240)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Butter Naan</h5><p>₹60</p><button class="btn btn-success" onclick="addToCart('Butter Naan',60)">Add to Cart</button></div>
    `;
}
else if (restaurant === "Top N Town Ice Cream") {

    menuContainer.innerHTML = `
    <div class="card p-3 mt-3"><h5>Chocolate Ice Cream</h5><p>₹80</p><button class="btn btn-success" onclick="addToCart('Chocolate Ice Cream',80)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Vanilla Ice Cream</h5><p>₹70</p><button class="btn btn-success" onclick="addToCart('Vanilla Ice Cream',70)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Black Current</h5><p>₹90</p><button class="btn btn-success" onclick="addToCart('Black Current',90)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Mango Shake</h5><p>₹110</p><button class="btn btn-success" onclick="addToCart('Mango Shake',110)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Brownie Sundae</h5><p>₹160</p><button class="btn btn-success" onclick="addToCart('Brownie Sundae',160)">Add to Cart</button></div>
    `;
}
else if (restaurant === "Pizza Hut") {

    menuContainer.innerHTML = `
    <div class="card p-3 mt-3"><h5>Margherita Pizza</h5><p>₹249</p><button class="btn btn-success" onclick="addToCart('Margherita Pizza',249)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Farmhouse Pizza</h5><p>₹349</p><button class="btn btn-success" onclick="addToCart('Farmhouse Pizza',349)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Veg Supreme Pizza</h5><p>₹399</p><button class="btn btn-success" onclick="addToCart('Veg Supreme Pizza',399)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Garlic Bread</h5><p>₹149</p><button class="btn btn-success" onclick="addToCart('Garlic Bread',149)">Add to Cart</button></div>

    <div class="card p-3 mt-3"><h5>Choco Lava Cake</h5><p>₹99</p><button class="btn btn-success" onclick="addToCart('Choco Lava Cake',99)">Add to Cart</button></div>
    `;
}
else if (restaurant === "KFC") {

    menuContainer.innerHTML = `
    <div class="card p-3 mt-3">
        <h5>Hot & Crispy Chicken (2 pcs)</h5>
        <p>₹249</p>
        <button class="btn btn-success"
        onclick="addToCart('Hot & Crispy Chicken',249)">
        Add to Cart
        </button>
    </div>

    <div class="card p-3 mt-3">
        <h5>Chicken Bucket (6 pcs)</h5>
        <p>₹599</p>
        <button class="btn btn-success"
        onclick="addToCart('Chicken Bucket',599)">
        Add to Cart
        </button>
    </div>

    <div class="card p-3 mt-3">
        <h5>Zinger Burger</h5>
        <p>₹199</p>
        <button class="btn btn-success"
        onclick="addToCart('Zinger Burger',199)">
        Add to Cart
        </button>
    </div>

    <div class="card p-3 mt-3">
        <h5>French Fries</h5>
        <p>₹119</p>
        <button class="btn btn-success"
        onclick="addToCart('French Fries',119)">
        Add to Cart
        </button>
    </div>

    <div class="card p-3 mt-3">
        <h5>Pepsi</h5>
        <p>₹60</p>
        <button class="btn btn-success"
        onclick="addToCart('Pepsi',60)">
        Add to Cart
        </button>
    </div>
    `;
}

		function addToCart(name, price) {
		    console.log("Adding:", name, price);

		    let form = document.createElement("form");
		    form.method = "POST";
		    form.action = "CartServlet";

		    let nameInput = document.createElement("input");
		    nameInput.name = "itemName";
		    nameInput.value = name;

		    let priceInput = document.createElement("input");
		    priceInput.name = "itemPrice";
		    priceInput.value = price;

		    let qtyInput = document.createElement("input");
		    qtyInput.name = "quantity";
		    qtyInput.value = 1;

		    form.appendChild(nameInput);
		    form.appendChild(priceInput);
		    form.appendChild(qtyInput);

		    document.body.appendChild(form);
		    form.submit();
		}
</script>

</body>
</html>