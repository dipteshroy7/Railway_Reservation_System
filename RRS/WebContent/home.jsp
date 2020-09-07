<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="in.diptesh.ngrok.Url"%>
<!doctype html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <title>Home Page</title>
	
	    <!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> 
	
	    <!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.css" rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="css/style.css" rel="stylesheet">
    </head>
  	<body class="text-center">
  	<%
  		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	    response.setHeader("Expires", "0"); // Proxies.
	    session.removeAttribute("resPass");
	    
  		if(session.getAttribute("uemail") == null)
  		{
  			System.out.println("Unauthorised Access Denied - Home Page");
  			response.sendRedirect("index");
  		}
  		
  		String url = new Url().getUrl();
  	%>
  	<header>
  		<h1>RAILWAY RESERVATION SYSTEM</h1>
  	</header>
  	<main>
		<div class="transbox" style="padding-top:35px" >
		  	<div class="form-signin">
		  		<% out.write("<button class=\"btn btn-lg btn-danger btn-block\" onclick=\"location.href='"+url+"/profile'\" type=\"button\">User Profile</button>");%>
				<br>
		  		<% out.write("<button class=\"btn btn-lg btn-danger btn-block\" onclick=\"location.href='"+url+"/book'\" type=\"button\">Book Tickets</button>");%>
				<br>
		  		<% out.write("<button class=\"btn btn-lg btn-danger btn-block\" onclick=\"location.href='"+url+"/pnr_status'\" type=\"button\">PNR Status</button>");%>
				<br>
				<form method="POST" action='LogoutServlet'><button class="btn btn-lg btn-danger btn-block" type="submit">LOG OUT</button></form>
			</div>
		</div>
	</main>
	<footer>
  		<div class="container">
    		<span class="text-muted">Copyright&copy; <script>document.write(new Date().getFullYear())</script> DR All rights reserved.</span>
  		</div>
	</footer>
	</body>
</html>