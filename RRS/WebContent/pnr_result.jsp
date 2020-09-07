<%@page import="java.text.ParseException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="in.diptesh.database.DatabaseConnection"%>
<%@page import="in.diptesh.entity.BookingData"%>
<%@page import="in.diptesh.entity.UserData"%>
<%@page import="in.diptesh.ngrok.Url"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
	<head>
		<meta charset="ISO-8859-1">
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <title>PNR Result Page</title>
	    
	    <!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> 
	
	    <!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.css" rel="stylesheet">

	    <!-- Custom style sheet -->
	    <link type="text/css" rel="stylesheet" href="css/style.css" />
	    
	    <style type="text/css">
	    	p{
	    		font-weight: 700;
	    		margin: 0px;
	    	}
	    </style>
    </head>
  	<body>
  	<%
  		if(!"YES".equals(session.getAttribute("pnrResPass")))
  		{
  			System.out.println("Invalid Access Denied - PNR Result Page");
  			response.sendRedirect("pnr_status");
  		}
  		session.removeAttribute("pnrResPass");
  	%>
  	<div class="text-center">
  	<header>
  		<h1>RAILWAY RESERVATION SYSTEM</h1>
  	</header>
  	</div>
  	<main>
  	<%	
		try
		{
			Connection con = DatabaseConnection.getInstance().connect();
			if(con==null)
				System.out.println("Database Connection Not created - Ticket");
			else
			{
				System.out.println("Database Connection Created - Ticket");
				UserData u1 = UserData.getInstance();
				int  pnr = u1.getPnrStatusNum();
				PreparedStatement ps = con.prepareStatement("SELECT * FROM RRS_TICKETS WHERE PNR_ID = ?");
				ps.setInt(1, pnr);
				ResultSet rs = ps.executeQuery();
				System.out.println("DATA RECORDED");
				int i =1;
		  		while(rs.next())
		  		{
		  			out.write("<div class=\"whitebox\" style=\"max-width:1000px; min-width:500px; padding:12px 20px 20px 20px; margin-bottom:30px; width: 80%;\">");
			  			out.write("<h5 style=\"color:#000; font-weight: 600;\">Ticket - "+i+"</h5>");
			  			out.write("<hr style=\"height:2px; border:none; color:#fff; background-color:#000; margin:0px; margin-bottom:8px;\">");
			  			out.write("<div class=\"row\">");
			  				out.write("<div class=\"col-sm-9\">");
			  				out.write("<p>"+rs.getString("TRAIN_NAME")+" ("+rs.getString("TRAIN_CLASS")+") from "+rs.getString("DEPARTURE_LOCATION")+" to "+rs.getString("DESTINATION_LOCATION")+"</p>");
			  				out.write("</div>");
			  				out.write("<div class=\"col-sm-3\">");
			  				out.write("<p>Distance - "+rs.getString("DISTANCE")+"</p>");
			  				out.write("</div>");
			  			out.write("</div>");
			  			out.write("<div class=\"row\">");
		  					out.write("<div class=\"col-sm-4\" style=\"border:1px\">");
			  				out.write("<p>Name - "+rs.getString("NAME")+"</p>");
			  				out.write("</div>");
			  				out.write("<div class=\"col-sm-2\">");
			  				out.write("<p>AGE - "+rs.getString("AGE")+"</p>");
			  				out.write("</div>");
			  				out.write("<div class=\"col-sm-3\">");
			  				out.write("<p>Ph No. - "+rs.getString("PHONE_NUMBER")+"</p>");
			  				out.write("</div>");
			  				out.write("<div class=\"col-sm-3\">");
			  				out.write("<p>PNR ID - "+rs.getString("PNR_ID")+"</p>");
			  				out.write("</div>");
		  				out.write("</div>");
		  				out.write("<div class=\"row\">");
			  				out.write("<div class=\"col-sm-6\">");
			  				out.write("<p>Email - "+rs.getString("Email")+"</p>");
			  				out.write("</div>");
			  				out.write("<div class=\"col-sm-3\">");
			  				out.write("<p>No. of Adults - "+rs.getString("NUMBER_OF_ADULTS")+"</p>");
			  				out.write("</div>");
							out.write("<div class=\"col-sm-3\" >");
							out.write("<p>No. of Children - "+rs.getString("NUMBER_OF_CHILDREN")+"</p>");
			  				out.write("</div>");
		  				out.write("</div>");
		  				out.write("<div class=\"row\">");
			  				out.write("<div class=\"col-sm-4\">");
			  				String bdate = rs.getString("BOOKING_DATE");
			  				bdate = bdate.substring(8) + bdate.substring(4, 8) + bdate.substring(0, 4);
			  				out.write("<p>Booking Date - "+bdate+"</p>");
			  				out.write("</div>");
			  				out.write("<div class=\"col-sm-4\">");
			  				String ddate = rs.getString("DEPARTURE_DATE");
			  				ddate = ddate.substring(8) + ddate.substring(4, 8) + ddate.substring(0, 4);
			  				out.write("<p>Departure Date - "+ddate+"</p>");
			  				out.write("</div>");
			  				out.write("<div class=\"col-sm-4\" style=\"color:#FF0000; text-align:right\">");
							out.write("<p>Total Amount - "+rs.getString("TOTAL_AMOUNT")+"</p>");
			  				out.write("</div>");
		  				out.write("</div>");
		  			out.write("</div>");
		  			i++;
		  		}
		  		con.close();
		  		System.out.println("Database Connection Closed - Ticket\n");
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
  		
  		String url = new Url().getUrl();
  		
  		out.write("<div class=\"whitebox\" style=\"max-width:1000px; padding:20px; width: 80%;\">");
  			out.print("<button class=\"btn btn-lg btn-danger btn-block\" onclick=\"location.href='"+url+"/pnr_status'\" type=\"button\">BACK</button>");
  		out.write("</div>");
  	%>
	</main>
	<footer>
  		<div class="container">
    		<span class="text-muted">Copyright&copy; <script>document.write(new Date().getFullYear())</script> DR All rights reserved.</span>
  		</div>
	</footer>  	
	</body>
</html>