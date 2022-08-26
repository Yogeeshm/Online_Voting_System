<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="be.AdminLoginServlet"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<style>
.logo {
	margin-top: 0px;
	padding-top: 0;
}

.logo img {
	width: 100px;
	border-radius: 100px;
}

body {
	background-image: url("res/2.gif");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 110%;
}
</style>
<meta charset="ISO-8859-1">
<title>Home | E-VOTE</title>
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
				<%
				HttpSession session2 = request.getSession();
				String myName = (String) session2.getAttribute("uname");
				System.out.println("uname");
				%>
				<%
				if (myName != null) {
				%>
				<form class="d-flex" action="LogoutServlet" method="post">
					<button class="btn btn-outline-danger" type="submit">Logout</button>
				</form>
				<%
				}
				%>
				<%
				if (myName == null) {
				%>
				<form class="d-flex" action="index.jsp" method="post">
					<button class="btn btn-outline-success" type="submit">Sign
						in</button>
				</form>
				<%
				}
				%>
			</div>
		</div>
	</nav>
	<%
	if (myName != null) {
	%>
	<div style="padding-left:1%;padding-top:1%;">
	<div class="card mb-3" style="max-width: 360px;border-radius:200px;opacity:0.9;diplay:flex;">
		<div class="row no-gutters">
			<div class="col-md-4">
				<img src="res/e-vot.jpeg" class="card-img" alt="User logo"style="border-radius:100px;padding-top:1%;">
			</div>
			<div class="col-md-8" style="padding-top:5%;">
				<div class="card-body">
				<h5>User ID :- <u><%=myName%></u></h5>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%
	}
	%>
	<%
	if (myName == null) {
	%>
	
	<%
	}
	%>
	<div style="padding-left: 35%;padding-top:0.5%">
		<div class="card bg-light mb-3"
			style="max-width: 30rem; justify-content: center; opacity: 0.8;">
			<div class="card-body">
				<h2 class="card-title">How to use:-</h2>
				<h4>
					<ul>
						<li>Click on <b>Candidate List</b> in the navigation bar to view
							information about Candidate's.</li>
						<li>Click on <b>Vote</b> to give your vote to the candidate.</li>
						<li>Click on <b>Results</b> to see the information related to
							results of the election.</li>
					</ul>
				</h4>
			</div>
		</div>
	</div>
</body>
</html>