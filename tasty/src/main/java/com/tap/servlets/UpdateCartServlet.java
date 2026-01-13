package com.tap.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;

import com.tap.model.CartItem;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

 protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

    HttpSession session = req.getSession();
    Map<Integer, CartItem> cart =
        (Map<Integer, CartItem>) session.getAttribute("cart");

    int id = Integer.parseInt(req.getParameter("id"));
    String action = req.getParameter("action");

    CartItem item = cart.get(id);

    if ("inc".equals(action)) {
        item.setQuantity(item.getQuantity() + 1);
    } else {
        item.setQuantity(item.getQuantity() - 1);
        if (item.getQuantity() == 0) {
            cart.remove(id);
        }
    }

    session.setAttribute("cart", cart);
    resp.sendRedirect("cart.jsp");
 }
}
