<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
}

.container {
	text-align: center;
	max-width: 700px;
	width: 100%;
	background-color: silver;
	padding: 25px 30px;
	border-radius: 5px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
	opacity: 0.8;
}

.container .title {
	font-size: 25px;
	font-weight: 500;
	position: relative;
}

button {
	background-color: #e0e2ee;
	height: 35px;
	width: 70px;
	margin: 10px 0;
}

button:hover {
	background: red;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Admin Control</title>
</head>
<body>
	<div class="container">
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
			<h1>Admin Control</h1>
			<form action="ClearvoteServlet" method="post">
				<div>
					<label class="title">Delete all current votes</label>
					<button type="submit">Delete</button>
				</div>
			</form>
			<div>
				<form action="admincan.jsp">
					<label class="title">Add Candidates</label>
					<button type="submit">Add</button>
				</form>
			</div>
			<div>
				<form action="RemcandidateServlet" method="post">
					<label class="title">Remove Candidates</label> <input
						style="height: 40px; width: 150px;" type="text" name="cid"
						placeholder="Enter Candidate ID" required>
					<button type="submit">Remove</button>
				</form>
			</div>
			<div class="input">
				<form action="RemvoterServlet" method="post">
					<label class="title">Remove Voter</label> <input
						style="height: 40px; width: 150px;" type="text" name="cid"
						placeholder="Enter Voter ID" required>
					<button type="submit">Remove</button>
				</form>
				<form class="d-flex" action="LogoutServlet" method="post">
					<button type="submit">Logout</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>