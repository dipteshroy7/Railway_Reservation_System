<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="ISO-8859-1">
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <title>Sign-Up Page</title>
	
	    <!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> 
	
	    <!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.css" rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="css/style.css" rel="stylesheet">
    </head>
  	<body class="text-center">
  	<header>
  		<h1>RAILWAY RESERVATION SYSTEM</h1>
  	</header>
  	<main>
  	<div class="transbox">
		<form class="form-all" method="post" action="RegisterController">	
			<h2 class="h3 mb-3 font-weight-normal pos">Register Here</h2>
			<div class="invalid-msg" >
			<%
				String status = request.getParameter("status");
				if (status != null)
				{
					if (status.equals("dublicate_email"))
						out.println("<p>Email already exist</p>");
					
					else if (status.equals("password_mismatch"))
						out.println("<p>Password doesn't match</p>");
					
					else if (status.equals("error"))
						out.println("<p>Some error occured, Try again<p>");
				}
			%>
			</div>
			<label for="inputName" class="sr-only">Name</label>
			<input type="text" name="rname" id="inputName" class="form-control" placeholder="Enter Name" required autofocus>
			<label style="color:white ">Gender : </label>
			<label for="male" style="color:white"> Male</label>
		    <input type="radio" name="rgender" id="male" value="Male" required>
		    <label for="female" style="color:white">Female</label>
		    <input type="radio" name="rgender" id="female" value="Female" required>
		    <label for="other" style="color:white">Other</label>
		    <input type="radio" name="rgender" id="other" value="Other" required>
		    <label for="inputName" class="sr-only">Age</label>
			<input type="number" min="18" max="120" name="r_age" id="inputAge" class="form-control form-boxtop" placeholder="Enter Age" required>
			<label for="inputEmailSignup" class="sr-only">Email address</label>
			<input type="email" name="remail" id="inputEmailSignup" class="form-control  form-boxmid" placeholder="Enter Email address" required>
			<label for="inputPasswordSignup" class="sr-only">Password</label>
			<input type="password" name="rpass" id="inputPasswordSignup" class="form-control form-boxmid" placeholder="Enter Password" required>
			<label for="inputrRePassword" class="sr-only">RePassword</label>
			<input type="password" name="rconpass" id="inputRePassword" class="form-control form-boxbottom" placeholder="Re-enter Password" required>
			<div class="mb-3">
				<a class="thick" href="index" >Existing user? Login here</a>
			</div>
			<button class="btn btn-lg btn-success btn-block" type="submit">Sign Up</button>
		</form>
	</div>
	</main>
	<footer>
  		<div class="container">
    		<span class="text-muted">Copyright&copy; <script>document.write(new Date().getFullYear())</script> DR All rights reserved.</span>
  		</div>
	</footer>
	</body>
</html>