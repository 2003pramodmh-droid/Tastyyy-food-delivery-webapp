package com.tap.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tap.*;


@WebServlet("/Loginservlet")
public class Loginservlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//get inputs from login.jsp
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
//connect with database for validation
        try(Connection con=DBconnectivity.getConnection()){
        	
//check email + password in database
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet res = pstmt.executeQuery();

            if (res.next()) {
               
            	//login successful
                //create session and store user info
                
            	HttpSession session = req.getSession();
                session.setAttribute("userId", res.getInt("id"));
                session.setAttribute("userName", res.getString("name"));
                session.setAttribute("userEmail", res.getString("email"));

                //redirect to restaurants.jsp page
                resp.sendRedirect("restaurants.jsp");

            }
            else {
                //login failed
                req.setAttribute("error", "Incorrect email or password. Please try again.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        	
        } catch (SQLException e) {
			// TODO Auto-generated catch block
        	  e.printStackTrace();
              req.setAttribute("error", "Something went wrong. Try again later.");
              req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		
		
	}

}
