
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    .login-container {
        width: 350px;
        margin: 100px auto;
        padding: 30px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0px 0px 10px gray;
    }

    h2 {
        text-align: center;
    }

    input {
        width: 100%;
        padding: 10px;
        margin: 8px 0 15px 0;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>

</head>

<body>

<div class="login-container">

    <h2>Login</h2>

    <form action="${pageContext.request.contextPath}/login" method="post">

        <label>Username:</label>
        <input type="text" name="username" placeholder="Enter username" required>

        <label>Password:</label>
        <input type="password" name="password" placeholder="Enter password" required>

        <input type="submit" value="Login">

    </form>

</div>

</body>
</html>


