<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tastyyy | Login</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }

    .container {
        width: 380px;
        margin: 100px auto;
        background: white;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        color: #ff5722;
    }

    input {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    button {
        width: 100%;
        padding: 10px;
        background-color: #ff5722;
        border: none;
        color: white;
        font-size: 16px;
        cursor: pointer;
        border-radius: 4px;
    }

    button:hover {
        background-color: #e64a19;
    }

    .register-link {
        text-align: center;
        margin-top: 15px;
    }

    .register-link a {
        color: #ff5722;
        text-decoration: none;
    }

    .error {
        color: red;
        text-align: center;
        margin-bottom: 10px;
    }
</style>
</head>

<body>

<div class="container">
    <h2>Login</h2>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <p class="error"><%= error %></p>
    <%
        }
    %>

    <form action="Loginservlet" method="post">

        <input type="email" name="email" placeholder="Email Address" required />

        <input type="password" name="password" placeholder="Password" required />

        <button type="submit">Login</button>
    </form>

    <div class="register-link">
       		 New to Tastyyy?
        <a href="register.jsp">Create an account</a>
    </div>
</div>

</body>
</html>
