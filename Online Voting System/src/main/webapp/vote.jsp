<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
.button {
	background-color: lightblue;
	border-radius: 5px;
	height: 50px;
	width: 80px;
}

button:hover {
	background-color: lightgreen;
}

.content {
	padding: 10vh 10vh 10vh 50vh;
}

.container1 {
	max-width: 775px;
	width: 100%;
	background-color: grey;
	padding: 35px 25px;
	border-radius: 5px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
	opacity: 0.9;
}

body {
	background-image: url("res/2.gif");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 110%;
}

h2 {
	justify-content: center;
	text-align: center;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Vote | E-VOTE</title>
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
<body>
	<%
	HttpSession session2 = request.getSession();
	String myName = (String) session2.getAttribute("uname");
	%>
	<%
	if (myName == null) {
	%>
	<div style="padding-top: 10%;">
		<h2 style="justify-content: center; text-align: center;">
			Please Login first !!! <a href="index.jsp">Click here</a> if you
			already have an E-VOTE Account.
		</h2>
		<h2>OR</h2>
		<h2>
			Create a new E-VOTE Account by <a href="signup.jsp">Clicking
				here.</a>
		</h2>
	</div>
	<%
	}
	%>
	<%
	if (myName != null) {
	%>

	<nav class="navbar navbar-expand-lg  navbar-light bg-light">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
				aria-controls="navbarTogglerDemo01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
				<a class="navbar-brand">E-VOTE</a>
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="list">Candidate
							List</a></li>
					<li class="nav-item"><a class="nav-link" href="vote.jsp">Vote</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="ResultServlet">Result</a>
					</li>
				</ul>

				<form class="d-flex" action="LogoutServlet" method="post">
					<button class="btn btn-outline-danger" type="submit">Logout</button>
				</form>

			</div>
		</div>
	</nav>
	<br>
	<br>
	<div class="content" style="justify-content: center;">
		<div class="container1">
			<div class="container">
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
				<form action="VoteServlet" method="post">
					<div class="row mb-3">
						<label for="uid" class="col-sm-2 col-form-label">Your ID</label>
						<div class="col-sm-10">
							<input id="uid" value="<%=myName%>" disabled="disabled">
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputPassword3" class="col-sm-2 col-form-label">Candidate
							ID</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="cid"
								id="inputPassword3"
								placeholder="Enter Candidate's ID you want to Vote" required>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-10 offset-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="gridCheck1"
									required> <label class="form-check-label"
									for="gridCheck1"> Agree terms and conditions </label>
							</div>
						</div>
					</div>
					<center>
						<button type="submit" class="button">Vote</button>
					</center>
				</form>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>