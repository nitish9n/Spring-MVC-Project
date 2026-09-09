<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
</head>
<body>
	<h1>Welcome. You can login as Admin.....</h1>
	<h3>Password: ${savedUser.username}</h3>
	<h3>Email: ${savedUser.email}</h3>
	<h3>Age: ${savedUser.age}</h3>
	<h3>Gender: ${savedUser.gender}</h3>
	<h3>Address: ${savedUser.address}</h3>
</body>
</html>