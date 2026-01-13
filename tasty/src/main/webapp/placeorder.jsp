<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delivery Details</title>

<style>
    body {
        font-family: Arial;
        background: #f5f5f5;
        padding: 50px;
    }

    .box {
        max-width: 400px;
        margin: auto;
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    h2 {
        margin-bottom: 20px;
        text-align: center;
    }

    textarea {
        width: 100%;
        height: 100px;
        padding: 10px;
        border-radius: 8px;
        border: 1px solid #ccc;
        resize: none;
        font-size: 14px;
    }

    button {
        width: 100%;
        margin-top: 20px;
        padding: 12px;
        background: #FC8019;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
    }

    button:hover {
        background: #e96f12;
    }
</style>
</head>

<body>

<div class="box">
    <h2>Delivery Location</h2>

    <form action="ordersuccess.jsp" method="post">
        <textarea name="address" placeholder="Enter delivery address" required></textarea>
        <button type="submit">Submit Order</button>
    </form>
</div>

</body>
</html>
