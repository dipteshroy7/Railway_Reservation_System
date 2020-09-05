<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
	<head>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <title>Billing Page</title>
	    
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
  	%>
  	<div class="text-center">
  	<header>
  		<h1>RAILWAY RESERVATION SYSTEM</h1>
  	</header>
  	</div>
  	<main>
  	  	<div class="whitebox">
			<form class="form-all" method="post" action="BillingServlet">			
				<h2 style="color:#000;font-weight: 600;">BILLING</h2>
				<hr style="height:3px; border:none; color:#fff; background-color:#000;">
				<%
					String departure = null;
					String destination = null;
					String distance = null;
					String bookingDate = null;
					String trainName = null;
					String departureDate = null;
					String trainClass = null;
					int fare = 0;
					Double baseFare = 0.0;
					Double classFare = 0.0;
					int childrenNumber = 0;
					int adultNumber = 0;
					
			  		if(session.getAttribute("uemail") != null )
			  		{
			  			if(session.getAttribute("payAmount") != null)
			  			{
			  				departure = session.getAttribute("departure").toString();
							destination = session.getAttribute("destination").toString();
							distance = session.getAttribute("distance").toString();
							bookingDate = session.getAttribute("bookingDate").toString();
							bookingDate = bookingDate.substring(8) + bookingDate.substring(4, 8) + bookingDate.substring(0, 4);
							trainName = session.getAttribute("trainName").toString();
							departureDate = session.getAttribute("departureDate").toString();
							departureDate = departureDate.substring(8) + departureDate.substring(4, 8) + departureDate.substring(0, 4);
							trainClass = session.getAttribute("trainClass").toString();
							fare = (int)session.getAttribute("fare");
							baseFare = (double)session.getAttribute("baseFare");
							classFare = (double)session.getAttribute("classFare");
							childrenNumber = Integer.parseInt(session.getAttribute("childrenNumber").toString());
							adultNumber = Integer.parseInt(session.getAttribute("adultNumber").toString());
							
			  			}
			  			else
			  			{
			  				System.out.println("Invalid Access - Billing Page");
			  	  			response.sendRedirect("home");
			  			}
			  		}
			  		else
			  		{
			  			System.out.println("Unauthorised Access Denied - Billing Page");
			  			response.sendRedirect("index");
			  		}
				%>
				<div class="row">
					<div class="col-sm-8">
					<%="<h4 style=\"padding-bottom:16px;\">Train - "+departure+" to "+destination+"</h4>"%>
					</div>
					<div class="col-sm-4">
					<%="<h4 style=\"padding-bottom:16px;text-align:right;font-weight: 600;\">"+distance+"KM</h4>"%>	
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8">
						<h6>Booking Date</h6>
					</div>
					<div class="col-sm-4">
						<%="<h6 style=\"text-align:right;\">" + bookingDate + "</h6>"%>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8">
						<h6 style="margin: 8px 0px;">Train Name</h6>
					</div>
					<div class="col-sm-4">
						<%="<h6 style=\"text-align:right; margin: 8px 0px;\">" + trainName + "</h6>" %>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8">
						<h6 style="margin: 8px 0px;">Departure Date</h6>
					</div>
					<div class="col-sm-4">
						<%="<h6 style=\"text-align:right; margin: 8px 0px;\">" + departureDate + "</h6>"%>
					</div>
				</div>
				<div class="row">	
					<div class="col-sm-8">
						<%="<h6 style=\"margin: 8px 0px;\">Base Ticket Fare (SL) for "+trainName+"</h6>"%>
					</div>
					<div class="col-sm-4">
						<%="<h6 style=\"text-align:right;margin: 8px 0px;\">&#8377; "+String.format("%.2f",(fare*baseFare))+"</h6>"%>
					</div>
				</div>
				<div class="row">	
					<div class="col-sm-8">
						<%="<h6 style=\"margin: 8px 0px;\">"+trainClass+"</h6>"%>
					</div>
					<div class="col-sm-4">
						<%="<h6 style=\"text-align:right;margin: 8px 0px;\">+ &#8377; "+String.format("%.2f",((fare*classFare)-(fare*baseFare)))+"</h6>"%>
					</div>
				</div>
				<hr style="border-top: 2px dashed;margin:0px;margin-top:8px;">
				<div class="row">	
					<div class="col-sm-8">
						<h6 style="margin: 8px 0px;">Total-Individual Fare</h6>
					</div>
					<div class="col-sm-4">
						<%="<h6 style=\"text-align:right;margin: 8px 0px;\">&#8377; "+String.format("%.2f",((fare*classFare)))+"</h6>"%>
					</div>
				</div>
				<hr style="border-top: 2px dashed;margin:0px;margin-bottom:12px;">
				<div class="row">	
					<div class="col-sm-5">
						<%
							if(childrenNumber!=0)
								out.println("<h6 style=\"margin: 8px 0px;\">Children Fare(20% disc)</h6>");
						%>
					</div>
					<div class="col-sm-4">
						<%
							if(childrenNumber!=0)
								out.println("<h6 style=\"margin: 8px 0px;\">&#8377; "+String.format("%.2f",(fare*baseFare))+" - 20% = </h6>");
						%>
					</div>
					<div class="col-sm-3">
						<%
							if(childrenNumber!=0)
								out.println("<h6 style=\"text-align:right;margin: 8px 0px;\">&#8377; "+String.format("%.2f",((fare*baseFare)*0.8))+"</h6>");
						%>
					</div>
				</div>
				<div class="row">	
					<div class="col-sm-8">
						<%
							if(childrenNumber!=0)
								out.println("<h6 style=\"margin: 8px 0px;\">"+trainClass+"</h6>");
						%>
					</div>
					<div class="col-sm-4">
						<%
							if(childrenNumber!=0)
								out.println("<h6 style=\"text-align:right;margin: 8px 0px;\">+ &#8377; "+String.format("%.2f",(((fare*classFare)-(fare*baseFare))*0.8))+"</h6>");
						%>
					</div>
				</div>
				<%
					if(childrenNumber!=0)
						out.println("<hr style=\"border-top: 2px dashed;margin:0px;margin-top:8px;\">");
				%>
				<div class="row">	
					<div class="col-sm-8">
					<%
						if(childrenNumber!=0)
							out.println("<h6 style=\"margin: 8px 0px;\">Total-Individual Children Fare</h6>");
					%>
					</div>
					<div class="col-sm-4">
						<%
							if(childrenNumber!=0)
								out.println("<h6 style=\"text-align:right;margin: 8px 0px;\">&#8377; "+String.format("%.2f",((fare*classFare*0.8)))+"</h6>");
						%>
					</div>
				</div>
				<%
					if(childrenNumber!=0)
						out.println("<hr style=\"border-top: 2px dashed;margin:0px;margin-bottom:12px;\">");
				%>
				<div class="row">	
					<div class="col-sm-8">
						<h6 style="margin: 8px 0px;">Number of Adults</h6>
					</div>
					<div class="col-sm-4">
						<%
							out.println("<h6 style=\"text-align:right;margin: 8px 0px;\">"+adultNumber+"</h6>");
						%>
					</div>
				</div>
				<div class="row">	
					<div class="col-sm-8">
						<%
							if(childrenNumber!=0)
								out.println("<h6 style=\"margin: 8px 0px;\">Number of Children</h6>");
						%>
					</div>
					<div class="col-sm-4">
						<%
							if(childrenNumber!=0)
								out.println("<h6 style=\"text-align:right;margin: 8px 0px;\">"+childrenNumber+"</h6>");
						%>
					</div>
				</div>
				<%="<hr style=\"border-top: 2px dashed;margin:0px;margin-top:8px;margin-bottom:12px;\">" %>
				<div class="row">	
					<div class="col-sm-5">
						<h6 style="margin: 8px 0px;">Total Fare</h6>
					</div>
					<div class="col-sm-4">
						<%
						out.println("<h6 style=\"margin: 8px 0px;\">&#8377; "+String.format("%.2f",(fare*classFare))+" * "+adultNumber+" = </h6>");
						%>
					</div>
					<div class="col-sm-3">
						<%
							out.println("<h6 style=\"text-align:right;margin: 8px 0px;\">&#8377; "+String.format("%.2f",(fare*classFare*adultNumber))+"</h6>");
						%>
					</div>
				</div>
				<div class="row">	
					<div class="col-sm-5">
						<%
							if(childrenNumber!=0)
								out.println("<h6 style=\"margin: 8px 0px;\">Total Children Fare</h6>");
						%>
					</div>
					<div class="col-sm-4">
						<%
							if(childrenNumber!=0)
								out.println("<h6 style=\"margin: 8px 0px;\">&#8377; "+String.format("%.2f",(fare*classFare*0.8))+" * "+childrenNumber+" = </h6>");
						%>
					</div>
					<div class="col-sm-3">
						<%
							if(childrenNumber!=0)
								out.println("<h6 style=\"text-align:right;margin: 8px 0px;\">+ &#8377; "+String.format("%.2f",(fare*classFare*0.8*childrenNumber))+"</h6>");
						%>
					</div>
				</div>
				<hr style="border-top: 3px solid;margin:0px;margin-top:8px;">
				<div class="row">	
					<div class="col-sm-6">
						<h4 style="margin: 4px 0px;font-weight: 600;">GRAND-TOTAL</h4>
					</div>
					<div class="col-sm-6">
						<%
							out.println("<h4 style=\"text-align:right;margin: 4px 0px;font-weight: 600;\">&#8377; "+String.format("%.2f",(fare*classFare*adultNumber)+(fare*classFare*0.8*childrenNumber))+"</h4>");
						%>
					</div>
				</div>
				<hr style="border-top: 3px solid;margin:0px;">						
				<div class="row" style="margin-top: 8px;">
					<div class="col-sm-8">
						<button class="btn btn-lg btn-primary btn-block" style="margin-top: 12px">PROCEED PAYMENT</button>
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