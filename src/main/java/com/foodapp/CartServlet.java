package com.foodapp; // <-- Make sure this matches your actual package name!

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");
            System.out.println("DEBUG: Servlet WAS CALLED! Action is: " + action);

            if ("update".equals(action)) {
                String itemName = request.getParameter("itemName");
                String changeStr = request.getParameter("change");
                
                if (itemName != null && changeStr != null) {
                    int change = Integer.parseInt(changeStr);
                    HttpSession session = request.getSession();
                    HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");

                    if (cart != null && cart.containsKey(itemName)) {
                        int newQty = cart.get(itemName) + change;
                        if (newQty <= 0) {
                            cart.remove(itemName);
                        } else {
                            cart.put(itemName, newQty);
                        }
                        session.setAttribute("cart", cart); // CRITICAL: Save the update
                    }
                }
            }
            response.sendRedirect("viewCart.jsp");
        }
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            String itemName = request.getParameter("itemName");
            String itemPrice = request.getParameter("itemPrice");
            String quantity = request.getParameter("quantity");
            
            System.out.println("DEBUG itemName = " + itemName);
            System.out.println("DEBUG itemPrice = " + itemPrice);
            System.out.println("DEBUG quantity = " + quantity);
            

            HttpSession session = request.getSession();

            HashMap<String, Integer> cart =
                    (HashMap<String, Integer>) session.getAttribute("cart");

            HashMap<String, Double> prices =
                    (HashMap<String, Double>) session.getAttribute("prices");

            if (cart == null) {
                cart = new HashMap<>();
            }

            if (prices == null) {
                prices = new HashMap<>();
            }

            if (cart.containsKey(itemName)) {
                cart.put(itemName, cart.get(itemName) + 1);
            } else {
                cart.put(itemName, 1);
            }
            System.out.println("Item Name = [" + itemName + "]");
            System.out.println("Item Price = [" + itemPrice + "]");
            System.out.println("Parameter itemPrice = " + request.getParameter("itemPrice"));
            if (itemPrice != null && !itemPrice.isEmpty()) {
                prices.put(itemName, Double.parseDouble(itemPrice));
            } else {
                System.out.println("ERROR: itemPrice is EMPTY");
            }

            session.setAttribute("cart", cart);
            session.setAttribute("prices", prices);

            response.sendRedirect("viewCart.jsp");
        }
        
        
        // Bounce the user right back to refresh your basket viewport layout page
        // Note: Change "basket.jsp" below if your actual file name is "cart.jsp"
        
    }
