<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Sign in</title>
</head>
<style>
body {
	background-image: url("res/logn.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 112%;
}

.body-content {
	padding-top: 15vh;
	padding-left:2.3%;
}

.container {
	background: #2968c2;
	width: 350px;
	height: 452px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: auto;
	border: 1px;
	border-radius: 15px;
	opacity: 0.92;
}

.logo {
	margin-top: 0px;
	padding-top: 0;
}

.logo img {
	width: 100px;
	border-radius: 50px;
}

h2 {
	color: black;
	font-family: Arial, Helvetica, sans-serif;
}

form {
	display: flex;
	flex-direction: column;
}

.form-item {
	margin: 5px;
	padding-bottom: 10px;
	display: flex;
}

.form-item label {
	display: block;
	padding: 2px;
	font-size: 20px;
	width: 100px;
}

.form-item input {
	width: 320px;
	height: 35px;
	border: 2px solid #e1dede69;
	border-radius: 20px;
	background: white;
	color: black;
	text-align: center;
}

.remember-box {
	margin: auto;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 15px;
	color: black;
}

.remember-box a {
	text-decoration: none;
	color: black;
	margin-left: 30px;
}

.remember-box a:hover {
	color: grey;
}

.form-btns {
	display: flex;
	flex-direction: column;
	margin: auto;
	padding: 10px 0;
}

.form-btns button {
	margin: auto;
	font-size: 20px;
	padding: 5px 15px;
	border: 0;
	border-radius: 15px;
	color: rgb(75, 61, 61);
	background: #e0e2ee;
	width: 280px;
	cursor: pointer;
}

.form-btns button:hover {
	background: grey;
	color: antiquewhite;
}

.options {
	padding-top: 15px;
	margin: auto;
	text-align: center;
}

.options a {
	text-decoration: none;
	color: black;
	margin: 0 40px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 15px;
}

.options a:hover {
	color: grey;
}

p {
	text-align: center;
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif;
	color: black;
}
</style>
<body>
	<div class="body-content">
		<div class="container">
			<div class="logo">
				<img src="res/1.png" alt="company logo">
			</div>
			<h2>User Login</h2>
			<div class="login-form">
				<form action="LoginServlet" method="post">
					<div class="form-item">
						<input type="text" name="uid" id="User ID" placeholder="User ID"
							required>
					</div>
					<div class="form-item">
						<input type="password" name="pass" id="passWord"
							placeholder="Password" required>
					</div>
					<div class="form-btns">
						<button type="submit">Login</button>
						<div class="options">
							<a href="signup.jsp">Sign Up</a> <a href="adminlogin.jsp">Admin
								Login</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>