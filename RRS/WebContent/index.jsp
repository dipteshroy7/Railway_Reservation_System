<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="ISO-8859-1">
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <title>Sign-In Page</title>
	    
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
		<form class="form-all" method="post" action="LoginController">			
			<h2 class="h3 mb-3 font-weight-normal pos">Sign-In Here</h2>
			<div class="invalid-msg" style="text-align:center">
			<%
				String status = request.getParameter("status");
				if (status != null)
				{
					if (status.equals("false"))
					{
						out.println("<p>Invalid Credentials...</p>");
					}
					else if (status.equals("error"))
					{
						out.println("<p>Some error occured, Try again<p>");
					}
				}
			%>
			</div>
			<div class="success-msg" >
			<%
				if (status != null)
				{
					if (status.equals("registered"))
					{
						out.println("<p>Successfully Registered! Please Login</p>");
					}
				}
			%>
			</div>
			<label for="inputEmailSignin" class="sr-only">Email address</label>
			<input type="email" name="uemail" id="inputEmailSignin" class="form-control form-boxtop" placeholder="Email address" required autofocus>
			<label for="inputPasswordSignin" class="sr-only">Password</label>
			<input type="password" name="upass" id="inputPasswordSignin" class="form-control form-boxbottom" placeholder="Password" required>
			<div class="mb-3">
			    <a class="thick" href="signup" >New user? Register here</a>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign In</button>
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