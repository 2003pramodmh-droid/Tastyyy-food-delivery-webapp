<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>

<style>
    body {
        margin: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: #f5f5f5;
    }

    /* ===== HEADER ===== */
    .header {
        background: #FC8019;
        color: white;
        padding: 15px 30px;
        font-size: 22px;
        font-weight: bold;
        position: sticky;
        top: 0;
        z-index: 100;
    }

    /* ===== CART CONTAINER ===== */
    .cart-container {
        max-width: 900px;
        margin: 30px auto;
        padding: 0 20px;
    }

    /* ===== CART CARD ===== */
    .card {
        display: flex;
        align-items: center;
        background: white;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        padding: 15px;
        margin-bottom: 20px;
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .card:hover {
        transform: translateY(-4px);
        box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    }

    .card img {
        width: 120px;
        height: 100px;
        object-fit: cover;
        border-radius: 10px;
        margin-right: 20px;
    }

    .item-details {
        flex: 1;
    }

    .item-details h3 {
        margin: 0 0 6px;
        font-size: 18px;
    }

    .item-details p {
        margin: 0;
        font-size: 16px;
        color: #2e7d32;
        font-weight: bold;
    }

    /* ===== QUANTITY CONTROLS ===== */
    .qty-controls {
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .qty-controls a {
        text-decoration: none;
        background: #FC8019;
        color: white;
        font-size: 18px;
        font-weight: bold;
        width: 36px;
        height: 36px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        transition: background 0.2s;
    }

    .qty-controls a:hover {
        background: #e96f12;
    }

    .qty-controls span {
        font-size: 16px;
        font-weight: bold;
        min-width: 20px;
        text-align: center;
    }

    /* ===== CART ACTIONS ===== */
    .cart-actions {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 30px;
        gap: 20px;
    }

    .cart-actions a {
        flex: 1;
        text-align: center;
        padding: 14px 20px;
        border-radius: 30px;
        font-size: 16px;
        font-weight: bold;
        text-decoration: none;
        transition: all 0.25s ease;
    }

    .add-more {
        background: white;
        color: #FC8019;
        border: 2px solid #FC8019;
    }

    .add-more:hover {
        background: #FC8019;
        color: white;
        transform: translateY(-2px);
    }

    .place-order {
        background: #FC8019;
        color: white;
        box-shadow: 0 8px 20px rgba(252, 128, 25, 0.4);
    }

    .place-order:hover {
        background: #e96f12;
        transform: translateY(-2px);
        box-shadow: 0 12px 25px rgba(252, 128, 25, 0.5);
    }

    /* ===== TOTAL AMOUNT ===== */
    .total-box {
        background: white;
        border-radius: 15px;
        padding: 20px 25px;
        margin-top: 10px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 20px;
        font-weight: bold;
    }

    .total-box span {
        color: #555;
    }

    .total-box strong {
        color: #2e7d32;
        font-size: 22px;
    }

    /* ===== EMPTY CART ===== */
    .empty-cart {
        text-align: center;
        background: white;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        font-size: 18px;
        color: #777;
    }
</style>
</head>

<body>

<div class="header">Your Cart</div>

<div class="cart-container">
<%
Map<Integer, CartItem> cart =
    (Map<Integer, CartItem>) session.getAttribute("cart");

if (cart != null && !cart.isEmpty()) {

    double totalAmount = 0;

    for (CartItem item : cart.values()) {
        totalAmount += item.getPrice() * item.getQuantity();
%>

    <div class="card">
        <img src="<%= item.getImage() %>" alt="<%= item.getName() %>">

        <div class="item-details">
            <h3><%= item.getName() %></h3>
            <p>Rs.<%= item.getPrice() %></p>
        </div>

        <div class="qty-controls">
            <a href="updateCart?action=dec&id=<%= item.getItemId() %>">−</a>
            <span><%= item.getQuantity() %></span>
            <a href="updateCart?action=inc&id=<%= item.getItemId() %>">+</a>
        </div>
    </div>

<%
    }
%>

    <!-- Total Amount -->
    <div class="total-box">
        <span>Total Amount</span>
        <strong>Rs. <%= totalAmount %></strong>
    </div>

    <!-- Cart Actions -->
    <div class="cart-actions">
        <a href="restaurants.jsp" class="add-more">Add More Items</a>
        <a href="placeorder.jsp" class="place-order">Place Order</a>
    </div>

<%
} else {
%>

    <div class="empty-cart">
        Your cart is empty  
        <br><br>
        Add items from the menu to see them here
    </div>

<%
}
%>
</div>

</body>
</html>
