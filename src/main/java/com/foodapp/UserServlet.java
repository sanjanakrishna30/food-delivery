package com.foodapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userAction")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private String dbUrl = "jdbc:mysql://localhost:3306/bitebuddy_db"; 
    private String dbUser = "root";
    private String dbPassword = "root@123";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String action = request.getParameter("action");
        
        // ==================== 1. REGISTRATION LOGIC ====================
        if ("register".equals(action)) {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            try {
            	String dbUrl = "jdbc:mysql://localhost:3306/bitebuddy_db";
                String dbUser = "root";
                String dbPassword = "root@123"; 
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                
                String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, username);
                statement.setString(2, email);
                statement.setString(3, password);
                
                int rowsInserted = statement.executeUpdate();
                statement.close();
                conn.close();
                
                if (rowsInserted > 0) {
                	response.sendRedirect("login.html");
                                
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3>Error during registration: " + e.getMessage() + "</h3>");
            }
        }
        
        // ==================== 2. LOGIN LOGIC (NEW) ====================
        else if ("login".equals(action)) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                
                // Query to look up the user by email and password
                String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, email);
                statement.setString(2, password);
                
                ResultSet result = statement.executeQuery();
                
                if (result.next()) {
                    // User found! Create a secure session tracker
                    HttpSession session = request.getSession();
                    session.setAttribute("userEmail", result.getString("email"));
                    session.setAttribute("userName", result.getString("username"));
                    
                    // Route them directly onto your main food store dashboard!
                    response.sendRedirect("restaurants.html");
                } else {
                    // Invalid credentials popup
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Invalid email or password! Try again.');");
                    out.println("window.location.href = 'login.html';");
                    out.println("</script>");
                }
                conn.close();
                
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3>Error during login: " + e.getMessage() + "</h3>");
            }
        }
    }
}