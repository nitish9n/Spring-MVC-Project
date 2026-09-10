<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<script>
    alert("Login UnSuccessful! Try again.");
</script>
</head>
<body>
	<h1>SORRY! Your login credential is wrong</h1>
	
	<form action="${pageContext.request.contextPath}/login" method="get">
	<input type="submit" value="Login">
	</form>
</body>
</html>