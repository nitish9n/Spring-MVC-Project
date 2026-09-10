<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>

</head>
<body>
	<h1>Welcome ${savedUser.username}. You can explore your account.....</h1>
	<h3>Username: ${savedUser.username}</h3>
	<h3>Password: ${savedUser.password}</h3>
	<h3>Email: ${savedUser.email}</h3>
	<h3>Age: ${savedUser.age}</h3>
	<h3>Gender: ${savedUser.gender}</h3>
	<h3>Address: ${savedUser.address}</h3>
</body>
</html>