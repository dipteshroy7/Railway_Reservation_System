<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="ISO-8859-1">
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <title>Profile Page</title>
	    
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
	    
  		if(session.getAttribute("uemail") == null)
  		{
  			System.out.println("Unauthorised Access Denied - Profile Page");
  			response.sendRedirect("index");
  		}
  	%>
  	<div class="text-center">
	  	<header>
	  		<h1>RAILWAY RESERVATION SYSTEM</h1>
	  	</header>
  	</div>
  	<main>
  	  	<div class="whitebox" style="padding-bottom:30px;max-width:570px;">
			<form class="form-all" method="post" action="home">			
				<h2 style="color:#000;font-weight: 600;">PROFILE</h2>
				<hr style="height:3px; border:none; color:#fff; background-color:#000;">
				<div class="row" style="font-size:25px;padding:0px 15px;">
					<b>PNR NO.&ensp;-&ensp;</b><%=session.getAttribute("upnr")%>
				</div>
				<div class="row" style="font-size:25px;padding:0px 15px;">
					<b>NAME&ensp;-&ensp;</b><%=session.getAttribute("uname")%>
				</div>
				<div class="row" style="font-size:25px;">
					<div class="col-sm-6">
						<b>GENDER&ensp;-&nbsp;</b><%=session.getAttribute("ugender")%>
					</div>
					<div class="col-sm-6">
						<b>AGE&ensp;-&ensp;</b><%=session.getAttribute("uage")%>
					</div>
				</div>
				<div class="row" style="font-size:25px;padding:0px 15px;">
					<b>EMAIL&ensp;-&ensp;</b><%=session.getAttribute("uemail")%>
				</div>
				<div class="row" style="margin-top: 18px;">
					<div class="col-sm-6" >
						<button class="btn btn-lg btn-danger btn-block" style="margin-top: 12px;">HOME</button>
					</div>
					<div class="col-sm-6" >
						<button class="btn btn-lg btn-danger btn-block" style="margin-top: 12px;" formnovalidate formaction="LogoutServlet">LOG OUT</button>
					</div>
				</div>
				<div class="row" style="padding:0px 15px;">
						<button class="btn btn-lg btn-danger btn-block" style="margin-top: 12px" formnovalidate formaction="ProfileServlet">DELETE ACCOUNT</button>
				</div>
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