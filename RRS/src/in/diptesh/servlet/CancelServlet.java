package in.diptesh.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.diptesh.entity.BookingData;

@WebServlet("/CancelServlet")
public class CancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CancelServlet() {super();}
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		session.removeAttribute("bname");
		session.removeAttribute("b_age");
		session.removeAttribute("bphone");
		session.removeAttribute("bemail");
		session.removeAttribute("departure");
		session.removeAttribute("destination");
		session.removeAttribute("trainName");
		session.removeAttribute("departureDate");
		session.removeAttribute("adultNumber");
		session.removeAttribute("childrenNumber");
		session.removeAttribute("bookingDate");
		session.removeAttribute("billpass");
		session.removeAttribute("trainClass");
		session.removeAttribute("fare");
		session.removeAttribute("distance");
		session.removeAttribute("baseFare");
		session.removeAttribute("classFare");
		session.removeAttribute("payAmount");
		session.removeAttribute("payPass");
		session.removeAttribute("resPass");
		
		BookingData b1 = BookingData.getInstance();
		b1.BookingDataInput(null, 0, null, null, null, null, null, null, null, null, 0, 0);
		b1.setFare(0);
		b1.setBaseFare(0);
		b1.setClassFare(0);
		b1.setDistance(0);
		b1.setPayAmount(0);
		
		
		System.out.println("BOOKING - CANCELLED");
		response.sendRedirect("home");
	}

}
