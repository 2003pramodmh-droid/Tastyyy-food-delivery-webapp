package com.tap.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tap.DBconnectivity;

@WebServlet("/Registerservlet")
public class Registerservlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
// here i got all the details from register.jsp file 
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String password=req.getParameter("password");
		String confirmPassword=req.getParameter("confirmPassword");
		
// now lets check the password and confirm password is same or not
		
		if (!password.equals(confirmPassword)) {
	         req.setAttribute("error", "Passwords do not match");
	         req.getRequestDispatcher("register.jsp").forward(req, resp);
	         return;
	    }
		
//get Database connections
		
		 try (Connection con = DBconnectivity.getConnection()) {
			 
		 
//check if email already exists
			 
	        String qurey="select email from users where email=?";
	        PreparedStatement pstmt=con.prepareStatement(qurey);
	        ResultSet rs=pstmt.executeQuery();
	            if (rs.next()) {
	                req.setAttribute("error", "Email already registered");
	                req.getRequestDispatcher("register.jsp").forward(req, resp);
	                return;
	                }
	            
//insert user into Database 
	            String insertUser =
	                    "INSERT INTO users (name, email, phone, password) VALUES (?, ?, ?, ?)";
	            PreparedStatement pstmt1 = con.prepareStatement(insertUser);

	            pstmt1.setString(1, name);
	            pstmt1.setString(2, email);
	            pstmt1.setString(3, phone);
	            pstmt1.setString(4, password); // hashing later

	            pstmt1.executeUpdate();

 //redirect to login.jsp page
	            resp.sendRedirect("login.jsp");
	            
		 } catch (SQLException e) {
			
			 e.printStackTrace();
	            req.setAttribute("error", "Something went wrong. Try again.");
	            req.getRequestDispatcher("register.jsp").forward(req, resp);
		}
		
	}

}
