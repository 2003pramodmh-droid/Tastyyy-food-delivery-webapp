package com.tap.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.tap.DAO.MenuItemDAO;
import com.tap.DAOimpl.MenuItemDAOImpl;
import com.tap.model.MenuItem;

@WebServlet("/Menuitemservlet")
public class Menuitemservlet extends HttpServlet {
	
	 private MenuItemDAO menuDAO;

	    @Override
	    public void init() {
	        menuDAO = new MenuItemDAOImpl();
	    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		  int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));

	        List<MenuItem> menuList = menuDAO.getMenuByRestaurantId(restaurantId);

	        req.setAttribute("menuList", menuList);
	        req.getRequestDispatcher("menu.jsp").forward(req, resp);
		
	}

}
