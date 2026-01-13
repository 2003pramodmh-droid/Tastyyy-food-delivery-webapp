<%
    // Clear cart after order placed
    session.removeAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>

<style>
    body {
        font-family: Arial;
        background: #f5f5f5;
        padding: 50px;
        text-align: center;
    }

    .success-box {
        max-width: 450px;
        margin: auto;
        background: white;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    h2 {
        color: #2e7d32;
        margin-bottom: 20px;
    }

    a {
        display: inline-block;
        margin-top: 25px;
        padding: 12px 30px;
        background: #FC8019;
        color: white;
        text-decoration: none;
        font-size: 16px;
        border-radius: 8px;
    }

    a:hover {
        background: #e96f12;
    }
</style>
</head>

<body>

<div class="success-box">
    <h2>Order Placed Successfully!</h2>
    <p>Your food will be delivered soon.</p>

    <a href="home.jsp">Go to Home</a>
</div>

</body>
</html>
