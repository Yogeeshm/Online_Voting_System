<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="be.Candidate"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidate List | E-VOTE</title>
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
.container1 {
	text-color: black;
	background: grey;
	opacity: 0.95;
}

body {
	background-image: url("res/2.gif");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 110%;
}

.image {
	width: 100px;
	height: 100px;
	border-radius: 100px;
}

h1 {
	color: rgb(19, 93, 230);
	text-align: center;
}

h3, h5 {
	color: rgb(1, 22, 19);
	text-align: center;
}
</style>
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
	<%
	List<Candidate> hey = (List<Candidate>) request.getAttribute("data");
	%>
	<div class="container1">
		<table class="table caption-top responsive">
			<thead class="thead-danger">
				<tr>
					<th>Registration No</th>
					<th>Candidate Name</th>
					<th>Address</th>
					<th>Contact</th>
					<th>Email</th>
					<th>Gender</th>
					<th>Age</th>
					<th>Party name</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Candidate obj : hey) {
				%>

				<tr>
					<td><%=obj.getRegno()%></td>
					<td><%=obj.getCname()%></td>
					<td><%=obj.getAddress()%></td>
					<td><%=obj.getContact()%></td>
					<td><%=obj.getEmail()%></td>
					<td><%=obj.getGender()%></td>
					<td><%=obj.getAge()%></td>
					<td><%=obj.getPname()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>