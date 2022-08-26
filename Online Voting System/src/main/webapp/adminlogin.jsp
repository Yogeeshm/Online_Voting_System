<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin login</title>
</head>
<style>
body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 10px;
	background-image: url("res/ad.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
}
.body-content {
	padding-top: 1px;
}

.container {
	width: 350px;
	height: 452px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: auto;
	border: 1px;
	border-radius: 15px;
	background: silver;
	opacity: 0.9;
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
				<img src="res/1.png" alt="Company Logo">
			</div>
			<h2>Admin Login</h2>
			<div class="login-form">
				<form action="AdminLoginServlet" method="post">
					<div class="form-item">
						<input type="text" name="uid" id="User ID" placeholder="Admin ID">
					</div>
					<div class="form-item">
						<input type="password" name="pass" id="passWord"
							placeholder="Password">
					</div>
					<div class="form-btns">
						<button type="submit">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>