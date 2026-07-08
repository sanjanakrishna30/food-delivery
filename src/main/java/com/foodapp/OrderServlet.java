package com.foodapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.HashMap;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
        HashMap<String, Double> prices = (HashMap<String, Double>) session.getAttribute("prices");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("viewCart.jsp");
            return;
        }

        // 1. Combine the items into a single string for your database row
        StringBuilder itemsSummary = new StringBuilder();
        double grandTotal = 0;
        
        for (String itemName : cart.keySet()) {
            int qty = cart.get(itemName);
            double price = prices.get(itemName);
            itemsSummary.append(itemName).append(" (x").append(qty).append("), ");
            grandTotal += (qty * price);
        }
        
        String finalItemsList = itemsSummary.substring(0, itemsSummary.length() - 2);

        // 2. Database Connection matching your MySQL Workbench exactly
        String dbUrl = "jdbc:mysql://localhost:3306/bitebuddy_db"; 
        String dbUser = "root";
        String dbPassword = "root@123"; // 🛑 TYPE YOUR ACTUAL MYSQL PASSWORD HERE!

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword)) {
                
                // Matches your exact columns from MySQL Workbench: restaurant_name and amount
                String sql = "INSERT INTO orders (restaurant_name, amount) VALUES (?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, finalItemsList);
                    stmt.setDouble(2, grandTotal);
                    stmt.executeUpdate();
                }
            }
            
            // 3. Clear out the cart basket since order is placed!
            session.removeAttribute("cart");
            session.removeAttribute("prices");
            
            // Go to your gorgeous success screen
            response.sendRedirect("orderSuccess.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database Error: " + e.getMessage());
        }
    }
}