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
	    <title>Booking Page</title>
	    
	    <!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> 
	
	    <!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.css" rel="stylesheet">

	    <!-- Custom style sheet -->
	    <link type="text/css" rel="stylesheet" href="css/stylebookingform.css" />
	    
    </head>
  	<body>
  	<% 
	  	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	    response.setHeader("Expires", "0"); // Proxies.
	    
  		if(session.getAttribute("uemail") == null)
  		{
  			System.out.println("Unauthorised Access Denied - Booking Page");
  			response.sendRedirect("index");
  		}
  	%>
  	<div class="text-center">
  	<header>
  		<h1>RAILWAY RESERVATION SYSTEM</h1>
  	</header>
  	</div>
  	<main>
  	<div id="booking">
		<div class="section-center">
			<div class="booking-form">
				<div class="form-header">
					<h2>Book Your Ticket</h2>
					<div class="invalid-msg">
						<%
							String status = request.getParameter("status");
							if (status != null) {
								
								if (status.equals("same_location"))
									out.println("Both location same");
								
								else if (status.equals("error"))
									out.println("Some error occured, Try again");
							}
						%>
					</div>
				</div>
				<form action="BookController" method="post">
					<div class="form-group">
						<input class="form-control" type="text" name="bname" required autofocus>
						<span class="form-label">NAME</span>
					</div>
					<div class="row">
						<div class="col-sm-5">
							<div class="form-group">
								<input class="form-control" min="18" max="120" type="number" name="b_age" required>
								<span class="form-label">AGE</span>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="form-group">
								<input class="form-control" type="text" name="bphone" required>
								<span class="form-label">PHONE NO.</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<input class="form-control" type="email" name="bemail" required>
						<span class="form-label">Email</span>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<select class="form-control" name="departure" required>
									<option selected disabled>-- Choose Location --</option>
								    <option value="Allahabad">Allahabad   </option>
									<option value="Bangalore">Bangalore   </option>
									<option value="Bhubaneshwar">Bhubaneshwar   </option>
									<option value="Bombay">Bombay   </option>
									<option value="Chennai">Chennai   </option>
									<option value="Noida">Noida   </option>
									<option value="Delhi">Delhi  </option>
									<option value="Goa">Goa   </option>
									<option value="Hyderabad">Hyderabad   </option>
									<option value="Puri">Puri   </option>
									<option value="Orissa">Orissa   </option>
									<option value="Ooty">Ooty   </option>
									<option value="Patna">Patna   </option> 
									<option value="Mysore">Mysore   </option>
									<option value="Shimla">Shimla   </option>
									<option value="Kanpur">Kanpur   </option>
									<option value="Kolkata">Kolkata   </option>
						     	</select>
								<span class="form-label">DEPARTURE FROM</span>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<select class="form-control" name="destination" required>
									<option selected disabled>-- Choose Location --</option>
								    <option value="Allahabad">Allahabad   </option>
									<option value="Bangalore">Bangalore   </option>
									<option value="Bhubaneshwar">Bhubaneshwar   </option>
									<option value="Bombay">Bombay   </option>
									<option value="Chennai">Chennai   </option>
									<option value="Noida">Noida   </option>
									<option value="Delhi">Delhi  </option>
									<option value="Goa">Goa   </option>
									<option value="Hyderabad">Hyderabad   </option>
									<option value="Puri">Puri   </option>
									<option value="Orissa">Orissa   </option>
									<option value="Ooty">Ooty   </option>
									<option value="Patna">Patna   </option> 
									<option value="Mysore">Mysore   </option>
									<option value="Shimla">Shimla   </option>
									<option value="Kanpur">Kanpur   </option>
									<option value="Kolkata">Kolkata   </option>
						     	</select>
								<span class="form-label">DESTINATION</span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-7">
							<div class="form-group">
								<select class="form-control" name="trainName" required>
									<option selected disabled>--Select--</option>
									<option value="Taj Express">Taj Express</option>
									<option value="Duronto Express">Duronto Express</option>
									<option value="Rajdhani Express">Rajdhani Express</option>
								</select>
								<span class="form-label">TRAIN NAME</span>
							</div>
						</div>
						<div class="col-sm-5">
							<div class="form-group">
								<input class="form-control" type="date" name="departureDate" required>
								<span class="form-label">CHECK IN</span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5">
							<div class="form-group">
								<select class="form-control" name="trainClass" required>
								 	<option selected disabled>--Select--</option>
									<option value="AC First Class (1A)">AC First Class (1A)</option>
									<option value="AC Second Class (2A)">AC Second Class (2A)</option>
									<option value="AC Third Class (3A)">AC Third Class (3A)</option>
									<option value="Sleeper Class (SL)">Sleeper Class (SL)</option>
								</select>
								<span class="form-label">TRAVEL CLASS</span>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<select class="form-control" name="adultNumber" required>
									<option selected disabled>--Select--</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
								</select>
								<span class="form-label">Adults</span>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<select class="form-control" name="childrenNumber" required>
									<option selected disabled>--Select--</option>
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
								<span class="form-label">Children</span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-8">
							<button class="submit-btn btn-warning btn-block" style="margin-bottom: 20px">PROCEED TO BILLING</button>
						</div>
						<div class="col-sm-4">
							<button class="submit-btn btn-danger btn-block" style="margin-bottom: 12px" formnovalidate  formaction='home'>CANCEL</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script>
		$('.form-control').each(function () {
			floatedLabel($(this));
		});

		$('.form-control').on('input', function () {
			floatedLabel($(this));
		});

		function floatedLabel(input) {
			var $field = input.closest('.form-group');
			if (input.val()) {
				$field.addClass('input-not-empty');
			} else {
				$field.removeClass('input-not-empty');
			}
		}
	</script>
	</main>  	
	<footer>
  		<div class="container">
    		<span class="text-muted">Copyright&copy; <script>document.write(new Date().getFullYear())</script> DR All rights reserved.</span>
  		</div>
	</footer>  	
	</body>
</html>