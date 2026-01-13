<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.tap.DAO.*" %>
<%@ page import="com.tap.DAOimpl.*" %>
<%@ page import="com.tap.model.*" %>

<%
    // Session check
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    RestaurantDAO dao = new RestaurantDAOImpl();
    List<Restaurant> restaurants = dao.getAllRestaurants();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurants</title>

<style>
    body {
        margin: 0;
        padding: 0;
        background-color: #FC8019;
        font-family: 'Segoe UI', sans-serif;
    }

    .container {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 30px;
        padding: 40px;
    }

    .card {
        width: 320px;
        border-radius: 20px;
        background-color: white;
        box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        overflow: hidden;
        transition: transform 0.3s;
        text-align: center;
    }

    .card:hover {
        transform: scale(1.05);
    }

    .card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

    .card-content {
        padding: 15px;
    }

    .restaurant-name {
        font-size: 20px;
        font-weight: bold;
        color: #333;
        text-decoration: none;
    }

    .restaurant-name:hover {
        color: #FC8019;
        text-decoration: underline;
    }
</style>
</head>

<body>

<div class="container">

<% for (Restaurant r : restaurants) { %>

    <div class="card">
        <img src="<%= r.getImage() %>" alt="<%= r.getName() %>">
        <div class="card-content">
            <a class="restaurant-name"
               href="Menuitemservlet?restaurantId=<%= r.getId() %>">
                <%= r.getName() %>
            </a>
        </div>
    </div>

<% } %>

</div>

</body>
</html>
