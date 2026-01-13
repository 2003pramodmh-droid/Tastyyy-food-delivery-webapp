<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>

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
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: sticky;
        top: 0;
        z-index: 100;
    }

    .header h2 {
        margin: 0;
        font-size: 22px;
    }

    .cart-link {
        color: white;
        text-decoration: none;
        font-weight: bold;
        background: rgba(255,255,255,0.2);
        padding: 8px 15px;
        border-radius: 20px;
    }

    /* ===== MENU GRID ===== */
    .menu-container {
        padding: 30px;
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 25px;
    }

    /* ===== CARD ===== */
    .card {
        background: white;
        border-radius: 16px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        overflow: hidden;
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    }

    .card img {
        width: 100%;
        height: 160px;
        object-fit: cover;
    }

    .card-content {
        padding: 15px;
        text-align: center;
    }

    .item-name {
        font-size: 18px;
        font-weight: 600;
        margin-bottom: 8px;
    }

    .price {
        font-size: 16px;
        color: #2e7d32;
        margin-bottom: 12px;
    }

    .add-btn {
        width: 100%;
        background: #FC8019;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 10px;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
    }

    .add-btn:hover {
        background: #e96f12;
    }

    .msg {
        text-align: center;
        color: green;
        font-weight: bold;
        margin-top: 15px;
    }
</style>
</head>

<body>

<%
int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

Map<Integer, CartItem> cart =
    (Map<Integer, CartItem>) session.getAttribute("cart");

int count = 0;
if (cart != null) {
    for (CartItem c : cart.values()) {
        count += c.getQuantity();
    }
}
%>

<!-- ===== HEADER ===== -->
<div class="header">
    <h2>Menu</h2>
    <a class="cart-link" href="cart.jsp">Cart (<%= count %>)</a>
</div>

<!-- ===== MENU ===== -->
<div class="menu-container">
<%
    List<MenuItem> menuList = (List<MenuItem>) request.getAttribute("menuList");
    for (MenuItem item : menuList) {
%>
    <div class="card">
        <img src="<%= item.getImage() %>" alt="<%= item.getItemName() %>">

        <div class="card-content">
            <div class="item-name"><%= item.getItemName() %></div>
            <div class="price">Rs.<%= item.getPrice() %></div>

            <form action="addToCart" method="post">
                <input type="hidden" name="itemId" value="<%= item.getId() %>">
                <input type="hidden" name="name" value="<%= item.getItemName() %>">
                <input type="hidden" name="price" value="<%= item.getPrice() %>">
                <input type="hidden" name="image" value="<%= item.getImage() %>">
                <input type="hidden" name="restaurantId" value="<%= restaurantId %>">

                <button class="add-btn" type="submit">ADD TO CART</button>
            </form>
        </div>
    </div>
<%
    }
%>
</div>

<%
String msg = (String) session.getAttribute("msg");
if (msg != null) {
%>
    <div class="msg"><%= msg %></div>
<%
    session.removeAttribute("msg");
}
%>

</body>
</html>
