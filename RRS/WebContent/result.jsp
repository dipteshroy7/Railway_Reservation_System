<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="in.diptesh.ngrok.Url"%>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="ISO-8859-1">
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <title>Result Page</title>
	    
	    <!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> 
	
	    <!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.css" rel="stylesheet">

	    <!-- Custom style sheet -->
	    <link type="text/css" rel="stylesheet" href="css/style.css" />
	    
    </head>
  	<body>
  	<%
  		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	    response.setHeader("Expires", "0"); // Proxies.
  		
  		if(session.getAttribute("uemail") != null )
  		{
  			if(session.getAttribute("resPass") == null)
  			{
  				System.out.println("Invalid Access - Result Page");
  	  			response.sendRedirect("home");
  			}
  		}
  		else
  		{
  			System.out.println("Unauthorised Access Denied - Result Page");
  			response.sendRedirect("index");
  		}
	    
  		String url = new Url().getUrl();
  	%>
  	<div class="text-center">
  	<header>
  		<h1>RAILWAY RESERVATION SYSTEM</h1>
  	</header>
  	</div>
  	<main>
  		<div class="resultbox">
	  		<div class="text-center">
	  	  		<h2 style="font-weight: 700; color: #fff;">TICKET BOOKED SUCCESSFULLY!!</h2>
	  	  	</div>
	  	</div>  	
		<div class="resultbox" style="padding-top:10px">
	  	  	<div class="row">
	  	  		<div class="col-sm-4">
	  	  			<% out.print("<button class=\"btn btn-lg btn-danger btn-block\" style=\"margin-top:20px\" onclick=\"location.href='"+url+"/RRS/home'\" type=\"button\">HOME</button>");%>
	  	  		</div>
	  	  		<div class="col-sm-4">
	  	  			<% out.print("<button class=\"btn btn-lg btn-danger btn-block\" style=\"padding:8px 2px;margin-top:20px\" onclick=\"location.href='"+url+"/RRS/pnr_status'\" type=\"button\">PNR Status</button>");%>
	  	  		</div>
	  	  		<div class="col-sm-4">
	  	  			<form method="POST" action='LogoutServlet'><button class="btn btn-lg btn-danger btn-block" style="margin-top:20px" type="submit">LOG OUT</button></form>
	  	  		</div>
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