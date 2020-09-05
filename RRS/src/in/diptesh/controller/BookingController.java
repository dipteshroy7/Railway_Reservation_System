package in.diptesh.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.diptesh.DAO.BookingDAO;
import in.diptesh.entity.BookingData;
import in.diptesh.serviceDAO.BookingServiceDAO;

@WebServlet("/BookController")
public class BookingController extends HttpServlet
{
   private static final long serialVersionUID = 1L;
   
   public BookingController() {super();}
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	   String departure = request.getParameter("departure");
	   String destination = request.getParameter("destination");
	   
	   if(departure.equals(destination))
	   {
		   response.sendRedirect("book?status=same_location");
	   }
	   else
	   {
			String bname = request.getParameter("bname");
			int b_age = Integer.parseInt(request.getParameter("b_age"));
			String bphone = request.getParameter("bphone");
			String bemail = request.getParameter("bemail");
			
			String departureDate = null;
			departureDate = request.getParameter("departureDate");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
			String bookingDate = df.format(new Date());
			String trainName = request.getParameter("trainName");
			String trainClass = request.getParameter("trainClass");
			int adultNumber = Integer.parseInt(request.getParameter("adultNumber"));
			int childrenNumber = Integer.parseInt(request.getParameter("childrenNumber"));
			HttpSession session = request.getSession();
			session.setAttribute("departureDate",departureDate);
			session.setAttribute("bname",bname);
			session.setAttribute("b_age",b_age);
			session.setAttribute("bphone",bphone);
			session.setAttribute("bemail",bemail);
			session.setAttribute("departure",departure);
			session.setAttribute("destination",destination);
			session.setAttribute("trainName",trainName);
			session.setAttribute("trainClass",trainClass);
			session.setAttribute("adultNumber",adultNumber);
			session.setAttribute("childrenNumber",childrenNumber);
			session.setAttribute("bookingDate",bookingDate);
			session.setAttribute("billpass", "YES");
			
			BookingData b1 = BookingData.getInstance();
			b1.BookingDataInput(bname,b_age,bphone,bemail,departure,destination,departureDate,bookingDate,trainName,trainClass,adultNumber,childrenNumber);
			BookingDAO obj = new BookingServiceDAO();
			String status = obj.billPricing(b1);
			
			if(status.equals("done"))
			{
				System.out.println("BILLING DATA FETCHED\n");
				session.setAttribute("fare",b1.getFare());
				session.setAttribute("distance",b1.getDistance());
				session.setAttribute("baseFare",b1.getBaseFare());
				session.setAttribute("classFare",b1.getClassFare());
				session.setAttribute("payAmount",b1.getPayAmount());
				response.sendRedirect("billing");
			}
			else if(status.equals("error"))
			{
				response.sendRedirect("book?status=error");
			}
	   	}
	}
}
