<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tastyyy | Register</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }

    .container {
        width: 400px;
        margin: 80px auto;
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
        margin: 8px 0;
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

    .login-link {
        text-align: center;
        margin-top: 15px;
    }

    .login-link a {
        color: #ff5722;
        text-decoration: none;
    }

    .error {
        color: red;
        text-align: center;
    }
</style>
</head>

<body>

<div class="container">
    <h2>Create Account</h2>

    <!-- Error message from servlet (if any) -->
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <p class="error"><%= error %></p>
    <%
        }
    %>

    <form action="Registerservlet" method="post">

        <input type="text" name="name" placeholder="Full Name" required />

        <input type="email" name="email" placeholder="Email Address" required />

        <input type="text" name="phone" placeholder="Phone Number" required />

        <input type="password" name="password" placeholder="Create Password" required />

        <input type="text" name="confirmPassword" placeholder="Confirm Password" required />

        <button type="submit">Register</button>
    </form>

    <div class="login-link">
        Already have an account?
        <a href="login.jsp">Login</a>
    </div>
</div>

</body>
</html>
