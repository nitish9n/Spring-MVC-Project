<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Import the Spring Form tag library -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f9; padding: 20px; }
        .form-container { 
            max-width: 450px; margin: 0 auto; background: #fff; 
            padding: 25px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); 
        }
        h2 { text-align: center; color: #333; }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; margin-bottom: 5px; color: #555; }
        input[type="text"], input[type="password"], input[type="email"], input[type="number"], textarea {
            width: 100%; padding: 10px; box-sizing: border-box; 
            border: 1px solid #ccc; border-radius: 4px;
        }
        .radio-group { display: flex; gap: 15px; align-items: center; padding-top: 5px; }
        button { 
            width: 100%; padding: 10px; background-color: #0056b3; 
            color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; 
        }
        button:hover { background-color: #004494; }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Create an Account</h2>

    <!-- The 'modelAttribute' must match the object name added to the model in your Controller -->
    <form:form action="${pageContext.request.contextPath}/processSignup" method="post" modelAttribute="user">
        
        <div class="form-group">
            <label for="username">Username</label>
            <form:input path="username" id="username" required="required" placeholder="Enter your username" />
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <form:password path="password" id="password" required="required" placeholder="Enter a strong password" />
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <form:input path="email" type="email" id="email" required="required" placeholder="example@email.com" />
        </div>

        <div class="form-group">
            <label for="age">Age</label>
            <form:input path="age" type="number" id="age" min="1" max="120" required="required" />
        </div>

        <div class="form-group">
            <label>Gender</label>
            <div class="radio-group">
                <form:radiobutton path="gender" value="Male" label="Male" />
                <form:radiobutton path="gender" value="Female" label="Female" />
                <form:radiobutton path="gender" value="Other" label="Other" />
            </div>
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <form:textarea path="address" id="address" rows="3" required="required" placeholder="Enter your full address" />
        </div>

        <button type="submit">Sign Up</button>

    </form:form>
</div>

</body>
</html>