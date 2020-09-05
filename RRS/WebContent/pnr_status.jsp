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
	    <title>PNR Status Page</title>
	    
	    <!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> 
	
	    <!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.css" rel="stylesheet">

	    <!-- Custom style sheet -->
	    <link type="text/css" rel="stylesheet" href="css/style.css" />
	    
	    <style type="text/css">
	    	p{
	    		margin-bottom:2px;
	    	}
	    </style>
	    
    </head>
  	<body>
  	<%
  		session.removeAttribute("resPass");
  		session.removeAttribute("pnrResPass");
  	%>
  	<div class="text-center">
  	<header>
  		<h1>RAILWAY RESERVATION SYSTEM</h1>
  	</header>
  	</div>
  	<main>
  		<div class="transbox" style="margin-bottom: 30px;">
			<form class="form-all" method="post" action="PnrStatusController">
				<h2 class="h3 mb-3 font-weight-normal pos">PNR Status</h2>
				<div class="invalid-msg" style="text-align:center">
				<%
					try{
						String pStatus = session.getAttribute("pStatus").toString();
						if (pStatus != null)
						{
							if ("NO".equals(pStatus))
							{
								out.println("<p>Invalid PNR Number...</p>");
							}
							else if ("NODATA".equals(pStatus))
							{
								out.println("<p>No Data for this PNR Number...</p>");
							}
							else if ("error".equals(pStatus))
							{
								out.println("<p>Some error occured, Try again<p>");
							}
						}
						session.setAttribute("pStatus", null);
					}
					catch(Exception e){}
				
					String url = new Url().getUrl();
					
				%>
			</div>
				<label for="inputEmailSignin" class="sr-only">Email address</label>
				<input type="text" name="pnr" class="form-control" style="margin-bottom:16px" placeholder="Enter PNR Number" required autofocus>
				<button class="btn btn-lg btn-danger btn-block" type="submit">CHECK</button>
			</form>
		</div>
		<%
			if(session.getAttribute("uemail") != null)
	  		{
				out.write("<div class=\"transbox\" style=\"padding: 20px 30px;\">");
				out.write("<button class=\"btn btn-lg btn-danger btn-block\" onclick=\"location.href='"+url+"/RRS/home'\" type=\"button\">HOME</button>");
	  			out.write("</div>");
	  		}
		%>
	</main>
	<footer>
  		<div class="container">
    		<span class="text-muted">Copyright&copy; <script>document.write(new Date().getFullYear())</script> DR All rights reserved.</span>
  		</div>
	</footer>  	
	</body>
</html>