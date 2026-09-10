<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
	<script>
    alert("SignUp Successful! Now, you can login.");
</script>
</head>
<body>
	<h1>Welcome. You can login as Admin.....</h1>
	<h3>Email: ${savedUser.email}</h3>
	<h3>Age: ${savedUser.age}</h3>
	<h3>Gender: ${savedUser.gender}</h3>
	<h3>Address: ${savedUser.address}</h3>
	
    <form action="${pageContext.request.contextPath}/login" method="get">
	<input type="submit" value="Login">
	</form>
</body>
</html>