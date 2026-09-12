<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/utils.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mobile.css">

<title>iBlog - Login</title>
</head>

<body>

	<nav class="navigation max-width-1 m-auto">

		<div class="nav-left">

			<a href="${pageContext.request.contextPath}/"> <span> <img
					src="${pageContext.request.contextPath}/img/logo.png" width="94px"
					alt="iBlog">
			</span>
			</a>

			<ul>
				<li><a href="${pageContext.request.contextPath}/">Home</a></li>

				<li><a href="${pageContext.request.contextPath}/about">About</a>
				</li>

				<li><a href="${pageContext.request.contextPath}/contact">Contact</a>
				</li>
			</ul>

		</div>

	</nav>

	<div class="max-width-1 m-auto">
		<hr>
	</div>


	<div class="contact-content font1 max-width-1 m-auto my-2">

		<h2>Login to iBlog</h2>

		<form action="${pageContext.request.contextPath}/processLogin"
			method="post">

			<div class="form-box">

				<input class="form-input" type="text" name="username"
					placeholder="Enter Username" required>

			</div>

			<div class="form-box">

				<input class="form-input" type="password" name="password"
					placeholder="Enter Password" required>

			</div>

			<div class="form-box">

				<button class="btn" type="submit">Login</button>

			</div>

		</form>

		<p>
			Don't have an account? <a
				href="${pageContext.request.contextPath}/signup"> Sign Up </a>
		</p>

	</div>


	<div class="footer">
		<p>Copyright &copy; iBlog.com</p>
	</div>

</body>

</html>