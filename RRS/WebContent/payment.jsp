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
	    <title>Payment Page</title>
	    
	    <!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> 
	
	    <!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.css" rel="stylesheet">

	    <!-- Custom style sheet -->
	    <link type="text/css" rel="stylesheet" href="css/style.css" />
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	    
	    <style type="text/css">
	    div.row-margin{
	    margin:0px;}
	    </style>
	    
    </head>
  	<body>
  	<%
  		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	    response.setHeader("Expires", "0"); // Proxies.
  		
  		if(session.getAttribute("uemail") != null )
  		{
  			if(session.getAttribute("payPass") == null)
  			{
  				System.out.println("Invalid Access - Payment Page");
  	  			response.sendRedirect("home");
  			}
  		}
  		else
  		{
  			System.out.println("Unauthorised Access Denied - Payment Page");
  			response.sendRedirect("index");
  		}
  	%>
  	<div class="text-center">
  	<header>
  		<h1>RAILWAY RESERVATION SYSTEM</h1>
  	</header>
  	</div>
  	<main>
		<div class="whitebox">
			<form class="form-all" method="post" action="PaymentController">		
				<h2 style="color:#000;font-weight: 600;">PAYMENT</h2>
				<hr style="height:3px; border:none; color:#fff; background-color:#000;">
				<%String payAmount = String.format("%.2f",session.getAttribute("payAmount")); %>
				<label for="cname">Accepted Cards</label>
				<div class="icon-container">
					<i class="fa fa-cc-visa" style="color: navy;"></i> 
					<i class="fa fa-cc-amex" style="color: blue;"></i>
					<i class="fa fa-cc-mastercard" style="color: red;"></i>
					<i class="fa fa-cc-discover" style="color: orange;"></i>
				</div>
				<div class="row row-margin">
					
				</div>
				<div class="row row-margin">
					<label for="cname" style="margin: 8px 0px;">Name on Card</label>
					<input type="text" id="cname" name="cardname" class="form-control" placeholder="John More Doe">
				</div>
				<div class="row row-margin">
					<label for="ccnum">Credit card number</label>
					<input type="text" id="ccnum" name="cardnumber" class="form-control"  placeholder="1111-2222-3333-4444">
				</div>
				<div class="row row-margin">
					<label for="expmonth">Exp Month</label>
					<input type="text" id="expmonth" name="expmonth" class="form-control" placeholder="September">
				</div>
				<div class="row">
					<div class="col-sm-6">
						<label for="expyear">Exp Year</label> 
						<input type="text"	id="expyear" name="expyear" class="form-control" placeholder="2020">
					</div>
					<div class="col-sm-6">
						<label for="cvv">CVV</label>
						<input type="text" id="cvv" name="cvv" class="form-control" placeholder="352">
					</div>
				</div>
				<div class="row" style="margin-top: 8px;">
					<div class="col-sm-8">
						<button class="btn btn-lg btn-primary btn-block" style="margin-top: 12px">PAY - Rs <%=payAmount%></button>
					</div>
					<div class="col-sm-4">
						<button class="btn btn-lg btn-danger btn-block" style="margin-top: 12px" formnovalidate formaction="CancelServlet">CANCEL</button>
					</div>
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