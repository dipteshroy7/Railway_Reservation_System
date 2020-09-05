package in.diptesh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.diptesh.DAO.TicketDAO;
import in.diptesh.serviceDAO.TicketServiceDAO;

@WebServlet("/PaymentController")
public class PaymentController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

    public PaymentController() {super();}
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("PAYMENT DONE");
		TicketDAO obj = new TicketServiceDAO();
		obj.ticket();
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
		session.setAttribute("resPass","YES");
		
		response.sendRedirect("result");
	}

}
