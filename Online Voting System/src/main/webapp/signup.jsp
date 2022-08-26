<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
</head>
<style>
body {
	background-image: url("res/reg.jpg");
	background-size: 100% 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	display: flex;
	padding: 10px;
}

@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

.options {
	padding-top: 15px;
	margin: auto;
	text-align: center;
}

.container {
	max-width: 700px;
	width: 100%;
	background-color: silver;
	padding: 25px 30px;
	border-radius: 5px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
	opacity: 0.93;
}

.container .title {
	font-size: 25px;
	font-weight: 500;
	position: relative;
	text-align:center;
}

/*.container .title::before {
	content: "";
	position: absolute;
	left: 0;
	bottom: 0;
	height: 3px;
	width: 30px;
	border-radius: 5px;
	background: linear-gradient(135deg, #1b4d89, #9b59b6);
}*/

.content form .user-details {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	margin: 20px 0 12px 0;
}

form .user-details .input-box {
	margin-bottom: 15px;
	width: calc(100%/ 2 - 20px);
}

form .input-box span.details {
	display: block;
	font-weight: 500;
	margin-bottom: 5px;
}

.user-details .input-box input {
	height: 45px;
	width: 100%;
	outline: none;
	font-size: 16px;
	border-radius: 5px;
	padding-left: 15px;
	border: 1px solid #fff;
	border-bottom-width: 2px;
	transition: all 0.3s ease;
}

.user-details .input-box input:focus, .user-details .input-box input:valid
	{
	border-color: #9b59b6;
}

form .gender-details .gender-title {
	font-size: 20px;
	font-weight: 500;
}

form .category {
	display: flex;
	width: 80%;
	margin: 14px 0;
	justify-content: space-between;
}

form .category label {
	display: flex;
	align-items: center;
	cursor: pointer;
}

form .category label .dot {
	height: 18px;
	width: 18px;
	border-radius: 50%;
	margin-right: 10px;
	background: #d9d9d9;
	border: 5px solid transparent;
	transition: all 0.3s ease;
}

#dot-1:checked ~ .category label .one, #dot-2:checked ~ .category label .two,
	#dot-3:checked ~ .category label .three {
	background: black;
	border-color: #d9d9d9;
}

form input[type="radio"] {
	display: none;
}

form .button {
	height: 45px;
	margin: 35px 0
}

form .button input {
	height: 100%;
	width: 100%;
	border-radius: 5px;
	border: none;
	color: black;
	font-size: 18px;
	font-weight: 500;
	letter-spacing: 1px;
	cursor: pointer;
	transition: all 0.3s ease;
	background: #e0e2ee;
}

form .button input:hover {
	background: grey;
}

@media ( max-width : 584px) {
	.container {
		max-width: 100%;
	}
	form .user-details .input-box {
		margin-bottom: 15px;
		width: 100%;
	}
	form .category {
		width: 100%;
	}
	.content form .user-details {
		max-height: 300px;
		overflow-y: scroll;
	}
	.user-details::-webkit-scrollbar {
		width: 5px;
	}
}

@media ( max-width : 459px) {
	.container .content .category {
		flex-direction: column;
	}
}
</style>
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<body>
	<div class="container">
		<div class="title">Register for E-VOTE</div>
		<%
		String msg = (String) request.getAttribute("info");
		%>
		<%
		if (msg != null) {
		%>
		<h1 class="text-center"><%=msg%></h1>
		<%
		}
		%>
		<div class="content">
			<form action="SignupServlet" method="post">
				<div class="user-details">
					<div class="input-box">
						<span class="details">First Name</span> <input type="text"
							name="fname" placeholder="Enter your first name" required>
					</div>
					<div class="input-box">
						<span class="details">Last Name</span> <input type="text"
							name="lname" placeholder="Enter your last name" required>
					</div>
					<div class="input-box">
						<span class="details">User ID</span> <input type="text" name="uid"
							placeholder="Enter your ID Number" required>
					</div>
					<div class="input-box">
						<span class="details">Email</span> <input type="text" name="email"
							placeholder="Enter your email" required>
					</div>
					<div class="input-box">
						<span class="details">Phone Number</span> <input type="text"
							name="pno" placeholder="Enter your number" required>
					</div>
					<div class="input-box">
						<span class="details">Password</span> <input type="password"
							name="pass" placeholder="Enter your password" required>
					</div>
					<div class="input-box">
						<span class="details">Confirm Password</span> <input
							type="password" name="cpass" placeholder="Confirm your password"
							required>
					</div>
				</div>
				<div class="gender-details">
					<input type="radio" name="gender" id="dot-1"> <input
						type="radio" name="gender" id="dot-2"> <input type="radio"
						name="gender" id="dot-3"> <span class="gender-title">Gender</span>
					<div class="category">
						<label for="dot-1"> <span class="dot one"></span> <span
							class="gender">Male</span>
						</label> <label for="dot-2"> <span class="dot two"></span> <span
							class="gender">Female</span>
						</label> <label for="dot-3"> <span class="dot three"></span> <span
							class="gender">Prefer not to say</span>
						</label>
					</div>
				</div>
				<div class="button">
					<input type="submit" value="Register">
					<div class="options">
						<h4>
							Already Have an Account? Then <a style="color: black;"
								href="index.jsp">Sign In</a>
						</h4>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>