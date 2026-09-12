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

<title>iBlog - Sign Up</title>
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

		<h2>Create Your iBlog Account</h2>

		<form action="${pageContext.request.contextPath}/processSignup"
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

				<input class="form-input" type="email" name="email"
					placeholder="Enter Email" required>

			</div>

			<div class="form-box">

				<input class="form-input" type="number" name="age"
					placeholder="Enter Age" min="1">

			</div>

			<div class="form-box">

				<select class="form-input" name="gender">

					<option value="">Select Gender</option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
					<option value="Other">Other</option>

				</select>

			</div>

			<div class="form-box">

				<textarea class="form-input" name="address"
					placeholder="Enter Address" rows="4"></textarea>

			</div>

			<div class="form-box">

				<button class="btn" type="submit">Sign Up</button>

			</div>

		</form>

		<p>
			Already have an account? <a
				href="${pageContext.request.contextPath}/login"> Login </a>
		</p>

	</div>


	<div class="footer">
		<p>Copyright &copy; iBlog.com</p>
	</div>

</body>

</html>
l>
