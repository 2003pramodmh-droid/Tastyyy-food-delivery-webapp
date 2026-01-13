package com.tap.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.tap.model.CartItem;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

 protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

    HttpSession session = req.getSession();

    Map<Integer, CartItem> cart =
        (Map<Integer, CartItem>) session.getAttribute("cart");

    if (cart == null) {
        cart = new HashMap<>();
    }

    int itemId = Integer.parseInt(req.getParameter("itemId"));

    if (cart.containsKey(itemId)) {
        CartItem item = cart.get(itemId);
        item.setQuantity(item.getQuantity() + 1);
    } else {
        CartItem item = new CartItem();
        item.setItemId(itemId);
        item.setName(req.getParameter("name"));
        item.setPrice(Double.parseDouble(req.getParameter("price")));
        item.setImage(req.getParameter("image"));
        item.setQuantity(1);

        cart.put(itemId, item);
    }

    session.setAttribute("cart", cart);


    //redirect back to SAME menu page
    int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
    resp.sendRedirect("menu?restaurantId=" + restaurantId);
 }
}
