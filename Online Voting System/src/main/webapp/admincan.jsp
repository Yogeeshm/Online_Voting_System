<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidate Create</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

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
	opacity: 0.9;
}

.container {
	max-width: 700px;
	width: 100%;
	background-color: silver;
	padding: 25px 30px;
	border-radius: 5px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
}

.container .title {
	font-size: 25px;
	font-weight: 500;
	position: relative;
}

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
	border: 0.1px solid #fff;
	border-bottom-width: 2px;
	transition: all 0.3s ease;
}

.user-details .input-box input:focus, .user-details .input-box input:valid
	{
	border-color: #9b59b6;
}

butoon {
	background-color: #e0e2ee;
	height: 35px;
	width: 70px;
	margin: 10px 0;
}

button:hover {
	background: lightgreen;
}
</style>
<body>
	<div class="content">
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
		<form action="CandidateServlet" method="post">
			<div class="container">
				<div class="Candidate-details">
					<div class="input-box">
						<span class="details">Candidate Name</span> <input type="text"
							placeholder="Enter Candidate Name" id="Candidate Name"
							name="Cname" required />
					</div>
					<div class="input-box">
						<span class="details">Address</span> <input type="text"
							placeholder="Address" id="Address" name="Address" required />
					</div>
					<div class="input-box">
						<span class="details">Contact Details</span> <input type="text"
							placeholder="Contact Number" id="Candidate" name="Contact"
							required />
					</div>
					<div class="input-box">
						<span class="details">Email</span> <input type="text"
							placeholder="Candidate Email" id="Email" name="Email" required />
					</div>
					<div class="input-box">
						<span class="details">Gender</span> <input type="text"
							placeholder="Gender" id="Gender" name="Gender" required />
					</div>
					<div class="input-box">
						<span class="details">Age</span> <input type="number"
							placeholder="Age of Candidate" id="Age" name="Age" required />
					</div>
					<div class="input-box">
						<span class="details">Party Name</span> <input type="text"
							placeholder="Party Name" id="Party name" name="Pname" required />
					</div>
				</div>
				<div style="padding-top: 4%;">
					<center>
						<button type="submit">Add Candidate</button>
					</center>
				</div>
			</div>
		</form>
	</div>
</body>
</html>