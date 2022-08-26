<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="be.Votecount"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<style>
.opac {
	opacity: 0.93;
	display:flex;
	flex-direction:row;
}

body {
	background-image: url("res/2.gif");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 110%;
}
</style>
<meta charset="ISO-8859-1">
<title>Results | E-VOTE</title>
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
	<div class="container" style="padding-top: 1%;">
		<div class="row row-cols-1 row-cols-md-2 g-4">
			<%
			List<Votecount> hey = (List<Votecount>) request.getAttribute("data");
			%>
			<%
			for (Votecount obj : hey) {
			%>
			<div class="opac">
				<div class="card text-self-center card border-dark mb-3 mx-2"
					style="max-width: 24rem;">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">Candidate id: <%=obj.getCid()%></li>
						<li class="list-group-item">Candidate Name: <%=obj.getCname()%></li>
						<li class="list-group-item">Party Name: <%=obj.getPname()%></li>
						<li class="list-group-item">Votes recived: <%=obj.getVO()%></li>
					</ul>
				</div>

				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>